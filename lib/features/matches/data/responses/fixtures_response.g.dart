// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fixtures_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FixturesResponse _$FixturesResponseFromJson(Map<String, dynamic> json) =>
    _FixturesResponse(
      get: json['get'] as String,
      parameters: json['parameters'] as Map<String, dynamic>,
      errors: json['errors'] as List<dynamic>,
      results: (json['results'] as num).toInt(),
      paging: PagingModel.fromJson(json['paging'] as Map<String, dynamic>),
      response:
          (json['response'] as List<dynamic>)
              .map((e) => FixtureModel.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$FixturesResponseToJson(_FixturesResponse instance) =>
    <String, dynamic>{
      'get': instance.get,
      'parameters': instance.parameters,
      'errors': instance.errors,
      'results': instance.results,
      'paging': instance.paging,
      'response': instance.response,
    };

_PagingModel _$PagingModelFromJson(Map<String, dynamic> json) => _PagingModel(
  current: (json['current'] as num).toInt(),
  total: (json['total'] as num).toInt(),
);

Map<String, dynamic> _$PagingModelToJson(_PagingModel instance) =>
    <String, dynamic>{'current': instance.current, 'total': instance.total};

_FixtureModel _$FixtureModelFromJson(Map<String, dynamic> json) =>
    _FixtureModel(
      fixture: FixtureDetailsModel.fromJson(
        json['fixture'] as Map<String, dynamic>,
      ),
      league: LeagueModel.fromJson(json['league'] as Map<String, dynamic>),
      teams: TeamsModel.fromJson(json['teams'] as Map<String, dynamic>),
      goals: GoalsModel.fromJson(json['goals'] as Map<String, dynamic>),
      score: ScoreModel.fromJson(json['score'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FixtureModelToJson(_FixtureModel instance) =>
    <String, dynamic>{
      'fixture': instance.fixture,
      'league': instance.league,
      'teams': instance.teams,
      'goals': instance.goals,
      'score': instance.score,
    };

_FixtureDetailsModel _$FixtureDetailsModelFromJson(Map<String, dynamic> json) =>
    _FixtureDetailsModel(
      id: (json['id'] as num).toInt(),
      referee: json['referee'] as String?,
      timezone: json['timezone'] as String,
      date: json['date'] as String,
      timestamp: (json['timestamp'] as num).toInt(),
      periods: PeriodsModel.fromJson(json['periods'] as Map<String, dynamic>),
      venue: VenueModel.fromJson(json['venue'] as Map<String, dynamic>),
      status: StatusModel.fromJson(json['status'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FixtureDetailsModelToJson(
  _FixtureDetailsModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'referee': instance.referee,
  'timezone': instance.timezone,
  'date': instance.date,
  'timestamp': instance.timestamp,
  'periods': instance.periods,
  'venue': instance.venue,
  'status': instance.status,
};

_PeriodsModel _$PeriodsModelFromJson(Map<String, dynamic> json) =>
    _PeriodsModel(
      first: (json['first'] as num?)?.toInt(),
      second: (json['second'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PeriodsModelToJson(_PeriodsModel instance) =>
    <String, dynamic>{'first': instance.first, 'second': instance.second};

_VenueModel _$VenueModelFromJson(Map<String, dynamic> json) => _VenueModel(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  city: json['city'] as String?,
);

Map<String, dynamic> _$VenueModelToJson(_VenueModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'city': instance.city,
    };

_StatusModel _$StatusModelFromJson(Map<String, dynamic> json) => _StatusModel(
  long: json['long'] as String,
  short: json['short'] as String,
  elapsed: (json['elapsed'] as num?)?.toInt(),
);

Map<String, dynamic> _$StatusModelToJson(_StatusModel instance) =>
    <String, dynamic>{
      'long': instance.long,
      'short': instance.short,
      'elapsed': instance.elapsed,
    };

_LeagueModel _$LeagueModelFromJson(Map<String, dynamic> json) => _LeagueModel(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  country: json['country'] as String,
  logo: json['logo'] as String,
  flag: json['flag'] as String?,
  season: (json['season'] as num).toInt(),
  round: json['round'] as String,
);

Map<String, dynamic> _$LeagueModelToJson(_LeagueModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'country': instance.country,
      'logo': instance.logo,
      'flag': instance.flag,
      'season': instance.season,
      'round': instance.round,
    };

_TeamsModel _$TeamsModelFromJson(Map<String, dynamic> json) => _TeamsModel(
  home: TeamModel.fromJson(json['home'] as Map<String, dynamic>),
  away: TeamModel.fromJson(json['away'] as Map<String, dynamic>),
);

Map<String, dynamic> _$TeamsModelToJson(_TeamsModel instance) =>
    <String, dynamic>{'home': instance.home, 'away': instance.away};

_TeamModel _$TeamModelFromJson(Map<String, dynamic> json) => _TeamModel(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  logo: json['logo'] as String,
  winner: json['winner'] as bool?,
);

Map<String, dynamic> _$TeamModelToJson(_TeamModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo': instance.logo,
      'winner': instance.winner,
    };

_GoalsModel _$GoalsModelFromJson(Map<String, dynamic> json) => _GoalsModel(
  home: (json['home'] as num?)?.toInt(),
  away: (json['away'] as num?)?.toInt(),
);

Map<String, dynamic> _$GoalsModelToJson(_GoalsModel instance) =>
    <String, dynamic>{'home': instance.home, 'away': instance.away};

_ScoreModel _$ScoreModelFromJson(Map<String, dynamic> json) => _ScoreModel(
  halftime: GoalsModel.fromJson(json['halftime'] as Map<String, dynamic>),
  fulltime: GoalsModel.fromJson(json['fulltime'] as Map<String, dynamic>),
  extratime: GoalsModel.fromJson(json['extratime'] as Map<String, dynamic>),
  penalty: GoalsModel.fromJson(json['penalty'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ScoreModelToJson(_ScoreModel instance) =>
    <String, dynamic>{
      'halftime': instance.halftime,
      'fulltime': instance.fulltime,
      'extratime': instance.extratime,
      'penalty': instance.penalty,
    };
