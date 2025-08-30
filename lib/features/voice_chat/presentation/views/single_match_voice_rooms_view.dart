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

    // Load rooms for this specific match
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
          IconButton(
            onPressed: _refreshRooms,
            icon: Icon(Icons.refresh, color: Colors.white),
            tooltip: 'Refresh Rooms',
          ),
        ],
      ),
      body: BlocListener<VoiceChatCubit, VoiceChatState>(
        listener: _handleStateChanges,
        child: BlocBuilder<VoiceChatCubit, VoiceChatState>(
          builder: (context, state) {
            return Column(
              children: [
                _buildMatchInfoBanner(),
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

  void _handleStateChanges(BuildContext context, VoiceChatState state) {
    if (state is VoiceChatRoomCreated) {
      print('✅ Room created successfully, navigating to room view');
      context.push(Routes.voiceChatRoomView, {
        'roomId': state.room.id,
        'roomName': state.room.name,
      });
      // Refresh rooms after creation
      Future.delayed(const Duration(milliseconds: 500), _refreshRooms);
    } else if (state is VoiceChatError) {
      print('❌ Error occurred: ${state.message}');
      _showErrorSnackBar(state.message);
    } else if (state is AgoraError) {
      print('❌ Agora error: ${state.message}');
      _showErrorSnackBar('Agora error: ${state.message}');
    }
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: AppColors.errorColor),
    );
  }

  Widget _buildMatchInfoBanner() {
    return Container(
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
          Icon(Icons.sports_soccer, color: AppColors.primaryColor, size: 24.sp),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.matchName, style: AppTextStyles.font18BlackBold),
                SizedBox(height: 4.h),
                Text(
                  'Voice Chat Rooms',
                  style: AppTextStyles.font14GreyRegular,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(VoiceChatState state) {
    if (state is VoiceChatLoading) {
      return const _LoadingState();
    } else if (state is VoiceChatRoomsLoaded) {
      return _RoomsListState(
        rooms: state.rooms,
        matchName: widget.matchName,
        onRefresh: _refreshRooms,
        onCreateRoom: () => _showCreateRoomDialog(context),
        onRoomTap: (room) {
          context.push(Routes.voiceChatRoomView, {
            'roomId': room.id,
            'roomName': room.name,
          });
        },
      );
    } else if (state is VoiceChatError) {
      return _ErrorState(message: state.message, onRetry: _refreshRooms);
    } else if (state is AgoraError) {
      return _ErrorState(
        message: 'Agora error: ${state.message}',
        onRetry: _refreshRooms,
      );
    } else {
      return const _InitialState();
    }
  }

  void _showCreateRoomDialog(BuildContext context) {
    final authCubit = getIt<AuthCubit>();
    final isAuthenticated = authCubit.state is AuthAuthenticated;

    if (isAuthenticated) {
      _showAuthenticatedCreateDialog(
        context,
        authCubit.state as AuthAuthenticated,
      );
    } else {
      _showUnauthenticatedCreateDialog(context);
    }
  }

  void _showAuthenticatedCreateDialog(
    BuildContext context,
    AuthAuthenticated authState,
  ) {
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
  }

  void _showUnauthenticatedCreateDialog(BuildContext context) {
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

  void _showCreateRoomForm(BuildContext context) {
    final nameController = TextEditingController();
    final descriptionController = TextEditingController();

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
                  _buildMatchInfoDisplay(),
                  SizedBox(height: 16.h),
                  _buildRoomNameField(nameController),
                  SizedBox(height: 16.h),
                  _buildDescriptionField(descriptionController),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(dialogContext).pop(),
                child: Text('Cancel', style: AppTextStyles.font14GreyRegular),
              ),
              ElevatedButton(
                onPressed:
                    () => _handleCreateRoom(
                      context,
                      nameController,
                      descriptionController,
                      dialogContext,
                    ),
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

  Widget _buildMatchInfoDisplay() {
    return Container(
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.primaryColor),
      ),
      child: Row(
        children: [
          Icon(Icons.sports_soccer, color: AppColors.primaryColor, size: 16.sp),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              'Creating room for: ${widget.matchName}',
              style: AppTextStyles.font14BlackRegular,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRoomNameField(TextEditingController controller) {
    return TextFormField(
      controller: controller,
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
    );
  }

  Widget _buildDescriptionField(TextEditingController controller) {
    return TextFormField(
      controller: controller,
      decoration: const InputDecoration(
        labelText: 'Description (Optional)',
        hintText: 'Enter room description',
        prefixIcon: Icon(Icons.description),
      ),
      maxLines: 3,
      maxLength: 200,
    );
  }

  void _handleCreateRoom(
    BuildContext context,
    TextEditingController nameController,
    TextEditingController descriptionController,
    BuildContext dialogContext,
  ) {
    if (nameController.text.trim().isNotEmpty) {
      final name = nameController.text.trim();
      final description =
          descriptionController.text.trim().isEmpty
              ? null
              : descriptionController.text.trim();

      context.read<VoiceChatCubit>().createRoom(
        name: name,
        description: description,
        matchId: widget.matchId,
        createdBy: 'anonymous',
        createdByName: 'Anonymous User',
      );
      Navigator.of(dialogContext).pop();
    }
  }
}

// State Components
class _LoadingState extends StatelessWidget {
  const _LoadingState();

  @override
  Widget build(BuildContext context) {
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
}

class _InitialState extends StatelessWidget {
  const _InitialState();

  @override
  Widget build(BuildContext context) {
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

class _RoomsListState extends StatelessWidget {
  final List<dynamic> rooms;
  final String matchName;
  final VoidCallback onRefresh;
  final VoidCallback onCreateRoom;
  final Function(dynamic) onRoomTap;

  const _RoomsListState({
    required this.rooms,
    required this.matchName,
    required this.onRefresh,
    required this.onCreateRoom,
    required this.onRoomTap,
  });

  @override
  Widget build(BuildContext context) {
    if (rooms.isEmpty) {
      return _EmptyRoomsState(matchName: matchName, onCreateRoom: onCreateRoom);
    }

    return RefreshIndicator(
      onRefresh: () async => onRefresh(),
      child: ListView.builder(
        padding: EdgeInsets.all(16.w),
        itemCount: rooms.length,
        itemBuilder: (context, index) {
          final room = rooms[index];
          return Padding(
            padding: EdgeInsets.only(bottom: 12.h),
            child: RoomCard(room: room, onTap: () => onRoomTap(room)),
          );
        },
      ),
    );
  }
}

class _EmptyRoomsState extends StatelessWidget {
  final String matchName;
  final VoidCallback onCreateRoom;

  const _EmptyRoomsState({required this.matchName, required this.onCreateRoom});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.mic_off, size: 64.sp, color: AppColors.greyColor),
          SizedBox(height: 16.h),
          Text(
            'No voice chat rooms for this match',
            style: AppTextStyles.font18BlackBold,
          ),
          SizedBox(height: 8.h),
          Text(
            'Create a room to start chatting about $matchName',
            style: AppTextStyles.font14GreyRegular,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 24.h),
          ElevatedButton(
            onPressed: onCreateRoom,
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
}

class _ErrorState extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _ErrorState({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 64.sp, color: AppColors.errorColor),
          SizedBox(height: 16.h),
          Text('Something went wrong', style: AppTextStyles.font18BlackBold),
          SizedBox(height: 8.h),
          Text(
            message,
            style: AppTextStyles.font14GreyRegular,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 24.h),
          ElevatedButton(
            onPressed: onRetry,
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
}
