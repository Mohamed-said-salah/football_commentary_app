import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:football_commentary_app/core/error/failures.dart';
import 'package:football_commentary_app/core/networking/api_service.dart';
import 'package:football_commentary_app/features/matches/domain/entities/match_entity.dart';
import 'package:football_commentary_app/features/matches/domain/repos/matches_repo.dart';

class MatchesRepoImpl implements MatchesRepo {
  final ApiService _apiService;

  MatchesRepoImpl(this._apiService);

  @override
  Future<Either<Failure, List<MatchEntity>>> getLiveMatches() async {
    try {
      print('🔍 Fetching LIVE matches');
      final response = await _apiService.getFixtures(live: 'all');
      print(
        '✅ LIVE API Response received. Matches count: ${response.response.length}',
      );

      final matches =
          response.response.map((fixture) {
            try {
              final match = MatchEntity(
                id: fixture.fixture.id,
                homeTeam: fixture.teams.home.name,
                awayTeam: fixture.teams.away.name,
                homeTeamLogo: fixture.teams.home.logo,
                awayTeamLogo: fixture.teams.away.logo,
                homeScore: fixture.goals.home,
                awayScore: fixture.goals.away,
                status: fixture.fixture.status.short,
                date: DateTime.fromMillisecondsSinceEpoch(
                  fixture.fixture.timestamp * 1000,
                ),
                venue: fixture.fixture.venue.name ?? 'Unknown Venue',
                league: fixture.league.name,
                leagueLogo: fixture.league.logo,
              );
              print(
                '🏟️ LIVE: Created match: ${match.homeTeam} vs ${match.awayTeam}',
              );
              return match;
            } catch (e) {
              print('❌ LIVE: Error creating match entity: $e');
              print('❌ LIVE: Fixture data: ${fixture.toString()}');
              rethrow;
            }
          }).toList();

      print('🎯 LIVE: Successfully created ${matches.length} match entities');
      return Right(matches);
    } on DioException catch (e) {
      print('❌ LIVE: DioException: ${e.message}');
      return Left(ServerFailure(e.message ?? 'Server error occurred'));
    } catch (e) {
      print('❌ LIVE: Unexpected error: ${e.toString()}');
      print('❌ LIVE: Error stack trace: ${StackTrace.current}');
      return Left(ServerFailure('Unexpected error occurred: ${e.toString()}'));
    }
  }
}
