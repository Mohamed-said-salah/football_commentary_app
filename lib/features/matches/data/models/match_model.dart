import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:football_commentary_app/features/matches/domain/entities/match_entity.dart';

part 'match_model.freezed.dart';
part 'match_model.g.dart';

@freezed
abstract class MatchModel with _$MatchModel {
  const factory MatchModel({
    required int id,
    @JsonKey(name: 'home_team') required String homeTeam,
    @JsonKey(name: 'away_team') required String awayTeam,
    @JsonKey(name: 'home_team_logo') String? homeTeamLogo,
    @JsonKey(name: 'away_team_logo') String? awayTeamLogo,
    @JsonKey(name: 'home_score') int? homeScore,
    @JsonKey(name: 'away_score') int? awayScore,
    required String status,
    required DateTime date,
    String? venue,
    String? league,
    @JsonKey(name: 'league_logo') String? leagueLogo,
  }) = _MatchModel;

  factory MatchModel.fromJson(Map<String, dynamic> json) =>
      _$MatchModelFromJson(json);
}

extension MatchModelX on MatchModel {
  MatchEntity toEntity() {
    return MatchEntity(
      id: id,
      homeTeam: homeTeam,
      awayTeam: awayTeam,
      homeTeamLogo: homeTeamLogo,
      awayTeamLogo: awayTeamLogo,
      homeScore: homeScore,
      awayScore: awayScore,
      status: status,
      date: date,
      venue: venue,
      league: league,
      leagueLogo: leagueLogo,
    );
  }
}
