import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_commentary_app/core/utils/app_colors.dart';
import 'package:football_commentary_app/core/utils/app_text_styles.dart';
import 'package:football_commentary_app/features/matches/domain/entities/match_entity.dart';
import 'package:intl/intl.dart';

class MatchCard extends StatelessWidget {
  final MatchEntity match;
  final VoidCallback? onTap;

  const MatchCard({
    super.key,
    required this.match,
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
            children: [
              // League info
              if (match.league != null) ...[
                Row(
                  children: [
                    if (match.leagueLogo != null)
                      Image.network(
                        match.leagueLogo!,
                        width: 20.w,
                        height: 20.h,
                        errorBuilder: (context, error, stackTrace) =>
                            Icon(Icons.sports_soccer, size: 20.sp),
                      ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Text(
                        match.league!,
                        style: AppTextStyles.font12GreyRegular,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    _buildStatusChip(),
                  ],
                ),
                SizedBox(height: 12.h),
              ],

              // Teams and score
              Row(
                children: [
                  // Home team
                  Expanded(
                    child: Column(
                      children: [
                        if (match.homeTeamLogo != null)
                          Image.network(
                            match.homeTeamLogo!,
                            width: 40.w,
                            height: 40.h,
                            errorBuilder: (context, error, stackTrace) =>
                                Icon(Icons.sports_soccer, size: 40.sp),
                          )
                        else
                          Icon(Icons.sports_soccer, size: 40.sp),
                        SizedBox(height: 8.h),
                        Text(
                          match.homeTeam,
                          style: AppTextStyles.font14BlackRegular,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),

                  // Score or time
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    child: Column(
                      children: [
                        if (match.homeScore != null && match.awayScore != null)
                          Text(
                            '${match.homeScore} - ${match.awayScore}',
                            style: AppTextStyles.font20BlackBold,
                          )
                        else
                          Text(
                            DateFormat('HH:mm').format(match.date),
                            style: AppTextStyles.font16BlackMedium,
                          ),
                        SizedBox(height: 4.h),
                        Text(
                          DateFormat('MMM dd').format(match.date),
                          style: AppTextStyles.font12GreyRegular,
                        ),
                      ],
                    ),
                  ),

                  // Away team
                  Expanded(
                    child: Column(
                      children: [
                        if (match.awayTeamLogo != null)
                          Image.network(
                            match.awayTeamLogo!,
                            width: 40.w,
                            height: 40.h,
                            errorBuilder: (context, error, stackTrace) =>
                                Icon(Icons.sports_soccer, size: 40.sp),
                          )
                        else
                          Icon(Icons.sports_soccer, size: 40.sp),
                        SizedBox(height: 8.h),
                        Text(
                          match.awayTeam,
                          style: AppTextStyles.font14BlackRegular,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // Venue
              if (match.venue != null) ...[
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 16.sp,
                      color: AppColors.textSecondaryColor,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      match.venue!,
                      style: AppTextStyles.font12GreyRegular,
                    ),
                  ],
                ),
              ],

              // Join voice chat button
              SizedBox(height: 12.h),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: onTap,
                  icon: const Icon(Icons.mic, size: 18),
                  label: const Text('Join Voice Chat'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusChip() {
    Color backgroundColor;
    Color textColor;
    String statusText;

    switch (match.status.toUpperCase()) {
      case 'LIVE':
      case '1H':
      case '2H':
      case 'HT':
      case 'ET':
        backgroundColor = AppColors.errorColor;
        textColor = Colors.white;
        statusText = 'LIVE';
        break;
      case 'FT':
      case 'AET':
      case 'PEN':
        backgroundColor = AppColors.successColor;
        textColor = Colors.white;
        statusText = 'FINISHED';
        break;
      case 'NS':
        backgroundColor = AppColors.greyColor;
        textColor = AppColors.textPrimaryColor;
        statusText = 'NOT STARTED';
        break;
      case 'PST':
        backgroundColor = AppColors.warningColor;
        textColor = Colors.white;
        statusText = 'POSTPONED';
        break;
      case 'CANC':
        backgroundColor = AppColors.errorColor;
        textColor = Colors.white;
        statusText = 'CANCELLED';
        break;
      default:
        backgroundColor = AppColors.greyColor;
        textColor = AppColors.textPrimaryColor;
        statusText = match.status;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Text(
        statusText,
        style: AppTextStyles.font12BlackRegular.copyWith(
          color: textColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

