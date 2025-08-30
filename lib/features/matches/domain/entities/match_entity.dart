import 'package:equatable/equatable.dart';

class MatchEntity extends Equatable {
  final int id;
  final String homeTeam;
  final String awayTeam;
  final String? homeTeamLogo;
  final String? awayTeamLogo;
  final int? homeScore;
  final int? awayScore;
  final String status;
  final DateTime date;
  final String? venue;
  final String? league;
  final String? leagueLogo;

  const MatchEntity({
    required this.id,
    required this.homeTeam,
    required this.awayTeam,
    this.homeTeamLogo,
    this.awayTeamLogo,
    this.homeScore,
    this.awayScore,
    required this.status,
    required this.date,
    this.venue,
    this.league,
    this.leagueLogo,
  });

  @override
  List<Object?> get props => [
        id,
        homeTeam,
        awayTeam,
        homeTeamLogo,
        awayTeamLogo,
        homeScore,
        awayScore,
        status,
        date,
        venue,
        league,
        leagueLogo,
      ];
}

