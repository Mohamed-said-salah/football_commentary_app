import 'package:dartz/dartz.dart';
import 'package:football_commentary_app/core/error/failures.dart';
import 'package:football_commentary_app/features/matches/domain/entities/match_entity.dart';

abstract class MatchesRepo {
  Future<Either<Failure, List<MatchEntity>>> getLiveMatches();
}
