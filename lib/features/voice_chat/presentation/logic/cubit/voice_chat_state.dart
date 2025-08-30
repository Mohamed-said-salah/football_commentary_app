import 'package:equatable/equatable.dart';
import 'package:football_commentary_app/features/voice_chat/domain/entities/voice_chat_room_entity.dart';

abstract class VoiceChatState extends Equatable {
  const VoiceChatState();

  @override
  List<Object?> get props => [];
}

class VoiceChatInitial extends VoiceChatState {}

class VoiceChatLoading extends VoiceChatState {}

class VoiceChatRoomsLoaded extends VoiceChatState {
  final List<VoiceChatRoomEntity> rooms;

  const VoiceChatRoomsLoaded(this.rooms);

  @override
  List<Object> get props => [rooms];
}

class VoiceChatRoomCreated extends VoiceChatState {
  final VoiceChatRoomEntity room;

  const VoiceChatRoomCreated(this.room);

  @override
  List<Object> get props => [room];
}

class VoiceChatJoined extends VoiceChatState {
  final String roomId;

  const VoiceChatJoined(this.roomId);

  @override
  List<Object> get props => [roomId];
}

class VoiceChatLeft extends VoiceChatState {}

class VoiceChatError extends VoiceChatState {
  final String message;

  const VoiceChatError(this.message);

  @override
  List<Object> get props => [message];
}

// Agora-specific states
class AgoraInitialized extends VoiceChatState {}

class AgoraJoined extends VoiceChatState {
  final String channelName;
  final int uid;

  const AgoraJoined(this.channelName, this.uid);

  @override
  List<Object> get props => [channelName, uid];
}

class AgoraUserJoined extends VoiceChatState {
  final int uid;

  const AgoraUserJoined(this.uid);

  @override
  List<Object> get props => [uid];
}

class AgoraUserLeft extends VoiceChatState {
  final int uid;

  const AgoraUserLeft(this.uid);

  @override
  List<Object> get props => [uid];
}

class AgoraLeft extends VoiceChatState {}

class AgoraError extends VoiceChatState {
  final String message;

  const AgoraError(this.message);

  @override
  List<Object> get props => [message];
}

class VoiceChatParticipantsUpdated extends VoiceChatState {
  final List<Map<String, dynamic>> participants;

  const VoiceChatParticipantsUpdated(this.participants);

  @override
  List<Object> get props => [participants];
}
