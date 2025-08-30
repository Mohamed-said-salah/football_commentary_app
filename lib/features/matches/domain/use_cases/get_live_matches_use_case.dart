import 'package:dartz/dartz.dart';
import 'package:football_commentary_app/core/error/failures.dart';
import 'package:football_commentary_app/features/matches/domain/entities/match_entity.dart';
import 'package:football_commentary_app/features/matches/domain/repos/matches_repo.dart';

class GetLiveMatchesUseCase {
  final MatchesRepo _matchesRepo;

  GetLiveMatchesUseCase(this._matchesRepo);

  Future<Either<Failure, List<MatchEntity>>> call() async {
    return await _matchesRepo.getLiveMatches();
  }
}

