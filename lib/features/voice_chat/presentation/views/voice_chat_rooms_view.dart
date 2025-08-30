import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_commentary_app/core/di/dependency_injection.dart';
import 'package:football_commentary_app/core/router/routes.dart';
import 'package:football_commentary_app/core/utils/app_colors.dart';
import 'package:football_commentary_app/core/utils/app_text_styles.dart';
import 'package:football_commentary_app/features/auth/presentation/logic/cubit/auth_cubit.dart';
import 'package:football_commentary_app/features/auth/presentation/logic/cubit/auth_state.dart';
import 'package:football_commentary_app/features/voice_chat/presentation/logic/cubit/voice_chat_cubit.dart';
import 'package:football_commentary_app/features/voice_chat/presentation/logic/cubit/voice_chat_state.dart';
import 'package:football_commentary_app/features/voice_chat/presentation/views/widgets/room_card.dart';
import 'package:football_commentary_app/features/voice_chat/presentation/views/widgets/create_room_dialog.dart';

class VoiceChatRoomsView extends StatefulWidget {
  final int? matchId;
  final String? matchName;

  const VoiceChatRoomsView({super.key, this.matchId, this.matchName});

  @override
  State<VoiceChatRoomsView> createState() => _VoiceChatRoomsViewState();
}

class _VoiceChatRoomsViewState extends State<VoiceChatRoomsView> {
  int? _selectedMatchId;
  String _selectedMatchName = 'All Matches';

  @override
  void initState() {
    super.initState();
    print('🚀 VOICE CHAT ROOMS VIEW: INIT STATE CALLED');
    print(
      '🚀 VOICE CHAT ROOMS VIEW: Widget matchId: ${widget.matchId}, matchName: ${widget.matchName}',
    );

    // Initialize Agora first
    context.read<VoiceChatCubit>().initializeAgora();

    // Set initial match selection based on widget parameters
    if (widget.matchId != null && widget.matchName != null) {
      _selectedMatchId = widget.matchId;
      _selectedMatchName = widget.matchName!;
      print(
        '🚀 VOICE CHAT ROOMS VIEW: Initializing with specific match: $_selectedMatchId - $_selectedMatchName',
      );

      // Get rooms for specific match
      context.read<VoiceChatCubit>().getRoomsByMatchStream(widget.matchId!);
    } else {
      print('🚀 VOICE CHAT ROOMS VIEW: Initializing with all matches');
      // Get all rooms
      context.read<VoiceChatCubit>().getRoomsStream();
    }
  }

  void _onMatchSelected(int? matchId, String matchName) {
    setState(() {
      _selectedMatchId = matchId;
      _selectedMatchName = matchName;
    });

    print(
      '🚀 VOICE CHAT ROOMS VIEW: Match selected - ID: $matchId, Name: $matchName',
    );

    if (matchId != null) {
      // Get rooms for specific match
      context.read<VoiceChatCubit>().getRoomsByMatchStream(matchId);
    } else {
      // Get all rooms
      context.read<VoiceChatCubit>().getRoomsStream();
    }
  }

  @override
  Widget build(BuildContext context) {
    print('🚀 VOICE CHAT ROOMS VIEW: BUILD METHOD CALLED');

    return Scaffold(
      appBar: AppBar(
        title: Text('Voice Chat Rooms', style: AppTextStyles.font18WhiteBold),
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
      ),
      body: BlocListener<VoiceChatCubit, VoiceChatState>(
        listener: (context, state) {
          print('🚀 VOICE CHAT ROOMS VIEW: STATE CHANGED: $state');
          print('🚀 VOICE CHAT ROOMS VIEW: State type: ${state.runtimeType}');

          if (state is VoiceChatRoomCreated) {
            print('✅ VoiceChat View: Room created, navigating to room view');
            // Navigate to the created room
            Navigator.of(context).pushNamed(
              Routes.voiceChatRoomView,
              arguments: {'roomId': state.room.id, 'roomName': state.room.name},
            );
          } else if (state is VoiceChatError) {
            print('❌ VoiceChat View: Error occurred: ${state.message}');
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: AppColors.errorColor,
              ),
            );
          } else if (state is AgoraError) {
            print('❌ VoiceChat View: Agora error: ${state.message}');
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Agora error: ${state.message}'),
                backgroundColor: AppColors.errorColor,
              ),
            );
          } else if (state is AgoraInitialized) {
            print('✅ VoiceChat View: Agora initialized successfully');
          } else if (state is VoiceChatRoomsLoaded) {
            print(
              '✅ VoiceChat View: Rooms loaded: ${state.rooms.length} rooms',
            );
            print(
              '✅ VoiceChat View: Room names: ${state.rooms.map((r) => r.name).toList()}',
            );
          } else if (state is VoiceChatInitial) {
            print('🚀 VoiceChat View: Initial state');
          }
        },
        child: BlocBuilder<VoiceChatCubit, VoiceChatState>(
          builder: (context, state) {
            print('🚀 VOICE CHAT ROOMS VIEW: Building with state: $state');
            print(
              '🚀 VOICE CHAT ROOMS VIEW: Current selected match: $_selectedMatchId - $_selectedMatchName',
            );

            if (state is VoiceChatLoading) {
              print('🚀 VOICE CHAT ROOMS VIEW: Showing loading state');
              return const Center(child: CircularProgressIndicator());
            } else if (state is VoiceChatRoomsLoaded) {
              print(
                '🚀 VOICE CHAT ROOMS VIEW: Showing rooms loaded state with ${state.rooms.length} rooms',
              );
              return Column(
                children: [
                  // Match Selector
                  Container(
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Select Match',
                                style: AppTextStyles.font16BlackMedium,
                              ),
                            ),
                            // Debug button to create test room
                            if (_selectedMatchId != null)
                              ElevatedButton(
                                onPressed: () => _createTestRoom(),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orange,
                                  foregroundColor: Colors.white,
                                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                                ),
                                child: Text('Test Room', style: TextStyle(fontSize: 12.sp)),
                              ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12.w,
                                  vertical: 8.h,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColors.greyColor,
                                  ),
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.sports_soccer,
                                      color: AppColors.primaryColor,
                                      size: 20.sp,
                                    ),
                                    SizedBox(width: 8.w),
                                    Expanded(
                                      child: Text(
                                        _selectedMatchName,
                                        style: AppTextStyles.font14BlackRegular,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_drop_down,
                                      color: AppColors.greyColor,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 8.w),
                            ElevatedButton(
                              onPressed:
                                  () => _showMatchSelectionDialog(context),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primaryColor,
                                foregroundColor: Colors.white,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16.w,
                                  vertical: 8.h,
                                ),
                              ),
                              child: Text('Change'),
                            ),
                          ],
                        ),
                        // Show current context info
                        if (_selectedMatchId != null) ...[
                          SizedBox(height: 8.h),
                          Container(
                            padding: EdgeInsets.all(8.w),
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.info_outline,
                                  color: AppColors.primaryColor,
                                  size: 16.sp,
                                ),
                                SizedBox(width: 8.w),
                                Expanded(
                                  child: Text(
                                    'Showing voice chat rooms for: $_selectedMatchName',
                                    style: AppTextStyles.font12GreyRegular,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ] else ...[
                          SizedBox(height: 8.h),
                          Container(
                            padding: EdgeInsets.all(8.w),
                            decoration: BoxDecoration(
                              color: AppColors.greyColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.info_outline,
                                  color: AppColors.greyColor,
                                  size: 16.sp,
                                ),
                                SizedBox(width: 8.w),
                                Expanded(
                                  child: Text(
                                    'Showing all voice chat rooms',
                                    style: AppTextStyles.font12GreyRegular,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),

                  // Rooms List
                  Expanded(
                    child:
                        state.rooms.isEmpty
                            ? Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.mic_off,
                                    size: 64.sp,
                                    color: AppColors.greyColor,
                                  ),
                                  SizedBox(height: 16.h),
                                  Text(
                                    _selectedMatchId != null
                                        ? 'No voice chat rooms for this match'
                                        : 'No voice chat rooms',
                                    style: AppTextStyles.font18BlackBold,
                                  ),
                                  SizedBox(height: 8.h),
                                  Text(
                                    _selectedMatchId != null
                                        ? 'Create a room to start chatting about this match'
                                        : 'Create a room to start chatting',
                                    style: AppTextStyles.font14GreyRegular,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            )
                            : RefreshIndicator(
                              onRefresh: () async {
                                if (_selectedMatchId != null) {
                                  context
                                      .read<VoiceChatCubit>()
                                      .getRoomsByMatch(_selectedMatchId!);
                                } else {
                                  context.read<VoiceChatCubit>().getRooms();
                                }
                              },
                              child: ListView.builder(
                                padding: EdgeInsets.all(16.w),
                                itemCount: state.rooms.length,
                                itemBuilder: (context, index) {
                                  final room = state.rooms[index];
                                  return RoomCard(
                                    room: room,
                                    onTap: () {
                                      Navigator.of(context).pushNamed(
                                        Routes.voiceChatRoomView,
                                        arguments: {
                                          'roomId': room.id,
                                          'roomName': room.name,
                                        },
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                  ),
                ],
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('🚀 VOICE CHAT ROOMS VIEW: + BUTTON PRESSED!');
          _showCreateRoomDialog(context);
        },
        backgroundColor: AppColors.primaryColor,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  void _showCreateRoomDialog(BuildContext context) {
    print('🚀 VOICE CHAT ROOMS VIEW: _showCreateRoomDialog called');

    // Check if user is authenticated
    final authCubit = getIt<AuthCubit>();
    final isAuthenticated = authCubit.state is AuthAuthenticated;

    if (isAuthenticated) {
      // User is authenticated, show full dialog
      final authState = authCubit.state as AuthAuthenticated;
      print('✅ VoiceChat View: User is authenticated: ${authState.user.name}');

      showDialog(
        context: context,
        builder:
            (dialogContext) => BlocProvider.value(
              value: context.read<VoiceChatCubit>(),
              child: CreateRoomDialog(
                user: authState.user,
                matchId: _selectedMatchId,
                matchName: _selectedMatchName,
                onCreateRoom: (name, description, matchId) {
                  print('🔍 VoiceChat View: Create room callback triggered');
                  print(
                    '🔍 VoiceChat View: Room name: $name, description: $description, matchId: $matchId',
                  );
                  context.read<VoiceChatCubit>().createRoom(
                    name: name,
                    description: description,
                    matchId: matchId ?? _selectedMatchId,
                    createdBy: authState.user.id,
                    createdByName: authState.user.name,
                  );
                  Navigator.of(dialogContext).pop();
                },
              ),
            ),
      );
    } else {
      // User is not authenticated, show simplified dialog or message
      print(
        '❌ VoiceChat View: User is not authenticated, showing simplified dialog',
      );

      showDialog(
        context: context,
        builder:
            (dialogContext) => AlertDialog(
              title: Text(
                'Create Voice Chat Room',
                style: AppTextStyles.font18BlackBold,
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.info_outline,
                    size: 48.sp,
                    color: AppColors.primaryColor,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'You can create voice chat rooms without signing in!',
                    style: AppTextStyles.font14BlackRegular,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(dialogContext).pop(),
                  child: Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(dialogContext).pop();
                    _showCreateRoomForm(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    foregroundColor: Colors.white,
                  ),
                  child: Text('Continue'),
                ),
              ],
            ),
      );
    }
  }

  void _showCreateRoomForm(BuildContext context) {
    final _nameController = TextEditingController();
    final _descriptionController = TextEditingController();

    showDialog(
      context: context,
      builder:
          (dialogContext) => AlertDialog(
            title: Text(
              'Create Voice Chat Room',
              style: AppTextStyles.font18BlackBold,
            ),
            content: Form(
              key: GlobalKey<FormState>(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Match Selection
                  if (_selectedMatchId != null) ...[
                    Container(
                      padding: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(color: AppColors.primaryColor),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.sports_soccer,
                            color: AppColors.primaryColor,
                            size: 16.sp,
                          ),
                          SizedBox(width: 8.w),
                          Expanded(
                            child: Text(
                              'Creating room for: $_selectedMatchName',
                              style: AppTextStyles.font14BlackRegular,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.h),
                  ],

                  // Room name field
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'Room Name',
                      hintText: 'Enter room name',
                      prefixIcon: Icon(Icons.meeting_room),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter a room name';
                      }
                      if (value.trim().length < 3) {
                        return 'Room name must be at least 3 characters';
                      }
                      return null;
                    },
                    maxLength: 50,
                  ),
                  SizedBox(height: 16.h),

                  // Description field
                  TextFormField(
                    controller: _descriptionController,
                    decoration: const InputDecoration(
                      labelText: 'Description (Optional)',
                      hintText: 'Enter room description',
                      prefixIcon: Icon(Icons.description),
                    ),
                    maxLines: 3,
                    maxLength: 200,
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(dialogContext).pop(),
                child: Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_nameController.text.trim().isNotEmpty) {
                    final name = _nameController.text.trim();
                    final description =
                        _descriptionController.text.trim().isEmpty
                            ? null
                            : _descriptionController.text.trim();

                    print(
                      '🔍 VoiceChat View: Creating room - name: $name, description: $description, matchId: $_selectedMatchId',
                    );
                    context.read<VoiceChatCubit>().createRoom(
                      name: name,
                      description: description,
                      matchId: _selectedMatchId,
                      createdBy:
                          'anonymous_${DateTime.now().millisecondsSinceEpoch}',
                      createdByName: 'Anonymous User',
                    );
                    Navigator.of(dialogContext).pop();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  foregroundColor: Colors.white,
                ),
                child: Text('Create Room'),
              ),
            ],
          ),
    );
  }

  void _showMatchSelectionDialog(BuildContext context) {
    final List<Map<String, dynamic>> matches = [
      {'id': null, 'name': 'All Matches'},
      {'id': 1, 'name': 'Manchester United vs Liverpool'},
      {'id': 2, 'name': 'Barcelona vs Real Madrid'},
      {'id': 3, 'name': 'Bayern Munich vs Borussia Dortmund'},
      {'id': 4, 'name': 'PSG vs Marseille'},
      {'id': 5, 'name': 'Arsenal vs Chelsea'},
    ];

    showDialog(
      context: context,
      builder:
          (dialogContext) => AlertDialog(
            title: Text('Select Match', style: AppTextStyles.font18BlackBold),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Current selection info
                if (_selectedMatchId != null) ...[
                  Container(
                    padding: EdgeInsets.all(8.w),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(color: AppColors.primaryColor),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.check_circle,
                          color: AppColors.primaryColor,
                          size: 16.sp,
                        ),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: Text(
                            'Currently viewing: $_selectedMatchName',
                            style: AppTextStyles.font14BlackRegular,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),
                ],

                // Matches list
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: matches.length,
                  itemBuilder: (context, index) {
                    final match = matches[index];
                    final isSelected = match['id'] == _selectedMatchId;

                    return ListTile(
                      title: Text(
                        match['name'] as String,
                        style: TextStyle(
                          fontWeight:
                              isSelected ? FontWeight.bold : FontWeight.normal,
                          color: isSelected ? AppColors.primaryColor : null,
                        ),
                      ),
                      leading:
                          isSelected
                              ? Icon(
                                Icons.check_circle,
                                color: AppColors.primaryColor,
                              )
                              : Icon(
                                Icons.radio_button_unchecked,
                                color: AppColors.greyColor,
                              ),
                      onTap: () {
                        _onMatchSelected(
                          match['id'] as int?,
                          match['name'] as String,
                        );
                        Navigator.of(dialogContext).pop();
                      },
                    );
                  },
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(dialogContext).pop(),
                child: Text('Cancel'),
              ),
              if (_selectedMatchId != null)
                TextButton(
                  onPressed: () {
                    _onMatchSelected(null, 'All Matches');
                    Navigator.of(dialogContext).pop();
                  },
                  child: Text('Clear Selection'),
                ),
            ],
          ),
    );
  }

  void _createTestRoom() {
    print('🚀 VOICE CHAT ROOMS VIEW: Creating test room for match: $_selectedMatchId');
    final authCubit = getIt<AuthCubit>();
    final isAuthenticated = authCubit.state is AuthAuthenticated;

    if (isAuthenticated) {
      final authState = authCubit.state as AuthAuthenticated;
      print('✅ VoiceChat View: User is authenticated for test room: ${authState.user.name}');
      context.read<VoiceChatCubit>().createRoom(
        name: 'Test Room for $_selectedMatchName',
        description: 'This is a test room for debugging.',
        matchId: _selectedMatchId,
        createdBy: authState.user.id,
        createdByName: authState.user.name,
      );
    } else {
      print('❌ VoiceChat View: User is not authenticated for test room, creating anonymous test room');
      context.read<VoiceChatCubit>().createRoom(
        name: 'Test Room for $_selectedMatchName',
        description: 'This is a test room for debugging.',
        matchId: _selectedMatchId,
        createdBy: 'anonymous_test_${DateTime.now().millisecondsSinceEpoch}',
        createdByName: 'Anonymous Test User',
      );
    }
  }
}
