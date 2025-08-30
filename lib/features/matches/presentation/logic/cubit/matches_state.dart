import 'package:equatable/equatable.dart';
import 'package:football_commentary_app/features/matches/domain/entities/match_entity.dart';

abstract class MatchesState extends Equatable {
  const MatchesState();

  @override
  List<Object?> get props => [];
}

class MatchesInitial extends MatchesState {}

class MatchesLoading extends MatchesState {}

class MatchesLoaded extends MatchesState {
  final List<MatchEntity> matches;
  final bool isLive;

  const MatchesLoaded(this.matches, {this.isLive = false});

  @override
  List<Object> get props => [matches, isLive];
}

class MatchesError extends MatchesState {
  final String message;

  const MatchesError(this.message);

  @override
  List<Object> get props => [message];
}

