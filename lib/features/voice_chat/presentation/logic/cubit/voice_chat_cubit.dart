import 'dart:async';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:football_commentary_app/core/env/environment_variables.dart';
import 'package:football_commentary_app/features/voice_chat/domain/use_cases/create_room_use_case.dart';
import 'package:football_commentary_app/features/voice_chat/domain/use_cases/get_rooms_use_case.dart';
import 'package:football_commentary_app/features/voice_chat/domain/use_cases/join_room_use_case.dart';
import 'package:football_commentary_app/features/voice_chat/domain/use_cases/leave_room_use_case.dart';
import 'package:football_commentary_app/features/voice_chat/domain/use_cases/get_room_participants_use_case.dart';
import 'package:football_commentary_app/features/voice_chat/presentation/logic/cubit/voice_chat_state.dart';

class VoiceChatCubit extends Cubit<VoiceChatState> {
  final CreateRoomUseCase _createRoomUseCase;
  final GetRoomsUseCase _getRoomsUseCase;
  final JoinRoomUseCase _joinRoomUseCase;
  final LeaveRoomUseCase _leaveRoomUseCase;
  final GetRoomParticipantsUseCase _getRoomParticipantsUseCase;

  RtcEngine? _engine;
  StreamSubscription? _roomsSubscription;
  String? _currentChannelName;
  int? _currentUid;
  final Set<int> _remoteUsers = {};
  List<Map<String, dynamic>> _roomParticipants = [];

  VoiceChatCubit({
    required CreateRoomUseCase createRoomUseCase,
    required GetRoomsUseCase getRoomsUseCase,
    required JoinRoomUseCase joinRoomUseCase,
    required LeaveRoomUseCase leaveRoomUseCase,
    required GetRoomParticipantsUseCase getRoomParticipantsUseCase,
  }) : _createRoomUseCase = createRoomUseCase,
       _getRoomsUseCase = getRoomsUseCase,
       _joinRoomUseCase = joinRoomUseCase,
       _leaveRoomUseCase = leaveRoomUseCase,
       _getRoomParticipantsUseCase = getRoomParticipantsUseCase,
       super(VoiceChatInitial());

  Future<void> initializeAgora() async {
    try {
      print('🔍 Agora: Starting initialization...');
      print('🔍 Agora: App ID from env: ${EnvironmentVariables.agoraAppId}');

      if (EnvironmentVariables.agoraAppId.isEmpty) {
        print('❌ Agora: App ID is empty! Check your .env file');
        emit(AgoraError('Agora App ID is not configured'));
        return;
      }

      // Request microphone permission
      print('🔍 Agora: Requesting microphone permission...');
      await [Permission.microphone].request();
      print('✅ Agora: Microphone permission granted');

      // Create Agora RTC engine
      print('🔍 Agora: Creating RTC engine...');
      _engine = createAgoraRtcEngine();
      print('✅ Agora: RTC engine created');

      print('🔍 Agora: Initializing RTC engine...');
      await _engine!.initialize(
        RtcEngineContext(
          appId: EnvironmentVariables.agoraAppId,
          channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
        ),
      );
      print('✅ Agora: RTC engine initialized');

      // Set up event handlers
      print('🔍 Agora: Setting up event handlers...');
      _engine!.registerEventHandler(
        RtcEngineEventHandler(
          onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
            print(
              '✅ Agora: Joined channel successfully: ${connection.channelId}',
            );
            _currentChannelName = connection.channelId;
            _currentUid = connection.localUid;
            emit(AgoraJoined(connection.channelId!, connection.localUid!));
          },
          onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
            print('✅ Agora: User joined: $remoteUid');
            _remoteUsers.add(remoteUid);
            emit(AgoraUserJoined(remoteUid));
          },
          onUserOffline: (
            RtcConnection connection,
            int remoteUid,
            UserOfflineReasonType reason,
          ) {
            print('✅ Agora: User left: $remoteUid');
            _remoteUsers.remove(remoteUid);
            emit(AgoraUserLeft(remoteUid));
          },
          onError: (ErrorCodeType err, String msg) {
            print('❌ Agora: Error occurred: $err - $msg');
            emit(AgoraError('Agora error: $msg'));
          },
        ),
      );
      print('✅ Agora: Event handlers registered');

      emit(AgoraInitialized());
      print('🎯 Agora: Initialization completed successfully');
    } catch (e) {
      print('❌ Agora: Initialization failed: $e');
      emit(AgoraError('Failed to initialize Agora: ${e.toString()}'));
    }
  }

  Future<void> getRooms() async {
    print('🔍 VoiceChat Cubit: Getting all rooms...');
    emit(VoiceChatLoading());

    final result = await _getRoomsUseCase();
    result.fold(
      (failure) {
        print('❌ VoiceChat Cubit: Failed to get rooms: ${failure.message}');
        emit(VoiceChatError(failure.message));
      },
      (rooms) {
        print('✅ VoiceChat Cubit: Got ${rooms.length} rooms');
        emit(VoiceChatRoomsLoaded(rooms));
      },
    );
  }

  Future<void> getRoomsByMatch(int matchId) async {
    print('🔍 VoiceChat Cubit: Getting rooms for match ID: $matchId');
    emit(VoiceChatLoading());

    final result = await _getRoomsUseCase.getRoomsByMatch(matchId);
    result.fold(
      (failure) {
        print('❌ VoiceChat Cubit: Failed to get rooms for match $matchId: ${failure.message}');
        emit(VoiceChatError(failure.message));
      },
      (rooms) {
        print('✅ VoiceChat Cubit: Got ${rooms.length} rooms for match $matchId');
        emit(VoiceChatRoomsLoaded(rooms));
      },
    );
  }

  void getRoomsStream() {
    print('🔍 VoiceChat Cubit: Setting up all rooms stream');
    _roomsSubscription?.cancel();
    
    // First, emit loading state
    emit(VoiceChatLoading());
    
    // Set up the stream
    _roomsSubscription = _getRoomsUseCase.getRoomsStream().listen(
      (rooms) {
        print('✅ VoiceChat Cubit: Stream received ${rooms.length} rooms');
        emit(VoiceChatRoomsLoaded(rooms));
      },
      onError: (error) {
        print('❌ VoiceChat Cubit: Stream error: $error');
        emit(VoiceChatError('Stream error: ${error.toString()}'));
      },
    );
    
    // Also fetch rooms immediately to ensure we have data
    _fetchAllRooms();
  }

  void getRoomsByMatchStream(int matchId) {
    print('🔍 VoiceChat Cubit: Setting up rooms stream for match ID: $matchId');
    _roomsSubscription?.cancel();
    
    // First, emit loading state
    emit(VoiceChatLoading());
    
    // Set up the stream
    _roomsSubscription = _getRoomsUseCase.getRoomsByMatchStream(matchId).listen(
      (rooms) {
        print('✅ VoiceChat Cubit: Stream received ${rooms.length} rooms for match $matchId');
        emit(VoiceChatRoomsLoaded(rooms));
      },
      onError: (error) {
        print('❌ VoiceChat Cubit: Stream error for match $matchId: $error');
        emit(VoiceChatError('Stream error: ${error.toString()}'));
      },
    );
    
    // Also fetch rooms immediately to ensure we have data
    _fetchRoomsForMatch(matchId);
  }

  // Helper method to fetch rooms for a specific match
  Future<void> _fetchRoomsForMatch(int matchId) async {
    try {
      print('🔍 VoiceChat Cubit: Fetching rooms for match $matchId immediately...');
      final result = await _getRoomsUseCase.getRoomsByMatch(matchId);
      result.fold(
        (failure) {
          print('❌ VoiceChat Cubit: Failed to fetch rooms for match $matchId: ${failure.message}');
          emit(VoiceChatError(failure.message));
        },
        (rooms) {
          print('✅ VoiceChat Cubit: Immediately fetched ${rooms.length} rooms for match $matchId');
          emit(VoiceChatRoomsLoaded(rooms));
        },
      );
    } catch (e) {
      print('❌ VoiceChat Cubit: Error fetching rooms for match $matchId: $e');
      emit(VoiceChatError('Failed to fetch rooms: ${e.toString()}'));
    }
  }

  // Helper method to fetch all rooms
  Future<void> _fetchAllRooms() async {
    try {
      print('🔍 VoiceChat Cubit: Fetching all rooms immediately...');
      final result = await _getRoomsUseCase();
      result.fold(
        (failure) {
          print('❌ VoiceChat Cubit: Failed to fetch all rooms: ${failure.message}');
          emit(VoiceChatError(failure.message));
        },
        (rooms) {
          print('✅ VoiceChat Cubit: Immediately fetched ${rooms.length} rooms');
          emit(VoiceChatRoomsLoaded(rooms));
        },
      );
    } catch (e) {
      print('❌ VoiceChat Cubit: Error fetching all rooms: $e');
      emit(VoiceChatError('Failed to fetch rooms: ${e.toString()}'));
    }
  }

  Future<void> createRoom({
    required String name,
    String? description,
    int? matchId,
    required String createdBy,
    required String createdByName,
  }) async {
    print('🔍 VoiceChat Cubit: Creating room: $name');
    emit(VoiceChatLoading());

    final result = await _createRoomUseCase(
      name: name,
      description: description,
      matchId: matchId,
      createdBy: createdBy,
      createdByName: createdByName,
    );

    result.fold(
      (failure) {
        print('❌ VoiceChat Cubit: Failed to create room: ${failure.message}');
        emit(VoiceChatError(failure.message));
      },
      (room) {
        print('✅ VoiceChat Cubit: Room created successfully: ${room.name}');
        emit(VoiceChatRoomCreated(room));
      },
    );
  }

  Future<void> joinVoiceChannel(String channelName) async {
    if (_engine == null) {
      emit(const AgoraError('Agora engine not initialized'));
      return;
    }

    try {
      await _engine!.joinChannel(
        token:
            '', // Use empty token for testing, implement token server for production
        channelId: channelName,
        uid: 0, // Let Agora assign UID
        options: const ChannelMediaOptions(
          autoSubscribeAudio: true,
          publishMicrophoneTrack: true,
          clientRoleType: ClientRoleType.clientRoleBroadcaster,
        ),
      );
    } catch (e) {
      emit(AgoraError('Failed to join voice channel: ${e.toString()}'));
    }
  }

  Future<void> leaveVoiceChannel() async {
    if (_engine == null) return;

    try {
      await _engine!.leaveChannel();
      _remoteUsers.clear();
      _currentChannelName = null;
      _currentUid = null;
      emit(AgoraLeft());
    } catch (e) {
      emit(AgoraError('Failed to leave voice channel: ${e.toString()}'));
    }
  }

  Future<void> joinRoom(String roomId, String userId, {String? userName}) async {
    final result = await _joinRoomUseCase(roomId, userId, userName: userName);
    result.fold(
      (failure) => emit(VoiceChatError(failure.message)),
      (_) async {
        emit(VoiceChatJoined(roomId));
        // Load participants after joining
        await _loadRoomParticipants(roomId);
      },
    );
  }

  Future<void> leaveRoom(String roomId, String userId) async {
    final result = await _leaveRoomUseCase(roomId, userId);
    result.fold(
      (failure) => emit(VoiceChatError(failure.message)),
      (_) => emit(VoiceChatLeft()),
    );
  }

  Future<void> toggleMute() async {
    if (_engine == null) return;

    try {
      await _engine!.muteLocalAudioStream(true);
    } catch (e) {
      emit(AgoraError('Failed to toggle mute: ${e.toString()}'));
    }
  }

  Future<void> toggleUnmute() async {
    if (_engine == null) return;

    try {
      await _engine!.muteLocalAudioStream(false);
    } catch (e) {
      emit(AgoraError('Failed to toggle unmute: ${e.toString()}'));
    }
  }

  Set<int> get remoteUsers => _remoteUsers;
  String? get currentChannelName => _currentChannelName;
  int? get currentUid => _currentUid;
  List<Map<String, dynamic>> get roomParticipants => _roomParticipants;

  Future<void> _loadRoomParticipants(String roomId) async {
    final result = await _getRoomParticipantsUseCase(roomId);
    result.fold(
      (failure) {
        print('❌ VoiceChat Cubit: Failed to load participants: ${failure.message}');
      },
      (participants) {
        _roomParticipants = participants;
        print('✅ VoiceChat Cubit: Loaded ${participants.length} participants');
        // Emit a state to notify UI about participants update
        emit(VoiceChatParticipantsUpdated(participants));
      },
    );
  }

  @override
  Future<void> close() async {
    _roomsSubscription?.cancel();
    await _engine?.leaveChannel();
    await _engine?.release();
    return super.close();
  }
}
