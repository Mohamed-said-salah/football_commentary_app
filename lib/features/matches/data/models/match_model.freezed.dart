// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MatchModel {

 int get id;@JsonKey(name: 'home_team') String get homeTeam;@JsonKey(name: 'away_team') String get awayTeam;@JsonKey(name: 'home_team_logo') String? get homeTeamLogo;@JsonKey(name: 'away_team_logo') String? get awayTeamLogo;@JsonKey(name: 'home_score') int? get homeScore;@JsonKey(name: 'away_score') int? get awayScore; String get status; DateTime get date; String? get venue; String? get league;@JsonKey(name: 'league_logo') String? get leagueLogo;
/// Create a copy of MatchModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatchModelCopyWith<MatchModel> get copyWith => _$MatchModelCopyWithImpl<MatchModel>(this as MatchModel, _$identity);

  /// Serializes this MatchModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchModel&&(identical(other.id, id) || other.id == id)&&(identical(other.homeTeam, homeTeam) || other.homeTeam == homeTeam)&&(identical(other.awayTeam, awayTeam) || other.awayTeam == awayTeam)&&(identical(other.homeTeamLogo, homeTeamLogo) || other.homeTeamLogo == homeTeamLogo)&&(identical(other.awayTeamLogo, awayTeamLogo) || other.awayTeamLogo == awayTeamLogo)&&(identical(other.homeScore, homeScore) || other.homeScore == homeScore)&&(identical(other.awayScore, awayScore) || other.awayScore == awayScore)&&(identical(other.status, status) || other.status == status)&&(identical(other.date, date) || other.date == date)&&(identical(other.venue, venue) || other.venue == venue)&&(identical(other.league, league) || other.league == league)&&(identical(other.leagueLogo, leagueLogo) || other.leagueLogo == leagueLogo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,homeTeam,awayTeam,homeTeamLogo,awayTeamLogo,homeScore,awayScore,status,date,venue,league,leagueLogo);

@override
String toString() {
  return 'MatchModel(id: $id, homeTeam: $homeTeam, awayTeam: $awayTeam, homeTeamLogo: $homeTeamLogo, awayTeamLogo: $awayTeamLogo, homeScore: $homeScore, awayScore: $awayScore, status: $status, date: $date, venue: $venue, league: $league, leagueLogo: $leagueLogo)';
}


}

/// @nodoc
abstract mixin class $MatchModelCopyWith<$Res>  {
  factory $MatchModelCopyWith(MatchModel value, $Res Function(MatchModel) _then) = _$MatchModelCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'home_team') String homeTeam,@JsonKey(name: 'away_team') String awayTeam,@JsonKey(name: 'home_team_logo') String? homeTeamLogo,@JsonKey(name: 'away_team_logo') String? awayTeamLogo,@JsonKey(name: 'home_score') int? homeScore,@JsonKey(name: 'away_score') int? awayScore, String status, DateTime date, String? venue, String? league,@JsonKey(name: 'league_logo') String? leagueLogo
});




}
/// @nodoc
class _$MatchModelCopyWithImpl<$Res>
    implements $MatchModelCopyWith<$Res> {
  _$MatchModelCopyWithImpl(this._self, this._then);

  final MatchModel _self;
  final $Res Function(MatchModel) _then;

/// Create a copy of MatchModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? homeTeam = null,Object? awayTeam = null,Object? homeTeamLogo = freezed,Object? awayTeamLogo = freezed,Object? homeScore = freezed,Object? awayScore = freezed,Object? status = null,Object? date = null,Object? venue = freezed,Object? league = freezed,Object? leagueLogo = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,homeTeam: null == homeTeam ? _self.homeTeam : homeTeam // ignore: cast_nullable_to_non_nullable
as String,awayTeam: null == awayTeam ? _self.awayTeam : awayTeam // ignore: cast_nullable_to_non_nullable
as String,homeTeamLogo: freezed == homeTeamLogo ? _self.homeTeamLogo : homeTeamLogo // ignore: cast_nullable_to_non_nullable
as String?,awayTeamLogo: freezed == awayTeamLogo ? _self.awayTeamLogo : awayTeamLogo // ignore: cast_nullable_to_non_nullable
as String?,homeScore: freezed == homeScore ? _self.homeScore : homeScore // ignore: cast_nullable_to_non_nullable
as int?,awayScore: freezed == awayScore ? _self.awayScore : awayScore // ignore: cast_nullable_to_non_nullable
as int?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,venue: freezed == venue ? _self.venue : venue // ignore: cast_nullable_to_non_nullable
as String?,league: freezed == league ? _self.league : league // ignore: cast_nullable_to_non_nullable
as String?,leagueLogo: freezed == leagueLogo ? _self.leagueLogo : leagueLogo // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MatchModel].
extension MatchModelPatterns on MatchModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MatchModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MatchModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MatchModel value)  $default,){
final _that = this;
switch (_that) {
case _MatchModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MatchModel value)?  $default,){
final _that = this;
switch (_that) {
case _MatchModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'home_team')  String homeTeam, @JsonKey(name: 'away_team')  String awayTeam, @JsonKey(name: 'home_team_logo')  String? homeTeamLogo, @JsonKey(name: 'away_team_logo')  String? awayTeamLogo, @JsonKey(name: 'home_score')  int? homeScore, @JsonKey(name: 'away_score')  int? awayScore,  String status,  DateTime date,  String? venue,  String? league, @JsonKey(name: 'league_logo')  String? leagueLogo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MatchModel() when $default != null:
return $default(_that.id,_that.homeTeam,_that.awayTeam,_that.homeTeamLogo,_that.awayTeamLogo,_that.homeScore,_that.awayScore,_that.status,_that.date,_that.venue,_that.league,_that.leagueLogo);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'home_team')  String homeTeam, @JsonKey(name: 'away_team')  String awayTeam, @JsonKey(name: 'home_team_logo')  String? homeTeamLogo, @JsonKey(name: 'away_team_logo')  String? awayTeamLogo, @JsonKey(name: 'home_score')  int? homeScore, @JsonKey(name: 'away_score')  int? awayScore,  String status,  DateTime date,  String? venue,  String? league, @JsonKey(name: 'league_logo')  String? leagueLogo)  $default,) {final _that = this;
switch (_that) {
case _MatchModel():
return $default(_that.id,_that.homeTeam,_that.awayTeam,_that.homeTeamLogo,_that.awayTeamLogo,_that.homeScore,_that.awayScore,_that.status,_that.date,_that.venue,_that.league,_that.leagueLogo);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'home_team')  String homeTeam, @JsonKey(name: 'away_team')  String awayTeam, @JsonKey(name: 'home_team_logo')  String? homeTeamLogo, @JsonKey(name: 'away_team_logo')  String? awayTeamLogo, @JsonKey(name: 'home_score')  int? homeScore, @JsonKey(name: 'away_score')  int? awayScore,  String status,  DateTime date,  String? venue,  String? league, @JsonKey(name: 'league_logo')  String? leagueLogo)?  $default,) {final _that = this;
switch (_that) {
case _MatchModel() when $default != null:
return $default(_that.id,_that.homeTeam,_that.awayTeam,_that.homeTeamLogo,_that.awayTeamLogo,_that.homeScore,_that.awayScore,_that.status,_that.date,_that.venue,_that.league,_that.leagueLogo);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MatchModel implements MatchModel {
  const _MatchModel({required this.id, @JsonKey(name: 'home_team') required this.homeTeam, @JsonKey(name: 'away_team') required this.awayTeam, @JsonKey(name: 'home_team_logo') this.homeTeamLogo, @JsonKey(name: 'away_team_logo') this.awayTeamLogo, @JsonKey(name: 'home_score') this.homeScore, @JsonKey(name: 'away_score') this.awayScore, required this.status, required this.date, this.venue, this.league, @JsonKey(name: 'league_logo') this.leagueLogo});
  factory _MatchModel.fromJson(Map<String, dynamic> json) => _$MatchModelFromJson(json);

@override final  int id;
@override@JsonKey(name: 'home_team') final  String homeTeam;
@override@JsonKey(name: 'away_team') final  String awayTeam;
@override@JsonKey(name: 'home_team_logo') final  String? homeTeamLogo;
@override@JsonKey(name: 'away_team_logo') final  String? awayTeamLogo;
@override@JsonKey(name: 'home_score') final  int? homeScore;
@override@JsonKey(name: 'away_score') final  int? awayScore;
@override final  String status;
@override final  DateTime date;
@override final  String? venue;
@override final  String? league;
@override@JsonKey(name: 'league_logo') final  String? leagueLogo;

/// Create a copy of MatchModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MatchModelCopyWith<_MatchModel> get copyWith => __$MatchModelCopyWithImpl<_MatchModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MatchModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MatchModel&&(identical(other.id, id) || other.id == id)&&(identical(other.homeTeam, homeTeam) || other.homeTeam == homeTeam)&&(identical(other.awayTeam, awayTeam) || other.awayTeam == awayTeam)&&(identical(other.homeTeamLogo, homeTeamLogo) || other.homeTeamLogo == homeTeamLogo)&&(identical(other.awayTeamLogo, awayTeamLogo) || other.awayTeamLogo == awayTeamLogo)&&(identical(other.homeScore, homeScore) || other.homeScore == homeScore)&&(identical(other.awayScore, awayScore) || other.awayScore == awayScore)&&(identical(other.status, status) || other.status == status)&&(identical(other.date, date) || other.date == date)&&(identical(other.venue, venue) || other.venue == venue)&&(identical(other.league, league) || other.league == league)&&(identical(other.leagueLogo, leagueLogo) || other.leagueLogo == leagueLogo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,homeTeam,awayTeam,homeTeamLogo,awayTeamLogo,homeScore,awayScore,status,date,venue,league,leagueLogo);

@override
String toString() {
  return 'MatchModel(id: $id, homeTeam: $homeTeam, awayTeam: $awayTeam, homeTeamLogo: $homeTeamLogo, awayTeamLogo: $awayTeamLogo, homeScore: $homeScore, awayScore: $awayScore, status: $status, date: $date, venue: $venue, league: $league, leagueLogo: $leagueLogo)';
}


}

/// @nodoc
abstract mixin class _$MatchModelCopyWith<$Res> implements $MatchModelCopyWith<$Res> {
  factory _$MatchModelCopyWith(_MatchModel value, $Res Function(_MatchModel) _then) = __$MatchModelCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'home_team') String homeTeam,@JsonKey(name: 'away_team') String awayTeam,@JsonKey(name: 'home_team_logo') String? homeTeamLogo,@JsonKey(name: 'away_team_logo') String? awayTeamLogo,@JsonKey(name: 'home_score') int? homeScore,@JsonKey(name: 'away_score') int? awayScore, String status, DateTime date, String? venue, String? league,@JsonKey(name: 'league_logo') String? leagueLogo
});




}
/// @nodoc
class __$MatchModelCopyWithImpl<$Res>
    implements _$MatchModelCopyWith<$Res> {
  __$MatchModelCopyWithImpl(this._self, this._then);

  final _MatchModel _self;
  final $Res Function(_MatchModel) _then;

/// Create a copy of MatchModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? homeTeam = null,Object? awayTeam = null,Object? homeTeamLogo = freezed,Object? awayTeamLogo = freezed,Object? homeScore = freezed,Object? awayScore = freezed,Object? status = null,Object? date = null,Object? venue = freezed,Object? league = freezed,Object? leagueLogo = freezed,}) {
  return _then(_MatchModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,homeTeam: null == homeTeam ? _self.homeTeam : homeTeam // ignore: cast_nullable_to_non_nullable
as String,awayTeam: null == awayTeam ? _self.awayTeam : awayTeam // ignore: cast_nullable_to_non_nullable
as String,homeTeamLogo: freezed == homeTeamLogo ? _self.homeTeamLogo : homeTeamLogo // ignore: cast_nullable_to_non_nullable
as String?,awayTeamLogo: freezed == awayTeamLogo ? _self.awayTeamLogo : awayTeamLogo // ignore: cast_nullable_to_non_nullable
as String?,homeScore: freezed == homeScore ? _self.homeScore : homeScore // ignore: cast_nullable_to_non_nullable
as int?,awayScore: freezed == awayScore ? _self.awayScore : awayScore // ignore: cast_nullable_to_non_nullable
as int?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,venue: freezed == venue ? _self.venue : venue // ignore: cast_nullable_to_non_nullable
as String?,league: freezed == league ? _self.league : league // ignore: cast_nullable_to_non_nullable
as String?,leagueLogo: freezed == leagueLogo ? _self.leagueLogo : leagueLogo // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
