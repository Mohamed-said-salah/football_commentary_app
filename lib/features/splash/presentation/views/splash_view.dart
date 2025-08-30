import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_commentary_app/core/di/dependency_injection.dart';
import 'package:football_commentary_app/core/extensions/context_extensions.dart';
import 'package:football_commentary_app/core/router/routes.dart';
import 'package:football_commentary_app/core/utils/app_colors.dart';
import 'package:football_commentary_app/core/utils/app_text_styles.dart';
import 'package:football_commentary_app/features/auth/presentation/logic/cubit/auth_cubit.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _checkAuthStatus();
  }

  void _checkAuthStatus() async {
    print('🚀 SPLASH VIEW: Starting authentication check...');
    await Future.delayed(const Duration(seconds: 2));

    if (mounted) {
      final authCubit = getIt<AuthCubit>();

      // Wait for auth cubit to initialize
      print('🚀 SPLASH VIEW: Waiting for auth cubit initialization...');
      await Future.delayed(const Duration(milliseconds: 500));

      // Check if user is logged in
      final isLoggedIn = await authCubit.isUserLoggedIn();
      print('🚀 SPLASH VIEW: User logged in: $isLoggedIn');

      if (mounted) {
        if (isLoggedIn) {
          print('🚀 SPLASH VIEW: User is authenticated, navigating to matches');
          context.pushAndRemoveUntil(Routes.matchesView, {});
        } else {
          print('🚀 SPLASH VIEW: User not authenticated, navigating to login');
          context.pushAndRemoveUntil(Routes.loginView, {});
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // App Logo
            Container(
              width: 120.w,
              height: 120.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(60.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Icon(
                Icons.sports_soccer,
                size: 60.sp,
                color: AppColors.primaryColor,
              ),
            ),

            SizedBox(height: 24.h),

            // App Name
            Text(
              'Football Commentary',
              style: AppTextStyles.font24BlackBold.copyWith(
                color: Colors.white,
              ),
            ),

            SizedBox(height: 8.h),

            Text(
              'Live matches & voice chat',
              style: AppTextStyles.font16WhiteMedium.copyWith(
                color: Colors.white.withOpacity(0.8),
              ),
            ),

            SizedBox(height: 48.h),

            // Loading indicator
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
