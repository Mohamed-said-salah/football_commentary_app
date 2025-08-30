// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MatchModel _$MatchModelFromJson(Map<String, dynamic> json) => _MatchModel(
  id: (json['id'] as num).toInt(),
  homeTeam: json['home_team'] as String,
  awayTeam: json['away_team'] as String,
  homeTeamLogo: json['home_team_logo'] as String?,
  awayTeamLogo: json['away_team_logo'] as String?,
  homeScore: (json['home_score'] as num?)?.toInt(),
  awayScore: (json['away_score'] as num?)?.toInt(),
  status: json['status'] as String,
  date: DateTime.parse(json['date'] as String),
  venue: json['venue'] as String?,
  league: json['league'] as String?,
  leagueLogo: json['league_logo'] as String?,
);

Map<String, dynamic> _$MatchModelToJson(_MatchModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'home_team': instance.homeTeam,
      'away_team': instance.awayTeam,
      'home_team_logo': instance.homeTeamLogo,
      'away_team_logo': instance.awayTeamLogo,
      'home_score': instance.homeScore,
      'away_score': instance.awayScore,
      'status': instance.status,
      'date': instance.date.toIso8601String(),
      'venue': instance.venue,
      'league': instance.league,
      'league_logo': instance.leagueLogo,
    };
