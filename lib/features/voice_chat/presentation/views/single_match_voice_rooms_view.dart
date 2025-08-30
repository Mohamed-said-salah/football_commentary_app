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

    // Initialize Agora
    context.read<VoiceChatCubit>().initializeAgora();

    // Load rooms for this specific match
    context.read<VoiceChatCubit>().getRoomsByMatch(widget.matchId);
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
      ),
      body: BlocListener<VoiceChatCubit, VoiceChatState>(
        listener: (context, state) {
          if (state is VoiceChatRoomCreated) {
            // Navigate to the created room
            Navigator.of(context).pushNamed(
              Routes.voiceChatRoomView,
              arguments: {'roomId': state.room.id, 'roomName': state.room.name},
            );
          } else if (state is VoiceChatError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: AppColors.errorColor,
              ),
            );
          }
        },
        child: BlocBuilder<VoiceChatCubit, VoiceChatState>(
          builder: (context, state) {
            if (state is VoiceChatLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is VoiceChatRoomsLoaded) {
              if (state.rooms.isEmpty) {
                return Center(
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
                        'No voice chat rooms for this match',
                        style: AppTextStyles.font18BlackBold,
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        'Create a room to start chatting about ${widget.matchName}',
                        style: AppTextStyles.font14GreyRegular,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              }

              return RefreshIndicator(
                onRefresh: () async {
                  context.read<VoiceChatCubit>().getRoomsByMatch(
                    widget.matchId,
                  );
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
                          arguments: {'roomId': room.id, 'roomName': room.name},
                        );
                      },
                    );
                  },
                ),
              );
            }

            return const Center(child: Text('Loading rooms...'));
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

  void _showCreateRoomDialog(BuildContext context) {
    final authCubit = getIt<AuthCubit>();
    final isAuthenticated = authCubit.state is AuthAuthenticated;

    if (isAuthenticated) {
      // User is authenticated, show full dialog
      final authState = authCubit.state as AuthAuthenticated;

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
      // User is not authenticated, show simplified form
      _showCreateRoomForm(context);
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
                  // Match info
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

                    context.read<VoiceChatCubit>().createRoom(
                      name: name,
                      description: description,
                      matchId: widget.matchId,
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
}
