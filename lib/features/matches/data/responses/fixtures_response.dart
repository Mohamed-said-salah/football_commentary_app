import 'package:freezed_annotation/freezed_annotation.dart';

part 'fixtures_response.freezed.dart';
part 'fixtures_response.g.dart';

@freezed
abstract class FixturesResponse with _$FixturesResponse {
  const factory FixturesResponse({
    @JsonKey(name: 'get') required String get,
    @JsonKey(name: 'parameters') required Map<String, dynamic> parameters,
    @JsonKey(name: 'errors') required List<dynamic> errors,
    @JsonKey(name: 'results') required int results,
    @JsonKey(name: 'paging') required PagingModel paging,
    @JsonKey(name: 'response') required List<FixtureModel> response,
  }) = _FixturesResponse;

  factory FixturesResponse.fromJson(Map<String, dynamic> json) =>
      _$FixturesResponseFromJson(json);
}

@freezed
abstract class PagingModel with _$PagingModel {
  const factory PagingModel({
    @JsonKey(name: 'current') required int current,
    @JsonKey(name: 'total') required int total,
  }) = _PagingModel;

  factory PagingModel.fromJson(Map<String, dynamic> json) =>
      _$PagingModelFromJson(json);
}

@freezed
abstract class FixtureModel with _$FixtureModel {
  const factory FixtureModel({
    @JsonKey(name: 'fixture') required FixtureDetailsModel fixture,
    @JsonKey(name: 'league') required LeagueModel league,
    @JsonKey(name: 'teams') required TeamsModel teams,
    @JsonKey(name: 'goals') required GoalsModel goals,
    @JsonKey(name: 'score') required ScoreModel score,
  }) = _FixtureModel;

  factory FixtureModel.fromJson(Map<String, dynamic> json) =>
      _$FixtureModelFromJson(json);
}

@freezed
abstract class FixtureDetailsModel with _$FixtureDetailsModel {
  const factory FixtureDetailsModel({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'referee') String? referee,
    @JsonKey(name: 'timezone') required String timezone,
    @JsonKey(name: 'date') required String date,
    @JsonKey(name: 'timestamp') required int timestamp,
    @JsonKey(name: 'periods') required PeriodsModel periods,
    @JsonKey(name: 'venue') required VenueModel venue,
    @JsonKey(name: 'status') required StatusModel status,
  }) = _FixtureDetailsModel;

  factory FixtureDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$FixtureDetailsModelFromJson(json);
}

@freezed
abstract class PeriodsModel with _$PeriodsModel {
  const factory PeriodsModel({
    @JsonKey(name: 'first') int? first,
    @JsonKey(name: 'second') int? second,
  }) = _PeriodsModel;

  factory PeriodsModel.fromJson(Map<String, dynamic> json) =>
      _$PeriodsModelFromJson(json);
}

@freezed
abstract class VenueModel with _$VenueModel {
  const factory VenueModel({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'city') String? city,
  }) = _VenueModel;

  factory VenueModel.fromJson(Map<String, dynamic> json) =>
      _$VenueModelFromJson(json);
}

@freezed
abstract class StatusModel with _$StatusModel {
  const factory StatusModel({
    @JsonKey(name: 'long') required String long,
    @JsonKey(name: 'short') required String short,
    @JsonKey(name: 'elapsed') int? elapsed,
  }) = _StatusModel;

  factory StatusModel.fromJson(Map<String, dynamic> json) =>
      _$StatusModelFromJson(json);
}

@freezed
abstract class LeagueModel with _$LeagueModel {
  const factory LeagueModel({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'country') required String country,
    @JsonKey(name: 'logo') required String logo,
    @JsonKey(name: 'flag') String? flag,
    @JsonKey(name: 'season') required int season,
    @JsonKey(name: 'round') required String round,
  }) = _LeagueModel;

  factory LeagueModel.fromJson(Map<String, dynamic> json) =>
      _$LeagueModelFromJson(json);
}

@freezed
abstract class TeamsModel with _$TeamsModel {
  const factory TeamsModel({
    @JsonKey(name: 'home') required TeamModel home,
    @JsonKey(name: 'away') required TeamModel away,
  }) = _TeamsModel;

  factory TeamsModel.fromJson(Map<String, dynamic> json) =>
      _$TeamsModelFromJson(json);
}

@freezed
abstract class TeamModel with _$TeamModel {
  const factory TeamModel({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'logo') required String logo,
    @JsonKey(name: 'winner') bool? winner,
  }) = _TeamModel;

  factory TeamModel.fromJson(Map<String, dynamic> json) =>
      _$TeamModelFromJson(json);
}

@freezed
abstract class GoalsModel with _$GoalsModel {
  const factory GoalsModel({
    @JsonKey(name: 'home') int? home,
    @JsonKey(name: 'away') int? away,
  }) = _GoalsModel;

  factory GoalsModel.fromJson(Map<String, dynamic> json) =>
      _$GoalsModelFromJson(json);
}

@freezed
abstract class ScoreModel with _$ScoreModel {
  const factory ScoreModel({
    @JsonKey(name: 'halftime') required GoalsModel halftime,
    @JsonKey(name: 'fulltime') required GoalsModel fulltime,
    @JsonKey(name: 'extratime') required GoalsModel extratime,
    @JsonKey(name: 'penalty') required GoalsModel penalty,
  }) = _ScoreModel;

  factory ScoreModel.fromJson(Map<String, dynamic> json) =>
      _$ScoreModelFromJson(json);
}
