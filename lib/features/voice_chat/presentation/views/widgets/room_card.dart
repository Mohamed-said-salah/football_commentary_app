import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_commentary_app/core/utils/app_colors.dart';
import 'package:football_commentary_app/core/utils/app_text_styles.dart';
import 'package:football_commentary_app/features/voice_chat/domain/entities/voice_chat_room_entity.dart';
import 'package:intl/intl.dart';

class RoomCard extends StatelessWidget {
  final VoiceChatRoomEntity room;
  final VoidCallback? onTap;

  const RoomCard({
    super.key,
    required this.room,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 12.h),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.r),
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Room header
              Row(
                children: [
                  // Room icon
                  Container(
                    padding: EdgeInsets.all(8.w),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Icon(
                      Icons.mic,
                      size: 24.sp,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  
                  SizedBox(width: 12.w),
                  
                  // Room info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          room.name,
                          style: AppTextStyles.font16BlackMedium,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          'Created by ${room.createdByName}',
                          style: AppTextStyles.font12GreyRegular,
                        ),
                      ],
                    ),
                  ),
                  
                  // Status indicator
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: room.isActive ? AppColors.successColor : AppColors.greyColor,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Text(
                      room.isActive ? 'Active' : 'Inactive',
                      style: AppTextStyles.font12BlackRegular.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              
              // Description
              if (room.description != null && room.description!.isNotEmpty) ...[
                SizedBox(height: 12.h),
                Text(
                  room.description!,
                  style: AppTextStyles.font14BlackRegular,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
              
              SizedBox(height: 12.h),
              
              // Room details
              Row(
                children: [
                  // Participants count
                  Icon(
                    Icons.people,
                    size: 16.sp,
                    color: AppColors.textSecondaryColor,
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    '${room.participantCount}/${room.maxParticipants}',
                    style: AppTextStyles.font12GreyRegular,
                  ),
                  
                  SizedBox(width: 16.w),
                  
                  // Created time
                  Icon(
                    Icons.access_time,
                    size: 16.sp,
                    color: AppColors.textSecondaryColor,
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    _formatTime(room.createdAt),
                    style: AppTextStyles.font12GreyRegular,
                  ),
                  
                  const Spacer(),
                  
                  // Join button
                  ElevatedButton(
                    onPressed: room.isActive && room.participantCount < room.maxParticipants
                        ? onTap
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      minimumSize: Size(0, 32.h),
                    ),
                    child: Text(
                      room.participantCount >= room.maxParticipants ? 'Full' : 'Join',
                      style: AppTextStyles.font12BlackRegular.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inMinutes < 1) {
      return 'Just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}d ago';
    } else {
      return DateFormat('MMM dd').format(dateTime);
    }
  }
}

