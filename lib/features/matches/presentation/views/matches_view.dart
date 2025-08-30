import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_commentary_app/core/extensions/context_extensions.dart';
import 'package:football_commentary_app/core/router/routes.dart';
import 'package:football_commentary_app/core/utils/app_colors.dart';
import 'package:football_commentary_app/core/utils/app_text_styles.dart';
import 'package:football_commentary_app/features/matches/presentation/logic/cubit/matches_cubit.dart';
import 'package:football_commentary_app/features/matches/presentation/logic/cubit/matches_state.dart';
import 'package:football_commentary_app/features/matches/presentation/views/widgets/match_card.dart';
import 'package:football_commentary_app/features/auth/presentation/logic/cubit/auth_cubit.dart';
import 'package:football_commentary_app/core/di/dependency_injection.dart';

class MatchesView extends StatefulWidget {
  const MatchesView({super.key});

  @override
  State<MatchesView> createState() => _MatchesViewState();
}

class _MatchesViewState extends State<MatchesView> {
  @override
  void initState() {
    super.initState();

    // Load live matches by default
    context.read<MatchesCubit>().getLiveMatches();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Live Football Matches',
          style: AppTextStyles.font18WhiteBold,
        ),
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onSelected: (value) {
              if (value == 'logout') {
                getIt<AuthCubit>().signOut();
                context.pushAndRemoveUntil(Routes.loginView, {});
              }
            },
            itemBuilder:
                (context) => [
                  const PopupMenuItem(value: 'logout', child: Text('Logout')),
                ],
          ),
        ],
      ),
      body: _buildMatchesList(),
    );
  }

  Widget _buildMatchesList() {
    return BlocBuilder<MatchesCubit, MatchesState>(
      builder: (context, state) {
        if (state is MatchesLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is MatchesError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error_outline,
                  size: 64.sp,
                  color: AppColors.errorColor,
                ),
                SizedBox(height: 16.h),
                Text(
                  'Error loading live matches',
                  style: AppTextStyles.font18BlackBold,
                ),
                SizedBox(height: 8.h),
                Text(
                  state.message,
                  style: AppTextStyles.font14GreyRegular,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16.h),
                ElevatedButton(
                  onPressed: () {
                    context.read<MatchesCubit>().getLiveMatches();
                  },
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        } else if (state is MatchesLoaded) {
          if (state.matches.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.sports_soccer,
                    size: 64.sp,
                    color: AppColors.greyColor,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'No live matches right now',
                    style: AppTextStyles.font18BlackBold,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Check back later for live matches',
                    style: AppTextStyles.font14GreyRegular,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16.h),
                  ElevatedButton(
                    onPressed: () {
                      context.read<MatchesCubit>().getLiveMatches();
                    },
                    child: const Text('Refresh'),
                  ),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () async {
              await context.read<MatchesCubit>().getLiveMatches();
            },
            child: ListView.builder(
              padding: EdgeInsets.all(16.w),
              itemCount: state.matches.length,
              itemBuilder: (context, index) {
                final match = state.matches[index];
                return MatchCard(
                  match: match,
                  onTap: () {
                    // Navigate to single match voice chat rooms
                    final matchName = '${match.homeTeam} vs ${match.awayTeam}';
                    context.push(Routes.singleMatchVoiceRoomsView, {
                      'matchId': match.id,
                      'matchName': matchName,
                    });
                  },
                );
              },
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
