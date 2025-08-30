import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_commentary_app/core/di/dependency_injection.dart';
import 'package:football_commentary_app/core/utils/app_colors.dart';
import 'package:football_commentary_app/core/utils/app_text_styles.dart';
import 'package:football_commentary_app/features/auth/presentation/logic/cubit/auth_cubit.dart';
import 'package:football_commentary_app/features/auth/presentation/logic/cubit/auth_state.dart';
import 'package:football_commentary_app/features/voice_chat/presentation/logic/cubit/voice_chat_cubit.dart';
import 'package:football_commentary_app/features/voice_chat/presentation/logic/cubit/voice_chat_state.dart';

class VoiceChatRoomView extends StatefulWidget {
  final String roomId;
  final String roomName;

  const VoiceChatRoomView({
    super.key,
    required this.roomId,
    required this.roomName,
  });

  @override
  State<VoiceChatRoomView> createState() => _VoiceChatRoomViewState();
}

class _VoiceChatRoomViewState extends State<VoiceChatRoomView> {
  bool _isMuted = false;
  bool _isJoined = false;

  @override
  void initState() {
    super.initState();
    _initializeAndJoin();
  }

  Future<void> _initializeAndJoin() async {
    final cubit = context.read<VoiceChatCubit>();
    await cubit.initializeAgora();
    await cubit.joinVoiceChannel(widget.roomId);

    // Join room in Firebase
    final authCubit = getIt<AuthCubit>();
    final authState = authCubit.state;
    if (authState is AuthAuthenticated) {
      await cubit.joinRoom(
        widget.roomId,
        authState.user.id,
        userName: authState.user.name,
      );
    }
  }

  @override
  void dispose() {
    _leaveRoom();
    super.dispose();
  }

  Future<void> _leaveRoom() async {
    final cubit = context.read<VoiceChatCubit>();
    await cubit.leaveVoiceChannel();

    // Leave room in Firebase
    final authCubit = getIt<AuthCubit>();
    final authState = authCubit.state;
    if (authState is AuthAuthenticated) {
      await cubit.leaveRoom(widget.roomId, authState.user.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await _leaveRoom();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.roomName, style: AppTextStyles.font18WhiteBold),
          backgroundColor: AppColors.primaryColor,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () async {
              await _leaveRoom();
              Navigator.of(context).pop();
            },
          ),
        ),
        body: BlocListener<VoiceChatCubit, VoiceChatState>(
          listener: (context, state) {
            if (state is AgoraJoined) {
              setState(() {
                _isJoined = true;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Joined voice chat successfully'),
                  backgroundColor: Colors.green,
                ),
              );
            } else if (state is AgoraLeft) {
              setState(() {
                _isJoined = false;
              });
            } else if (state is AgoraError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: AppColors.errorColor,
                ),
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
          child: Column(
            children: [
              // Connection status
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.w),
                color:
                    _isJoined ? AppColors.successColor : AppColors.warningColor,
                child: Text(
                  _isJoined ? 'Connected to voice chat' : 'Connecting...',
                  style: AppTextStyles.font14BlackRegular.copyWith(
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              // Participants list
              Expanded(
                child: BlocBuilder<VoiceChatCubit, VoiceChatState>(
                  builder: (context, state) {
                    final cubit = context.read<VoiceChatCubit>();
                    final remoteUsers = cubit.remoteUsers;
                    final currentUid = cubit.currentUid;

                    return Column(
                      children: [
                        SizedBox(height: 32.h),

                        // Room info
                        Icon(
                          Icons.mic,
                          size: 80.sp,
                          color: AppColors.primaryColor,
                        ),

                        SizedBox(height: 16.h),

                        Text(
                          widget.roomName,
                          style: AppTextStyles.font24BlackBold,
                          textAlign: TextAlign.center,
                        ),

                        SizedBox(height: 8.h),

                        Text(
                          '${remoteUsers.length + (currentUid != null ? 1 : 0)} participants',
                          style: AppTextStyles.font16BlackMedium,
                        ),

                        SizedBox(height: 32.h),

                        // Participants grid
                        if (currentUid != null || remoteUsers.isNotEmpty)
                          Expanded(
                            child: BlocBuilder<VoiceChatCubit, VoiceChatState>(
                              builder: (context, state) {
                                final cubit = context.read<VoiceChatCubit>();
                                final participants = cubit.roomParticipants;

                                return GridView.builder(
                                  padding: EdgeInsets.all(16.w),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        crossAxisSpacing: 16.w,
                                        mainAxisSpacing: 16.h,
                                        childAspectRatio: 1,
                                      ),
                                  itemCount:
                                      remoteUsers.length +
                                      (currentUid != null ? 1 : 0),
                                  itemBuilder: (context, index) {
                                    final isCurrentUser =
                                        index == 0 && currentUid != null;
                                    final uid =
                                        isCurrentUser
                                            ? currentUid!
                                            : remoteUsers.elementAt(
                                              index -
                                                  (currentUid != null ? 1 : 0),
                                            );

                                    // Find participant info
                                    String displayName = 'Unknown User';
                                    if (isCurrentUser) {
                                      final authCubit = getIt<AuthCubit>();
                                      final authState = authCubit.state;
                                      if (authState is AuthAuthenticated) {
                                        displayName = authState.user.name;
                                      }
                                    } else {
                                      // Find remote user info from participants
                                      final participant = participants
                                          .firstWhere(
                                            (p) =>
                                                p['user_id'] == uid.toString(),
                                            orElse:
                                                () => {
                                                  'user_name': 'User $uid',
                                                },
                                          );
                                      displayName =
                                          participant['user_name'] ??
                                          'User $uid';
                                    }

                                    return _buildParticipantCard(
                                      uid: uid,
                                      isCurrentUser: isCurrentUser,
                                      isMuted: isCurrentUser ? _isMuted : false,
                                      displayName: displayName,
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ),

              // Controls
              Container(
                padding: EdgeInsets.all(24.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, -5),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Mute/Unmute button
                    FloatingActionButton(
                      onPressed: _toggleMute,
                      backgroundColor:
                          _isMuted
                              ? AppColors.errorColor
                              : AppColors.primaryColor,
                      child: Icon(
                        _isMuted ? Icons.mic_off : Icons.mic,
                        color: Colors.white,
                      ),
                    ),

                    // Leave button
                    FloatingActionButton(
                      onPressed: () async {
                        await _leaveRoom();
                        Navigator.of(context).pop();
                      },
                      backgroundColor: AppColors.errorColor,
                      child: const Icon(Icons.call_end, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildParticipantCard({
    required int uid,
    required bool isCurrentUser,
    required bool isMuted,
    required String displayName,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightGreyColor,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: isCurrentUser ? AppColors.primaryColor : AppColors.greyColor,
          width: 2,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 24.r,
                backgroundColor: AppColors.primaryColor,
                child: Text(
                  isCurrentUser
                      ? 'You'
                      : displayName.isNotEmpty
                      ? displayName.substring(0, 1).toUpperCase()
                      : uid.toString().substring(0, 2),
                  style: AppTextStyles.font14BlackRegular.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              if (isMuted)
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(2.w),
                    decoration: const BoxDecoration(
                      color: AppColors.errorColor,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.mic_off,
                      size: 12.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            isCurrentUser ? 'You' : displayName,
            style: AppTextStyles.font12BlackRegular,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Future<void> _toggleMute() async {
    final cubit = context.read<VoiceChatCubit>();
    if (_isMuted) {
      await cubit.toggleUnmute();
    } else {
      await cubit.toggleMute();
    }
    setState(() {
      _isMuted = !_isMuted;
    });
  }
}
