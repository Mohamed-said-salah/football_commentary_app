import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_commentary_app/core/utils/app_colors.dart';
import 'package:football_commentary_app/core/utils/app_text_styles.dart';
import 'package:football_commentary_app/features/auth/domain/entities/user_entity.dart';

class CreateRoomDialog extends StatefulWidget {
  final UserEntity user;
  final int? matchId;
  final String? matchName;
  final Function(String name, String? description, int? matchId) onCreateRoom;

  const CreateRoomDialog({
    super.key,
    required this.user,
    this.matchId,
    this.matchName,
    required this.onCreateRoom,
  });

  @override
  State<CreateRoomDialog> createState() => _CreateRoomDialogState();
}

class _CreateRoomDialogState extends State<CreateRoomDialog> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Create Voice Chat Room',
        style: AppTextStyles.font18BlackBold,
      ),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Match Selection Display
            if (widget.matchId != null && widget.matchName != null) ...[
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
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Cancel', style: AppTextStyles.font14GreyRegular),
        ),
        ElevatedButton(
          onPressed: _createRoom,
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
    );
  }

  void _createRoom() {
    print('🔍 CreateRoomDialog: _createRoom method called');
    if (_formKey.currentState!.validate()) {
      print('✅ CreateRoomDialog: Form validation passed');
      final name = _nameController.text.trim();
      final description =
          _descriptionController.text.trim().isEmpty
              ? null
              : _descriptionController.text.trim();

      print(
        '🔍 CreateRoomDialog: Calling onCreateRoom with name: $name, description: $description, matchId: ${widget.matchId}',
      );
      widget.onCreateRoom(name, description, widget.matchId);
    } else {
      print('❌ CreateRoomDialog: Form validation failed');
    }
  }
}
