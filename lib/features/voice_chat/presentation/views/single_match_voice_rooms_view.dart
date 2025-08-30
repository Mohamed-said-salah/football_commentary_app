import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_commentary_app/core/di/dependency_injection.dart';
import 'package:football_commentary_app/core/extensions/context_extensions.dart';
import 'package:football_commentary_app/core/router/routes.dart';
import 'package:football_commentary_app/core/utils/app_colors.dart';
import 'package:football_commentary_app/core/utils/app_text_styles.dart';
import 'package:football_commentary_app/features/auth/presentation/logic/cubit/auth_cubit.dart';
import 'package:football_commentary_app/features/auth/presentation/logic/cubit/auth_state.dart';
import 'package:football_commentary_app/features/voice_chat/presentation/logic/cubit/voice_chat_cubit.dart';
import 'package:football_commentary_app/features/voice_chat/presentation/logic/cubit/voice_chat_state.dart';
import 'package:football_commentary_app/features/voice_chat/presentation/views/widgets/room_card.dart';
import 'package:football_commentary_app/features/voice_chat/presentation/views/widgets/create_room_dialog.dart';

class SingleMatchVoiceRoomsView extends StatefulWidget {
  final int matchId;
  final String matchName;

  const SingleMatchVoiceRoomsView({
    super.key,
    required this.matchId,
    required this.matchName,
  });

  @override
  State<SingleMatchVoiceRoomsView> createState() =>
      _SingleMatchVoiceRoomsViewState();
}

class _SingleMatchVoiceRoomsViewState extends State<SingleMatchVoiceRoomsView> {
  @override
  void initState() {
    super.initState();
    print(
      '🚀 SINGLE MATCH VOICE ROOMS: Initializing for match ${widget.matchId} - ${widget.matchName}',
    );

    // Initialize Agora first
    context.read<VoiceChatCubit>().initializeAgora();

    // Load rooms for this specific match - use non-stream method for initial load
    _loadRooms();
  }

  void _loadRooms() {
    print('🔄 Loading rooms for match ${widget.matchId}');
    context.read<VoiceChatCubit>().getRoomsByMatch(widget.matchId);
  }

  void _refreshRooms() {
    print('🔄 Refreshing rooms for match ${widget.matchId}');
    _loadRooms();
  }

  void _showCreateRoomDialog(BuildContext context) {
    print('🚀 SINGLE MATCH VOICE ROOMS: _showCreateRoomDialog called');

    // Check if user is authenticated
    final authCubit = getIt<AuthCubit>();
    final isAuthenticated = authCubit.state is AuthAuthenticated;

    if (isAuthenticated) {
      // User is authenticated, show full dialog
      final authState = authCubit.state as AuthAuthenticated;
      print(
        '✅ Single Match Voice Rooms: User is authenticated: ${authState.user.name}',
      );
      print('🔍 User details:');
      print('  - ID: ${authState.user.id}');
      print('  - Name: "${authState.user.name}"');
      print('  - Email: ${authState.user.email}');
      print('  - Photo URL: ${authState.user.photoUrl}');

      showDialog(
        context: context,
        builder:
            (dialogContext) => BlocProvider.value(
              value: context.read<VoiceChatCubit>(),
              child: CreateRoomDialog(
                user: authState.user,
                matchId: widget.matchId,
                matchName: widget.matchName,
                onCreateRoom: (name, description, matchId) {
                  print(
                    '🔍 Single Match Voice Rooms: Create room callback triggered',
                  );
                  print(
                    '🔍 Single Match Voice Rooms: Room name: $name, description: $description, matchId: $matchId',
                  );
                  print(
                    '🔍 Creating room with user: ${authState.user.name} (${authState.user.id})',
                  );

                  context.read<VoiceChatCubit>().createRoom(
                    name: name,
                    description: description,
                    matchId: matchId ?? widget.matchId,
                    createdBy: authState.user.id,
                    createdByName: authState.user.name,
                  );
                  Navigator.of(dialogContext).pop();
                },
              ),
            ),
      );
    } else {
      // User is not authenticated, show simplified dialog
      print(
        '❌ Single Match Voice Rooms: User is not authenticated, showing simplified dialog',
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
                  // Match info display
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
                            'Creating room for: ${widget.matchName}',
                            style: AppTextStyles.font14BlackRegular,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),
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
                child: Text('Cancel', style: AppTextStyles.font14GreyRegular),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_nameController.text.trim().isNotEmpty) {
                    final name = _nameController.text.trim();
                    final description =
                        _descriptionController.text.trim().isEmpty
                            ? null
                            : _descriptionController.text.trim();

                    context.read<VoiceChatCubit>().createRoom(
                      name: name,
                      description: description,
                      matchId: widget.matchId,
                      createdBy: 'anonymous',
                      createdByName: 'Anonymous User',
                    );
                    Navigator.of(dialogContext).pop();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  foregroundColor: Colors.white,
                ),
                child: Text(
                  'Create Room',
                  style: AppTextStyles.font14BlackRegular.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Voice Chat - ${widget.matchName}',
          style: AppTextStyles.font18WhiteBold,
        ),
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        actions: [
          // Back to all rooms button
          IconButton(
            icon: Icon(Icons.list, color: Colors.white),
            onPressed: () {
              context.push(Routes.allVoiceChatRoomsView, {});
            },
            tooltip: 'View All Rooms',
          ),
        ],
      ),
      body: BlocListener<VoiceChatCubit, VoiceChatState>(
        listener: (context, state) {
          print(
            '🔍 Single Match Voice Rooms: State changed to: ${state.runtimeType}',
          );

          if (state is VoiceChatRoomCreated) {
            print('✅ Room created successfully, navigating to room view');
            // Navigate to the created room
            context.push(Routes.voiceChatRoomView, {
              'roomId': state.room.id,
              'roomName': state.room.name,
            });
            // Refresh the rooms list after creation
            Future.delayed(const Duration(milliseconds: 500), () {
              _refreshRooms();
            });
          } else if (state is VoiceChatError) {
            print('❌ Error occurred: ${state.message}');
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: AppColors.errorColor,
              ),
            );
          } else if (state is AgoraError) {
            print('❌ Agora error: ${state.message}');
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Agora error: ${state.message}'),
                backgroundColor: AppColors.errorColor,
              ),
            );
          }
        },
        child: BlocBuilder<VoiceChatCubit, VoiceChatState>(
          builder: (context, state) {
            print(
              '🔍 Single Match Voice Rooms: Building with state: ${state.runtimeType}',
            );

            return Column(
              children: [
                // Match info banner - always visible
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(0.1),
                    border: Border(
                      bottom: BorderSide(
                        color: AppColors.primaryColor.withOpacity(0.2),
                        width: 1,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.sports_soccer,
                        color: AppColors.primaryColor,
                        size: 24.sp,
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.matchName,
                              style: AppTextStyles.font18BlackBold,
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              'Voice Chat Rooms',
                              style: AppTextStyles.font14GreyRegular,
                            ),
                          ],
                        ),
                      ),
                      // Refresh button
                      IconButton(
                        onPressed: _refreshRooms,
                        icon: Icon(
                          Icons.refresh,
                          color: AppColors.primaryColor,
                          size: 20.sp,
                        ),
                        tooltip: 'Refresh Rooms',
                      ),
                    ],
                  ),
                ),

                // Content area
                Expanded(child: _buildContent(state)),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showCreateRoomDialog(context),
        backgroundColor: AppColors.primaryColor,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildContent(VoiceChatState state) {
    if (state is VoiceChatLoading) {
      return _buildLoadingState();
    } else if (state is VoiceChatRoomsLoaded) {
      return _buildRoomsList(state.rooms);
    } else if (state is VoiceChatError) {
      return _buildErrorState(state.message);
    } else if (state is AgoraError) {
      return _buildErrorState('Agora error: ${state.message}');
    } else {
      // Initial state or any other state
      return _buildInitialState();
    }
  }

  Widget _buildLoadingState() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 16),
          Text('Loading rooms...'),
        ],
      ),
    );
  }

  Widget _buildRoomsList(List<dynamic> rooms) {
    if (rooms.isEmpty) {
      return _buildNoRoomsState();
    }

    return RefreshIndicator(
      onRefresh: () async => _refreshRooms(),
      child: ListView.builder(
        padding: EdgeInsets.all(16.w),
        itemCount: rooms.length,
        itemBuilder: (context, index) {
          final room = rooms[index];
          return Padding(
            padding: EdgeInsets.only(bottom: 12.h),
            child: RoomCard(
              room: room,
              onTap: () {
                print('🔍 Tapping on room: ${room.name}');
                context.push(Routes.voiceChatRoomView, {
                  'roomId': room.id,
                  'roomName': room.name,
                });
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildNoRoomsState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.mic_off, size: 64.sp, color: AppColors.greyColor),
          SizedBox(height: 16.h),
          Text(
            'No voice chat rooms for this match',
            style: AppTextStyles.font18BlackBold,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.h),
          Text(
            'Create a room to start chatting about ${widget.matchName}',
            style: AppTextStyles.font14GreyRegular,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 24.h),
          ElevatedButton(
            onPressed: () => _showCreateRoomDialog(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
            ),
            child: Text('Create First Room'),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 64.sp, color: AppColors.errorColor),
          SizedBox(height: 16.h),
          Text(
            'Something went wrong',
            style: AppTextStyles.font18BlackBold,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.h),
          Text(
            message,
            style: AppTextStyles.font14GreyRegular,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 24.h),
          ElevatedButton(
            onPressed: _refreshRooms,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
            ),
            child: Text('Try Again'),
          ),
        ],
      ),
    );
  }

  Widget _buildInitialState() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 16),
          Text('Initializing...'),
        ],
      ),
    );
  }
}
