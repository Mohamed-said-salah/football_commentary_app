// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fixtures_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FixturesResponse {

@JsonKey(name: 'get') String get get;@JsonKey(name: 'parameters') Map<String, dynamic> get parameters;@JsonKey(name: 'errors') List<dynamic> get errors;@JsonKey(name: 'results') int get results;@JsonKey(name: 'paging') PagingModel get paging;@JsonKey(name: 'response') List<FixtureModel> get response;
/// Create a copy of FixturesResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FixturesResponseCopyWith<FixturesResponse> get copyWith => _$FixturesResponseCopyWithImpl<FixturesResponse>(this as FixturesResponse, _$identity);

  /// Serializes this FixturesResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FixturesResponse&&(identical(other.get, get) || other.get == get)&&const DeepCollectionEquality().equals(other.parameters, parameters)&&const DeepCollectionEquality().equals(other.errors, errors)&&(identical(other.results, results) || other.results == results)&&(identical(other.paging, paging) || other.paging == paging)&&const DeepCollectionEquality().equals(other.response, response));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,get,const DeepCollectionEquality().hash(parameters),const DeepCollectionEquality().hash(errors),results,paging,const DeepCollectionEquality().hash(response));

@override
String toString() {
  return 'FixturesResponse(get: $get, parameters: $parameters, errors: $errors, results: $results, paging: $paging, response: $response)';
}


}

/// @nodoc
abstract mixin class $FixturesResponseCopyWith<$Res>  {
  factory $FixturesResponseCopyWith(FixturesResponse value, $Res Function(FixturesResponse) _then) = _$FixturesResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'get') String get,@JsonKey(name: 'parameters') Map<String, dynamic> parameters,@JsonKey(name: 'errors') List<dynamic> errors,@JsonKey(name: 'results') int results,@JsonKey(name: 'paging') PagingModel paging,@JsonKey(name: 'response') List<FixtureModel> response
});


$PagingModelCopyWith<$Res> get paging;

}
/// @nodoc
class _$FixturesResponseCopyWithImpl<$Res>
    implements $FixturesResponseCopyWith<$Res> {
  _$FixturesResponseCopyWithImpl(this._self, this._then);

  final FixturesResponse _self;
  final $Res Function(FixturesResponse) _then;

/// Create a copy of FixturesResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? get = null,Object? parameters = null,Object? errors = null,Object? results = null,Object? paging = null,Object? response = null,}) {
  return _then(_self.copyWith(
get: null == get ? _self.get : get // ignore: cast_nullable_to_non_nullable
as String,parameters: null == parameters ? _self.parameters : parameters // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,errors: null == errors ? _self.errors : errors // ignore: cast_nullable_to_non_nullable
as List<dynamic>,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as int,paging: null == paging ? _self.paging : paging // ignore: cast_nullable_to_non_nullable
as PagingModel,response: null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as List<FixtureModel>,
  ));
}
/// Create a copy of FixturesResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PagingModelCopyWith<$Res> get paging {
  
  return $PagingModelCopyWith<$Res>(_self.paging, (value) {
    return _then(_self.copyWith(paging: value));
  });
}
}


/// Adds pattern-matching-related methods to [FixturesResponse].
extension FixturesResponsePatterns on FixturesResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FixturesResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FixturesResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FixturesResponse value)  $default,){
final _that = this;
switch (_that) {
case _FixturesResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FixturesResponse value)?  $default,){
final _that = this;
switch (_that) {
case _FixturesResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'get')  String get, @JsonKey(name: 'parameters')  Map<String, dynamic> parameters, @JsonKey(name: 'errors')  List<dynamic> errors, @JsonKey(name: 'results')  int results, @JsonKey(name: 'paging')  PagingModel paging, @JsonKey(name: 'response')  List<FixtureModel> response)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FixturesResponse() when $default != null:
return $default(_that.get,_that.parameters,_that.errors,_that.results,_that.paging,_that.response);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'get')  String get, @JsonKey(name: 'parameters')  Map<String, dynamic> parameters, @JsonKey(name: 'errors')  List<dynamic> errors, @JsonKey(name: 'results')  int results, @JsonKey(name: 'paging')  PagingModel paging, @JsonKey(name: 'response')  List<FixtureModel> response)  $default,) {final _that = this;
switch (_that) {
case _FixturesResponse():
return $default(_that.get,_that.parameters,_that.errors,_that.results,_that.paging,_that.response);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'get')  String get, @JsonKey(name: 'parameters')  Map<String, dynamic> parameters, @JsonKey(name: 'errors')  List<dynamic> errors, @JsonKey(name: 'results')  int results, @JsonKey(name: 'paging')  PagingModel paging, @JsonKey(name: 'response')  List<FixtureModel> response)?  $default,) {final _that = this;
switch (_that) {
case _FixturesResponse() when $default != null:
return $default(_that.get,_that.parameters,_that.errors,_that.results,_that.paging,_that.response);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FixturesResponse implements FixturesResponse {
  const _FixturesResponse({@JsonKey(name: 'get') required this.get, @JsonKey(name: 'parameters') required final  Map<String, dynamic> parameters, @JsonKey(name: 'errors') required final  List<dynamic> errors, @JsonKey(name: 'results') required this.results, @JsonKey(name: 'paging') required this.paging, @JsonKey(name: 'response') required final  List<FixtureModel> response}): _parameters = parameters,_errors = errors,_response = response;
  factory _FixturesResponse.fromJson(Map<String, dynamic> json) => _$FixturesResponseFromJson(json);

@override@JsonKey(name: 'get') final  String get;
 final  Map<String, dynamic> _parameters;
@override@JsonKey(name: 'parameters') Map<String, dynamic> get parameters {
  if (_parameters is EqualUnmodifiableMapView) return _parameters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_parameters);
}

 final  List<dynamic> _errors;
@override@JsonKey(name: 'errors') List<dynamic> get errors {
  if (_errors is EqualUnmodifiableListView) return _errors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_errors);
}

@override@JsonKey(name: 'results') final  int results;
@override@JsonKey(name: 'paging') final  PagingModel paging;
 final  List<FixtureModel> _response;
@override@JsonKey(name: 'response') List<FixtureModel> get response {
  if (_response is EqualUnmodifiableListView) return _response;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_response);
}


/// Create a copy of FixturesResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FixturesResponseCopyWith<_FixturesResponse> get copyWith => __$FixturesResponseCopyWithImpl<_FixturesResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FixturesResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FixturesResponse&&(identical(other.get, get) || other.get == get)&&const DeepCollectionEquality().equals(other._parameters, _parameters)&&const DeepCollectionEquality().equals(other._errors, _errors)&&(identical(other.results, results) || other.results == results)&&(identical(other.paging, paging) || other.paging == paging)&&const DeepCollectionEquality().equals(other._response, _response));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,get,const DeepCollectionEquality().hash(_parameters),const DeepCollectionEquality().hash(_errors),results,paging,const DeepCollectionEquality().hash(_response));

@override
String toString() {
  return 'FixturesResponse(get: $get, parameters: $parameters, errors: $errors, results: $results, paging: $paging, response: $response)';
}


}

/// @nodoc
abstract mixin class _$FixturesResponseCopyWith<$Res> implements $FixturesResponseCopyWith<$Res> {
  factory _$FixturesResponseCopyWith(_FixturesResponse value, $Res Function(_FixturesResponse) _then) = __$FixturesResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'get') String get,@JsonKey(name: 'parameters') Map<String, dynamic> parameters,@JsonKey(name: 'errors') List<dynamic> errors,@JsonKey(name: 'results') int results,@JsonKey(name: 'paging') PagingModel paging,@JsonKey(name: 'response') List<FixtureModel> response
});


@override $PagingModelCopyWith<$Res> get paging;

}
/// @nodoc
class __$FixturesResponseCopyWithImpl<$Res>
    implements _$FixturesResponseCopyWith<$Res> {
  __$FixturesResponseCopyWithImpl(this._self, this._then);

  final _FixturesResponse _self;
  final $Res Function(_FixturesResponse) _then;

/// Create a copy of FixturesResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? get = null,Object? parameters = null,Object? errors = null,Object? results = null,Object? paging = null,Object? response = null,}) {
  return _then(_FixturesResponse(
get: null == get ? _self.get : get // ignore: cast_nullable_to_non_nullable
as String,parameters: null == parameters ? _self._parameters : parameters // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,errors: null == errors ? _self._errors : errors // ignore: cast_nullable_to_non_nullable
as List<dynamic>,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as int,paging: null == paging ? _self.paging : paging // ignore: cast_nullable_to_non_nullable
as PagingModel,response: null == response ? _self._response : response // ignore: cast_nullable_to_non_nullable
as List<FixtureModel>,
  ));
}

/// Create a copy of FixturesResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PagingModelCopyWith<$Res> get paging {
  
  return $PagingModelCopyWith<$Res>(_self.paging, (value) {
    return _then(_self.copyWith(paging: value));
  });
}
}


/// @nodoc
mixin _$PagingModel {

@JsonKey(name: 'current') int get current;@JsonKey(name: 'total') int get total;
/// Create a copy of PagingModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PagingModelCopyWith<PagingModel> get copyWith => _$PagingModelCopyWithImpl<PagingModel>(this as PagingModel, _$identity);

  /// Serializes this PagingModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PagingModel&&(identical(other.current, current) || other.current == current)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,current,total);

@override
String toString() {
  return 'PagingModel(current: $current, total: $total)';
}


}

/// @nodoc
abstract mixin class $PagingModelCopyWith<$Res>  {
  factory $PagingModelCopyWith(PagingModel value, $Res Function(PagingModel) _then) = _$PagingModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'current') int current,@JsonKey(name: 'total') int total
});




}
/// @nodoc
class _$PagingModelCopyWithImpl<$Res>
    implements $PagingModelCopyWith<$Res> {
  _$PagingModelCopyWithImpl(this._self, this._then);

  final PagingModel _self;
  final $Res Function(PagingModel) _then;

/// Create a copy of PagingModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? current = null,Object? total = null,}) {
  return _then(_self.copyWith(
current: null == current ? _self.current : current // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PagingModel].
extension PagingModelPatterns on PagingModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PagingModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PagingModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PagingModel value)  $default,){
final _that = this;
switch (_that) {
case _PagingModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PagingModel value)?  $default,){
final _that = this;
switch (_that) {
case _PagingModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'current')  int current, @JsonKey(name: 'total')  int total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PagingModel() when $default != null:
return $default(_that.current,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'current')  int current, @JsonKey(name: 'total')  int total)  $default,) {final _that = this;
switch (_that) {
case _PagingModel():
return $default(_that.current,_that.total);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'current')  int current, @JsonKey(name: 'total')  int total)?  $default,) {final _that = this;
switch (_that) {
case _PagingModel() when $default != null:
return $default(_that.current,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PagingModel implements PagingModel {
  const _PagingModel({@JsonKey(name: 'current') required this.current, @JsonKey(name: 'total') required this.total});
  factory _PagingModel.fromJson(Map<String, dynamic> json) => _$PagingModelFromJson(json);

@override@JsonKey(name: 'current') final  int current;
@override@JsonKey(name: 'total') final  int total;

/// Create a copy of PagingModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PagingModelCopyWith<_PagingModel> get copyWith => __$PagingModelCopyWithImpl<_PagingModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PagingModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PagingModel&&(identical(other.current, current) || other.current == current)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,current,total);

@override
String toString() {
  return 'PagingModel(current: $current, total: $total)';
}


}

/// @nodoc
abstract mixin class _$PagingModelCopyWith<$Res> implements $PagingModelCopyWith<$Res> {
  factory _$PagingModelCopyWith(_PagingModel value, $Res Function(_PagingModel) _then) = __$PagingModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'current') int current,@JsonKey(name: 'total') int total
});




}
/// @nodoc
class __$PagingModelCopyWithImpl<$Res>
    implements _$PagingModelCopyWith<$Res> {
  __$PagingModelCopyWithImpl(this._self, this._then);

  final _PagingModel _self;
  final $Res Function(_PagingModel) _then;

/// Create a copy of PagingModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? current = null,Object? total = null,}) {
  return _then(_PagingModel(
current: null == current ? _self.current : current // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$FixtureModel {

@JsonKey(name: 'fixture') FixtureDetailsModel get fixture;@JsonKey(name: 'league') LeagueModel get league;@JsonKey(name: 'teams') TeamsModel get teams;@JsonKey(name: 'goals') GoalsModel get goals;@JsonKey(name: 'score') ScoreModel get score;
/// Create a copy of FixtureModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FixtureModelCopyWith<FixtureModel> get copyWith => _$FixtureModelCopyWithImpl<FixtureModel>(this as FixtureModel, _$identity);

  /// Serializes this FixtureModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FixtureModel&&(identical(other.fixture, fixture) || other.fixture == fixture)&&(identical(other.league, league) || other.league == league)&&(identical(other.teams, teams) || other.teams == teams)&&(identical(other.goals, goals) || other.goals == goals)&&(identical(other.score, score) || other.score == score));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fixture,league,teams,goals,score);

@override
String toString() {
  return 'FixtureModel(fixture: $fixture, league: $league, teams: $teams, goals: $goals, score: $score)';
}


}

/// @nodoc
abstract mixin class $FixtureModelCopyWith<$Res>  {
  factory $FixtureModelCopyWith(FixtureModel value, $Res Function(FixtureModel) _then) = _$FixtureModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'fixture') FixtureDetailsModel fixture,@JsonKey(name: 'league') LeagueModel league,@JsonKey(name: 'teams') TeamsModel teams,@JsonKey(name: 'goals') GoalsModel goals,@JsonKey(name: 'score') ScoreModel score
});


$FixtureDetailsModelCopyWith<$Res> get fixture;$LeagueModelCopyWith<$Res> get league;$TeamsModelCopyWith<$Res> get teams;$GoalsModelCopyWith<$Res> get goals;$ScoreModelCopyWith<$Res> get score;

}
/// @nodoc
class _$FixtureModelCopyWithImpl<$Res>
    implements $FixtureModelCopyWith<$Res> {
  _$FixtureModelCopyWithImpl(this._self, this._then);

  final FixtureModel _self;
  final $Res Function(FixtureModel) _then;

/// Create a copy of FixtureModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fixture = null,Object? league = null,Object? teams = null,Object? goals = null,Object? score = null,}) {
  return _then(_self.copyWith(
fixture: null == fixture ? _self.fixture : fixture // ignore: cast_nullable_to_non_nullable
as FixtureDetailsModel,league: null == league ? _self.league : league // ignore: cast_nullable_to_non_nullable
as LeagueModel,teams: null == teams ? _self.teams : teams // ignore: cast_nullable_to_non_nullable
as TeamsModel,goals: null == goals ? _self.goals : goals // ignore: cast_nullable_to_non_nullable
as GoalsModel,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as ScoreModel,
  ));
}
/// Create a copy of FixtureModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FixtureDetailsModelCopyWith<$Res> get fixture {
  
  return $FixtureDetailsModelCopyWith<$Res>(_self.fixture, (value) {
    return _then(_self.copyWith(fixture: value));
  });
}/// Create a copy of FixtureModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LeagueModelCopyWith<$Res> get league {
  
  return $LeagueModelCopyWith<$Res>(_self.league, (value) {
    return _then(_self.copyWith(league: value));
  });
}/// Create a copy of FixtureModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TeamsModelCopyWith<$Res> get teams {
  
  return $TeamsModelCopyWith<$Res>(_self.teams, (value) {
    return _then(_self.copyWith(teams: value));
  });
}/// Create a copy of FixtureModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GoalsModelCopyWith<$Res> get goals {
  
  return $GoalsModelCopyWith<$Res>(_self.goals, (value) {
    return _then(_self.copyWith(goals: value));
  });
}/// Create a copy of FixtureModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScoreModelCopyWith<$Res> get score {
  
  return $ScoreModelCopyWith<$Res>(_self.score, (value) {
    return _then(_self.copyWith(score: value));
  });
}
}


/// Adds pattern-matching-related methods to [FixtureModel].
extension FixtureModelPatterns on FixtureModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FixtureModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FixtureModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FixtureModel value)  $default,){
final _that = this;
switch (_that) {
case _FixtureModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FixtureModel value)?  $default,){
final _that = this;
switch (_that) {
case _FixtureModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'fixture')  FixtureDetailsModel fixture, @JsonKey(name: 'league')  LeagueModel league, @JsonKey(name: 'teams')  TeamsModel teams, @JsonKey(name: 'goals')  GoalsModel goals, @JsonKey(name: 'score')  ScoreModel score)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FixtureModel() when $default != null:
return $default(_that.fixture,_that.league,_that.teams,_that.goals,_that.score);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'fixture')  FixtureDetailsModel fixture, @JsonKey(name: 'league')  LeagueModel league, @JsonKey(name: 'teams')  TeamsModel teams, @JsonKey(name: 'goals')  GoalsModel goals, @JsonKey(name: 'score')  ScoreModel score)  $default,) {final _that = this;
switch (_that) {
case _FixtureModel():
return $default(_that.fixture,_that.league,_that.teams,_that.goals,_that.score);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'fixture')  FixtureDetailsModel fixture, @JsonKey(name: 'league')  LeagueModel league, @JsonKey(name: 'teams')  TeamsModel teams, @JsonKey(name: 'goals')  GoalsModel goals, @JsonKey(name: 'score')  ScoreModel score)?  $default,) {final _that = this;
switch (_that) {
case _FixtureModel() when $default != null:
return $default(_that.fixture,_that.league,_that.teams,_that.goals,_that.score);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FixtureModel implements FixtureModel {
  const _FixtureModel({@JsonKey(name: 'fixture') required this.fixture, @JsonKey(name: 'league') required this.league, @JsonKey(name: 'teams') required this.teams, @JsonKey(name: 'goals') required this.goals, @JsonKey(name: 'score') required this.score});
  factory _FixtureModel.fromJson(Map<String, dynamic> json) => _$FixtureModelFromJson(json);

@override@JsonKey(name: 'fixture') final  FixtureDetailsModel fixture;
@override@JsonKey(name: 'league') final  LeagueModel league;
@override@JsonKey(name: 'teams') final  TeamsModel teams;
@override@JsonKey(name: 'goals') final  GoalsModel goals;
@override@JsonKey(name: 'score') final  ScoreModel score;

/// Create a copy of FixtureModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FixtureModelCopyWith<_FixtureModel> get copyWith => __$FixtureModelCopyWithImpl<_FixtureModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FixtureModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FixtureModel&&(identical(other.fixture, fixture) || other.fixture == fixture)&&(identical(other.league, league) || other.league == league)&&(identical(other.teams, teams) || other.teams == teams)&&(identical(other.goals, goals) || other.goals == goals)&&(identical(other.score, score) || other.score == score));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fixture,league,teams,goals,score);

@override
String toString() {
  return 'FixtureModel(fixture: $fixture, league: $league, teams: $teams, goals: $goals, score: $score)';
}


}

/// @nodoc
abstract mixin class _$FixtureModelCopyWith<$Res> implements $FixtureModelCopyWith<$Res> {
  factory _$FixtureModelCopyWith(_FixtureModel value, $Res Function(_FixtureModel) _then) = __$FixtureModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'fixture') FixtureDetailsModel fixture,@JsonKey(name: 'league') LeagueModel league,@JsonKey(name: 'teams') TeamsModel teams,@JsonKey(name: 'goals') GoalsModel goals,@JsonKey(name: 'score') ScoreModel score
});


@override $FixtureDetailsModelCopyWith<$Res> get fixture;@override $LeagueModelCopyWith<$Res> get league;@override $TeamsModelCopyWith<$Res> get teams;@override $GoalsModelCopyWith<$Res> get goals;@override $ScoreModelCopyWith<$Res> get score;

}
/// @nodoc
class __$FixtureModelCopyWithImpl<$Res>
    implements _$FixtureModelCopyWith<$Res> {
  __$FixtureModelCopyWithImpl(this._self, this._then);

  final _FixtureModel _self;
  final $Res Function(_FixtureModel) _then;

/// Create a copy of FixtureModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fixture = null,Object? league = null,Object? teams = null,Object? goals = null,Object? score = null,}) {
  return _then(_FixtureModel(
fixture: null == fixture ? _self.fixture : fixture // ignore: cast_nullable_to_non_nullable
as FixtureDetailsModel,league: null == league ? _self.league : league // ignore: cast_nullable_to_non_nullable
as LeagueModel,teams: null == teams ? _self.teams : teams // ignore: cast_nullable_to_non_nullable
as TeamsModel,goals: null == goals ? _self.goals : goals // ignore: cast_nullable_to_non_nullable
as GoalsModel,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as ScoreModel,
  ));
}

/// Create a copy of FixtureModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FixtureDetailsModelCopyWith<$Res> get fixture {
  
  return $FixtureDetailsModelCopyWith<$Res>(_self.fixture, (value) {
    return _then(_self.copyWith(fixture: value));
  });
}/// Create a copy of FixtureModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LeagueModelCopyWith<$Res> get league {
  
  return $LeagueModelCopyWith<$Res>(_self.league, (value) {
    return _then(_self.copyWith(league: value));
  });
}/// Create a copy of FixtureModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TeamsModelCopyWith<$Res> get teams {
  
  return $TeamsModelCopyWith<$Res>(_self.teams, (value) {
    return _then(_self.copyWith(teams: value));
  });
}/// Create a copy of FixtureModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GoalsModelCopyWith<$Res> get goals {
  
  return $GoalsModelCopyWith<$Res>(_self.goals, (value) {
    return _then(_self.copyWith(goals: value));
  });
}/// Create a copy of FixtureModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScoreModelCopyWith<$Res> get score {
  
  return $ScoreModelCopyWith<$Res>(_self.score, (value) {
    return _then(_self.copyWith(score: value));
  });
}
}


/// @nodoc
mixin _$FixtureDetailsModel {

@JsonKey(name: 'id') int get id;@JsonKey(name: 'referee') String? get referee;@JsonKey(name: 'timezone') String get timezone;@JsonKey(name: 'date') String get date;@JsonKey(name: 'timestamp') int get timestamp;@JsonKey(name: 'periods') PeriodsModel get periods;@JsonKey(name: 'venue') VenueModel get venue;@JsonKey(name: 'status') StatusModel get status;
/// Create a copy of FixtureDetailsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FixtureDetailsModelCopyWith<FixtureDetailsModel> get copyWith => _$FixtureDetailsModelCopyWithImpl<FixtureDetailsModel>(this as FixtureDetailsModel, _$identity);

  /// Serializes this FixtureDetailsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FixtureDetailsModel&&(identical(other.id, id) || other.id == id)&&(identical(other.referee, referee) || other.referee == referee)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.date, date) || other.date == date)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.periods, periods) || other.periods == periods)&&(identical(other.venue, venue) || other.venue == venue)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,referee,timezone,date,timestamp,periods,venue,status);

@override
String toString() {
  return 'FixtureDetailsModel(id: $id, referee: $referee, timezone: $timezone, date: $date, timestamp: $timestamp, periods: $periods, venue: $venue, status: $status)';
}


}

/// @nodoc
abstract mixin class $FixtureDetailsModelCopyWith<$Res>  {
  factory $FixtureDetailsModelCopyWith(FixtureDetailsModel value, $Res Function(FixtureDetailsModel) _then) = _$FixtureDetailsModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'referee') String? referee,@JsonKey(name: 'timezone') String timezone,@JsonKey(name: 'date') String date,@JsonKey(name: 'timestamp') int timestamp,@JsonKey(name: 'periods') PeriodsModel periods,@JsonKey(name: 'venue') VenueModel venue,@JsonKey(name: 'status') StatusModel status
});


$PeriodsModelCopyWith<$Res> get periods;$VenueModelCopyWith<$Res> get venue;$StatusModelCopyWith<$Res> get status;

}
/// @nodoc
class _$FixtureDetailsModelCopyWithImpl<$Res>
    implements $FixtureDetailsModelCopyWith<$Res> {
  _$FixtureDetailsModelCopyWithImpl(this._self, this._then);

  final FixtureDetailsModel _self;
  final $Res Function(FixtureDetailsModel) _then;

/// Create a copy of FixtureDetailsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? referee = freezed,Object? timezone = null,Object? date = null,Object? timestamp = null,Object? periods = null,Object? venue = null,Object? status = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,referee: freezed == referee ? _self.referee : referee // ignore: cast_nullable_to_non_nullable
as String?,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as int,periods: null == periods ? _self.periods : periods // ignore: cast_nullable_to_non_nullable
as PeriodsModel,venue: null == venue ? _self.venue : venue // ignore: cast_nullable_to_non_nullable
as VenueModel,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StatusModel,
  ));
}
/// Create a copy of FixtureDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PeriodsModelCopyWith<$Res> get periods {
  
  return $PeriodsModelCopyWith<$Res>(_self.periods, (value) {
    return _then(_self.copyWith(periods: value));
  });
}/// Create a copy of FixtureDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VenueModelCopyWith<$Res> get venue {
  
  return $VenueModelCopyWith<$Res>(_self.venue, (value) {
    return _then(_self.copyWith(venue: value));
  });
}/// Create a copy of FixtureDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StatusModelCopyWith<$Res> get status {
  
  return $StatusModelCopyWith<$Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}
}


/// Adds pattern-matching-related methods to [FixtureDetailsModel].
extension FixtureDetailsModelPatterns on FixtureDetailsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FixtureDetailsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FixtureDetailsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FixtureDetailsModel value)  $default,){
final _that = this;
switch (_that) {
case _FixtureDetailsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FixtureDetailsModel value)?  $default,){
final _that = this;
switch (_that) {
case _FixtureDetailsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'referee')  String? referee, @JsonKey(name: 'timezone')  String timezone, @JsonKey(name: 'date')  String date, @JsonKey(name: 'timestamp')  int timestamp, @JsonKey(name: 'periods')  PeriodsModel periods, @JsonKey(name: 'venue')  VenueModel venue, @JsonKey(name: 'status')  StatusModel status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FixtureDetailsModel() when $default != null:
return $default(_that.id,_that.referee,_that.timezone,_that.date,_that.timestamp,_that.periods,_that.venue,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'referee')  String? referee, @JsonKey(name: 'timezone')  String timezone, @JsonKey(name: 'date')  String date, @JsonKey(name: 'timestamp')  int timestamp, @JsonKey(name: 'periods')  PeriodsModel periods, @JsonKey(name: 'venue')  VenueModel venue, @JsonKey(name: 'status')  StatusModel status)  $default,) {final _that = this;
switch (_that) {
case _FixtureDetailsModel():
return $default(_that.id,_that.referee,_that.timezone,_that.date,_that.timestamp,_that.periods,_that.venue,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'referee')  String? referee, @JsonKey(name: 'timezone')  String timezone, @JsonKey(name: 'date')  String date, @JsonKey(name: 'timestamp')  int timestamp, @JsonKey(name: 'periods')  PeriodsModel periods, @JsonKey(name: 'venue')  VenueModel venue, @JsonKey(name: 'status')  StatusModel status)?  $default,) {final _that = this;
switch (_that) {
case _FixtureDetailsModel() when $default != null:
return $default(_that.id,_that.referee,_that.timezone,_that.date,_that.timestamp,_that.periods,_that.venue,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FixtureDetailsModel implements FixtureDetailsModel {
  const _FixtureDetailsModel({@JsonKey(name: 'id') required this.id, @JsonKey(name: 'referee') this.referee, @JsonKey(name: 'timezone') required this.timezone, @JsonKey(name: 'date') required this.date, @JsonKey(name: 'timestamp') required this.timestamp, @JsonKey(name: 'periods') required this.periods, @JsonKey(name: 'venue') required this.venue, @JsonKey(name: 'status') required this.status});
  factory _FixtureDetailsModel.fromJson(Map<String, dynamic> json) => _$FixtureDetailsModelFromJson(json);

@override@JsonKey(name: 'id') final  int id;
@override@JsonKey(name: 'referee') final  String? referee;
@override@JsonKey(name: 'timezone') final  String timezone;
@override@JsonKey(name: 'date') final  String date;
@override@JsonKey(name: 'timestamp') final  int timestamp;
@override@JsonKey(name: 'periods') final  PeriodsModel periods;
@override@JsonKey(name: 'venue') final  VenueModel venue;
@override@JsonKey(name: 'status') final  StatusModel status;

/// Create a copy of FixtureDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FixtureDetailsModelCopyWith<_FixtureDetailsModel> get copyWith => __$FixtureDetailsModelCopyWithImpl<_FixtureDetailsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FixtureDetailsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FixtureDetailsModel&&(identical(other.id, id) || other.id == id)&&(identical(other.referee, referee) || other.referee == referee)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.date, date) || other.date == date)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.periods, periods) || other.periods == periods)&&(identical(other.venue, venue) || other.venue == venue)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,referee,timezone,date,timestamp,periods,venue,status);

@override
String toString() {
  return 'FixtureDetailsModel(id: $id, referee: $referee, timezone: $timezone, date: $date, timestamp: $timestamp, periods: $periods, venue: $venue, status: $status)';
}


}

/// @nodoc
abstract mixin class _$FixtureDetailsModelCopyWith<$Res> implements $FixtureDetailsModelCopyWith<$Res> {
  factory _$FixtureDetailsModelCopyWith(_FixtureDetailsModel value, $Res Function(_FixtureDetailsModel) _then) = __$FixtureDetailsModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'referee') String? referee,@JsonKey(name: 'timezone') String timezone,@JsonKey(name: 'date') String date,@JsonKey(name: 'timestamp') int timestamp,@JsonKey(name: 'periods') PeriodsModel periods,@JsonKey(name: 'venue') VenueModel venue,@JsonKey(name: 'status') StatusModel status
});


@override $PeriodsModelCopyWith<$Res> get periods;@override $VenueModelCopyWith<$Res> get venue;@override $StatusModelCopyWith<$Res> get status;

}
/// @nodoc
class __$FixtureDetailsModelCopyWithImpl<$Res>
    implements _$FixtureDetailsModelCopyWith<$Res> {
  __$FixtureDetailsModelCopyWithImpl(this._self, this._then);

  final _FixtureDetailsModel _self;
  final $Res Function(_FixtureDetailsModel) _then;

/// Create a copy of FixtureDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? referee = freezed,Object? timezone = null,Object? date = null,Object? timestamp = null,Object? periods = null,Object? venue = null,Object? status = null,}) {
  return _then(_FixtureDetailsModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,referee: freezed == referee ? _self.referee : referee // ignore: cast_nullable_to_non_nullable
as String?,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as int,periods: null == periods ? _self.periods : periods // ignore: cast_nullable_to_non_nullable
as PeriodsModel,venue: null == venue ? _self.venue : venue // ignore: cast_nullable_to_non_nullable
as VenueModel,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StatusModel,
  ));
}

/// Create a copy of FixtureDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PeriodsModelCopyWith<$Res> get periods {
  
  return $PeriodsModelCopyWith<$Res>(_self.periods, (value) {
    return _then(_self.copyWith(periods: value));
  });
}/// Create a copy of FixtureDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VenueModelCopyWith<$Res> get venue {
  
  return $VenueModelCopyWith<$Res>(_self.venue, (value) {
    return _then(_self.copyWith(venue: value));
  });
}/// Create a copy of FixtureDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StatusModelCopyWith<$Res> get status {
  
  return $StatusModelCopyWith<$Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}
}


/// @nodoc
mixin _$PeriodsModel {

@JsonKey(name: 'first') int? get first;@JsonKey(name: 'second') int? get second;
/// Create a copy of PeriodsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PeriodsModelCopyWith<PeriodsModel> get copyWith => _$PeriodsModelCopyWithImpl<PeriodsModel>(this as PeriodsModel, _$identity);

  /// Serializes this PeriodsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PeriodsModel&&(identical(other.first, first) || other.first == first)&&(identical(other.second, second) || other.second == second));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,first,second);

@override
String toString() {
  return 'PeriodsModel(first: $first, second: $second)';
}


}

/// @nodoc
abstract mixin class $PeriodsModelCopyWith<$Res>  {
  factory $PeriodsModelCopyWith(PeriodsModel value, $Res Function(PeriodsModel) _then) = _$PeriodsModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'first') int? first,@JsonKey(name: 'second') int? second
});




}
/// @nodoc
class _$PeriodsModelCopyWithImpl<$Res>
    implements $PeriodsModelCopyWith<$Res> {
  _$PeriodsModelCopyWithImpl(this._self, this._then);

  final PeriodsModel _self;
  final $Res Function(PeriodsModel) _then;

/// Create a copy of PeriodsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? first = freezed,Object? second = freezed,}) {
  return _then(_self.copyWith(
first: freezed == first ? _self.first : first // ignore: cast_nullable_to_non_nullable
as int?,second: freezed == second ? _self.second : second // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [PeriodsModel].
extension PeriodsModelPatterns on PeriodsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PeriodsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PeriodsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PeriodsModel value)  $default,){
final _that = this;
switch (_that) {
case _PeriodsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PeriodsModel value)?  $default,){
final _that = this;
switch (_that) {
case _PeriodsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'first')  int? first, @JsonKey(name: 'second')  int? second)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PeriodsModel() when $default != null:
return $default(_that.first,_that.second);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'first')  int? first, @JsonKey(name: 'second')  int? second)  $default,) {final _that = this;
switch (_that) {
case _PeriodsModel():
return $default(_that.first,_that.second);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'first')  int? first, @JsonKey(name: 'second')  int? second)?  $default,) {final _that = this;
switch (_that) {
case _PeriodsModel() when $default != null:
return $default(_that.first,_that.second);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PeriodsModel implements PeriodsModel {
  const _PeriodsModel({@JsonKey(name: 'first') this.first, @JsonKey(name: 'second') this.second});
  factory _PeriodsModel.fromJson(Map<String, dynamic> json) => _$PeriodsModelFromJson(json);

@override@JsonKey(name: 'first') final  int? first;
@override@JsonKey(name: 'second') final  int? second;

/// Create a copy of PeriodsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PeriodsModelCopyWith<_PeriodsModel> get copyWith => __$PeriodsModelCopyWithImpl<_PeriodsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PeriodsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PeriodsModel&&(identical(other.first, first) || other.first == first)&&(identical(other.second, second) || other.second == second));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,first,second);

@override
String toString() {
  return 'PeriodsModel(first: $first, second: $second)';
}


}

/// @nodoc
abstract mixin class _$PeriodsModelCopyWith<$Res> implements $PeriodsModelCopyWith<$Res> {
  factory _$PeriodsModelCopyWith(_PeriodsModel value, $Res Function(_PeriodsModel) _then) = __$PeriodsModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'first') int? first,@JsonKey(name: 'second') int? second
});




}
/// @nodoc
class __$PeriodsModelCopyWithImpl<$Res>
    implements _$PeriodsModelCopyWith<$Res> {
  __$PeriodsModelCopyWithImpl(this._self, this._then);

  final _PeriodsModel _self;
  final $Res Function(_PeriodsModel) _then;

/// Create a copy of PeriodsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? first = freezed,Object? second = freezed,}) {
  return _then(_PeriodsModel(
first: freezed == first ? _self.first : first // ignore: cast_nullable_to_non_nullable
as int?,second: freezed == second ? _self.second : second // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$VenueModel {

@JsonKey(name: 'id') int? get id;@JsonKey(name: 'name') String? get name;@JsonKey(name: 'city') String? get city;
/// Create a copy of VenueModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VenueModelCopyWith<VenueModel> get copyWith => _$VenueModelCopyWithImpl<VenueModel>(this as VenueModel, _$identity);

  /// Serializes this VenueModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VenueModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.city, city) || other.city == city));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,city);

@override
String toString() {
  return 'VenueModel(id: $id, name: $name, city: $city)';
}


}

/// @nodoc
abstract mixin class $VenueModelCopyWith<$Res>  {
  factory $VenueModelCopyWith(VenueModel value, $Res Function(VenueModel) _then) = _$VenueModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int? id,@JsonKey(name: 'name') String? name,@JsonKey(name: 'city') String? city
});




}
/// @nodoc
class _$VenueModelCopyWithImpl<$Res>
    implements $VenueModelCopyWith<$Res> {
  _$VenueModelCopyWithImpl(this._self, this._then);

  final VenueModel _self;
  final $Res Function(VenueModel) _then;

/// Create a copy of VenueModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? city = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [VenueModel].
extension VenueModelPatterns on VenueModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VenueModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VenueModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VenueModel value)  $default,){
final _that = this;
switch (_that) {
case _VenueModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VenueModel value)?  $default,){
final _that = this;
switch (_that) {
case _VenueModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'city')  String? city)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VenueModel() when $default != null:
return $default(_that.id,_that.name,_that.city);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'city')  String? city)  $default,) {final _that = this;
switch (_that) {
case _VenueModel():
return $default(_that.id,_that.name,_that.city);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'city')  String? city)?  $default,) {final _that = this;
switch (_that) {
case _VenueModel() when $default != null:
return $default(_that.id,_that.name,_that.city);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VenueModel implements VenueModel {
  const _VenueModel({@JsonKey(name: 'id') this.id, @JsonKey(name: 'name') this.name, @JsonKey(name: 'city') this.city});
  factory _VenueModel.fromJson(Map<String, dynamic> json) => _$VenueModelFromJson(json);

@override@JsonKey(name: 'id') final  int? id;
@override@JsonKey(name: 'name') final  String? name;
@override@JsonKey(name: 'city') final  String? city;

/// Create a copy of VenueModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VenueModelCopyWith<_VenueModel> get copyWith => __$VenueModelCopyWithImpl<_VenueModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VenueModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VenueModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.city, city) || other.city == city));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,city);

@override
String toString() {
  return 'VenueModel(id: $id, name: $name, city: $city)';
}


}

/// @nodoc
abstract mixin class _$VenueModelCopyWith<$Res> implements $VenueModelCopyWith<$Res> {
  factory _$VenueModelCopyWith(_VenueModel value, $Res Function(_VenueModel) _then) = __$VenueModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int? id,@JsonKey(name: 'name') String? name,@JsonKey(name: 'city') String? city
});




}
/// @nodoc
class __$VenueModelCopyWithImpl<$Res>
    implements _$VenueModelCopyWith<$Res> {
  __$VenueModelCopyWithImpl(this._self, this._then);

  final _VenueModel _self;
  final $Res Function(_VenueModel) _then;

/// Create a copy of VenueModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? city = freezed,}) {
  return _then(_VenueModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$StatusModel {

@JsonKey(name: 'long') String get long;@JsonKey(name: 'short') String get short;@JsonKey(name: 'elapsed') int? get elapsed;
/// Create a copy of StatusModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StatusModelCopyWith<StatusModel> get copyWith => _$StatusModelCopyWithImpl<StatusModel>(this as StatusModel, _$identity);

  /// Serializes this StatusModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StatusModel&&(identical(other.long, long) || other.long == long)&&(identical(other.short, short) || other.short == short)&&(identical(other.elapsed, elapsed) || other.elapsed == elapsed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,long,short,elapsed);

@override
String toString() {
  return 'StatusModel(long: $long, short: $short, elapsed: $elapsed)';
}


}

/// @nodoc
abstract mixin class $StatusModelCopyWith<$Res>  {
  factory $StatusModelCopyWith(StatusModel value, $Res Function(StatusModel) _then) = _$StatusModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'long') String long,@JsonKey(name: 'short') String short,@JsonKey(name: 'elapsed') int? elapsed
});




}
/// @nodoc
class _$StatusModelCopyWithImpl<$Res>
    implements $StatusModelCopyWith<$Res> {
  _$StatusModelCopyWithImpl(this._self, this._then);

  final StatusModel _self;
  final $Res Function(StatusModel) _then;

/// Create a copy of StatusModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? long = null,Object? short = null,Object? elapsed = freezed,}) {
  return _then(_self.copyWith(
long: null == long ? _self.long : long // ignore: cast_nullable_to_non_nullable
as String,short: null == short ? _self.short : short // ignore: cast_nullable_to_non_nullable
as String,elapsed: freezed == elapsed ? _self.elapsed : elapsed // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [StatusModel].
extension StatusModelPatterns on StatusModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StatusModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StatusModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StatusModel value)  $default,){
final _that = this;
switch (_that) {
case _StatusModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StatusModel value)?  $default,){
final _that = this;
switch (_that) {
case _StatusModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'long')  String long, @JsonKey(name: 'short')  String short, @JsonKey(name: 'elapsed')  int? elapsed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StatusModel() when $default != null:
return $default(_that.long,_that.short,_that.elapsed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'long')  String long, @JsonKey(name: 'short')  String short, @JsonKey(name: 'elapsed')  int? elapsed)  $default,) {final _that = this;
switch (_that) {
case _StatusModel():
return $default(_that.long,_that.short,_that.elapsed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'long')  String long, @JsonKey(name: 'short')  String short, @JsonKey(name: 'elapsed')  int? elapsed)?  $default,) {final _that = this;
switch (_that) {
case _StatusModel() when $default != null:
return $default(_that.long,_that.short,_that.elapsed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StatusModel implements StatusModel {
  const _StatusModel({@JsonKey(name: 'long') required this.long, @JsonKey(name: 'short') required this.short, @JsonKey(name: 'elapsed') this.elapsed});
  factory _StatusModel.fromJson(Map<String, dynamic> json) => _$StatusModelFromJson(json);

@override@JsonKey(name: 'long') final  String long;
@override@JsonKey(name: 'short') final  String short;
@override@JsonKey(name: 'elapsed') final  int? elapsed;

/// Create a copy of StatusModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StatusModelCopyWith<_StatusModel> get copyWith => __$StatusModelCopyWithImpl<_StatusModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StatusModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StatusModel&&(identical(other.long, long) || other.long == long)&&(identical(other.short, short) || other.short == short)&&(identical(other.elapsed, elapsed) || other.elapsed == elapsed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,long,short,elapsed);

@override
String toString() {
  return 'StatusModel(long: $long, short: $short, elapsed: $elapsed)';
}


}

/// @nodoc
abstract mixin class _$StatusModelCopyWith<$Res> implements $StatusModelCopyWith<$Res> {
  factory _$StatusModelCopyWith(_StatusModel value, $Res Function(_StatusModel) _then) = __$StatusModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'long') String long,@JsonKey(name: 'short') String short,@JsonKey(name: 'elapsed') int? elapsed
});




}
/// @nodoc
class __$StatusModelCopyWithImpl<$Res>
    implements _$StatusModelCopyWith<$Res> {
  __$StatusModelCopyWithImpl(this._self, this._then);

  final _StatusModel _self;
  final $Res Function(_StatusModel) _then;

/// Create a copy of StatusModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? long = null,Object? short = null,Object? elapsed = freezed,}) {
  return _then(_StatusModel(
long: null == long ? _self.long : long // ignore: cast_nullable_to_non_nullable
as String,short: null == short ? _self.short : short // ignore: cast_nullable_to_non_nullable
as String,elapsed: freezed == elapsed ? _self.elapsed : elapsed // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$LeagueModel {

@JsonKey(name: 'id') int get id;@JsonKey(name: 'name') String get name;@JsonKey(name: 'country') String get country;@JsonKey(name: 'logo') String get logo;@JsonKey(name: 'flag') String? get flag;@JsonKey(name: 'season') int get season;@JsonKey(name: 'round') String get round;
/// Create a copy of LeagueModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LeagueModelCopyWith<LeagueModel> get copyWith => _$LeagueModelCopyWithImpl<LeagueModel>(this as LeagueModel, _$identity);

  /// Serializes this LeagueModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LeagueModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.country, country) || other.country == country)&&(identical(other.logo, logo) || other.logo == logo)&&(identical(other.flag, flag) || other.flag == flag)&&(identical(other.season, season) || other.season == season)&&(identical(other.round, round) || other.round == round));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,country,logo,flag,season,round);

@override
String toString() {
  return 'LeagueModel(id: $id, name: $name, country: $country, logo: $logo, flag: $flag, season: $season, round: $round)';
}


}

/// @nodoc
abstract mixin class $LeagueModelCopyWith<$Res>  {
  factory $LeagueModelCopyWith(LeagueModel value, $Res Function(LeagueModel) _then) = _$LeagueModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'name') String name,@JsonKey(name: 'country') String country,@JsonKey(name: 'logo') String logo,@JsonKey(name: 'flag') String? flag,@JsonKey(name: 'season') int season,@JsonKey(name: 'round') String round
});




}
/// @nodoc
class _$LeagueModelCopyWithImpl<$Res>
    implements $LeagueModelCopyWith<$Res> {
  _$LeagueModelCopyWithImpl(this._self, this._then);

  final LeagueModel _self;
  final $Res Function(LeagueModel) _then;

/// Create a copy of LeagueModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? country = null,Object? logo = null,Object? flag = freezed,Object? season = null,Object? round = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,logo: null == logo ? _self.logo : logo // ignore: cast_nullable_to_non_nullable
as String,flag: freezed == flag ? _self.flag : flag // ignore: cast_nullable_to_non_nullable
as String?,season: null == season ? _self.season : season // ignore: cast_nullable_to_non_nullable
as int,round: null == round ? _self.round : round // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LeagueModel].
extension LeagueModelPatterns on LeagueModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LeagueModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LeagueModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LeagueModel value)  $default,){
final _that = this;
switch (_that) {
case _LeagueModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LeagueModel value)?  $default,){
final _that = this;
switch (_that) {
case _LeagueModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'country')  String country, @JsonKey(name: 'logo')  String logo, @JsonKey(name: 'flag')  String? flag, @JsonKey(name: 'season')  int season, @JsonKey(name: 'round')  String round)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LeagueModel() when $default != null:
return $default(_that.id,_that.name,_that.country,_that.logo,_that.flag,_that.season,_that.round);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'country')  String country, @JsonKey(name: 'logo')  String logo, @JsonKey(name: 'flag')  String? flag, @JsonKey(name: 'season')  int season, @JsonKey(name: 'round')  String round)  $default,) {final _that = this;
switch (_that) {
case _LeagueModel():
return $default(_that.id,_that.name,_that.country,_that.logo,_that.flag,_that.season,_that.round);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'country')  String country, @JsonKey(name: 'logo')  String logo, @JsonKey(name: 'flag')  String? flag, @JsonKey(name: 'season')  int season, @JsonKey(name: 'round')  String round)?  $default,) {final _that = this;
switch (_that) {
case _LeagueModel() when $default != null:
return $default(_that.id,_that.name,_that.country,_that.logo,_that.flag,_that.season,_that.round);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LeagueModel implements LeagueModel {
  const _LeagueModel({@JsonKey(name: 'id') required this.id, @JsonKey(name: 'name') required this.name, @JsonKey(name: 'country') required this.country, @JsonKey(name: 'logo') required this.logo, @JsonKey(name: 'flag') this.flag, @JsonKey(name: 'season') required this.season, @JsonKey(name: 'round') required this.round});
  factory _LeagueModel.fromJson(Map<String, dynamic> json) => _$LeagueModelFromJson(json);

@override@JsonKey(name: 'id') final  int id;
@override@JsonKey(name: 'name') final  String name;
@override@JsonKey(name: 'country') final  String country;
@override@JsonKey(name: 'logo') final  String logo;
@override@JsonKey(name: 'flag') final  String? flag;
@override@JsonKey(name: 'season') final  int season;
@override@JsonKey(name: 'round') final  String round;

/// Create a copy of LeagueModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LeagueModelCopyWith<_LeagueModel> get copyWith => __$LeagueModelCopyWithImpl<_LeagueModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LeagueModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LeagueModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.country, country) || other.country == country)&&(identical(other.logo, logo) || other.logo == logo)&&(identical(other.flag, flag) || other.flag == flag)&&(identical(other.season, season) || other.season == season)&&(identical(other.round, round) || other.round == round));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,country,logo,flag,season,round);

@override
String toString() {
  return 'LeagueModel(id: $id, name: $name, country: $country, logo: $logo, flag: $flag, season: $season, round: $round)';
}


}

/// @nodoc
abstract mixin class _$LeagueModelCopyWith<$Res> implements $LeagueModelCopyWith<$Res> {
  factory _$LeagueModelCopyWith(_LeagueModel value, $Res Function(_LeagueModel) _then) = __$LeagueModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'name') String name,@JsonKey(name: 'country') String country,@JsonKey(name: 'logo') String logo,@JsonKey(name: 'flag') String? flag,@JsonKey(name: 'season') int season,@JsonKey(name: 'round') String round
});




}
/// @nodoc
class __$LeagueModelCopyWithImpl<$Res>
    implements _$LeagueModelCopyWith<$Res> {
  __$LeagueModelCopyWithImpl(this._self, this._then);

  final _LeagueModel _self;
  final $Res Function(_LeagueModel) _then;

/// Create a copy of LeagueModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? country = null,Object? logo = null,Object? flag = freezed,Object? season = null,Object? round = null,}) {
  return _then(_LeagueModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,logo: null == logo ? _self.logo : logo // ignore: cast_nullable_to_non_nullable
as String,flag: freezed == flag ? _self.flag : flag // ignore: cast_nullable_to_non_nullable
as String?,season: null == season ? _self.season : season // ignore: cast_nullable_to_non_nullable
as int,round: null == round ? _self.round : round // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$TeamsModel {

@JsonKey(name: 'home') TeamModel get home;@JsonKey(name: 'away') TeamModel get away;
/// Create a copy of TeamsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeamsModelCopyWith<TeamsModel> get copyWith => _$TeamsModelCopyWithImpl<TeamsModel>(this as TeamsModel, _$identity);

  /// Serializes this TeamsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeamsModel&&(identical(other.home, home) || other.home == home)&&(identical(other.away, away) || other.away == away));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,home,away);

@override
String toString() {
  return 'TeamsModel(home: $home, away: $away)';
}


}

/// @nodoc
abstract mixin class $TeamsModelCopyWith<$Res>  {
  factory $TeamsModelCopyWith(TeamsModel value, $Res Function(TeamsModel) _then) = _$TeamsModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'home') TeamModel home,@JsonKey(name: 'away') TeamModel away
});


$TeamModelCopyWith<$Res> get home;$TeamModelCopyWith<$Res> get away;

}
/// @nodoc
class _$TeamsModelCopyWithImpl<$Res>
    implements $TeamsModelCopyWith<$Res> {
  _$TeamsModelCopyWithImpl(this._self, this._then);

  final TeamsModel _self;
  final $Res Function(TeamsModel) _then;

/// Create a copy of TeamsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? home = null,Object? away = null,}) {
  return _then(_self.copyWith(
home: null == home ? _self.home : home // ignore: cast_nullable_to_non_nullable
as TeamModel,away: null == away ? _self.away : away // ignore: cast_nullable_to_non_nullable
as TeamModel,
  ));
}
/// Create a copy of TeamsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TeamModelCopyWith<$Res> get home {
  
  return $TeamModelCopyWith<$Res>(_self.home, (value) {
    return _then(_self.copyWith(home: value));
  });
}/// Create a copy of TeamsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TeamModelCopyWith<$Res> get away {
  
  return $TeamModelCopyWith<$Res>(_self.away, (value) {
    return _then(_self.copyWith(away: value));
  });
}
}


/// Adds pattern-matching-related methods to [TeamsModel].
extension TeamsModelPatterns on TeamsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TeamsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TeamsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TeamsModel value)  $default,){
final _that = this;
switch (_that) {
case _TeamsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TeamsModel value)?  $default,){
final _that = this;
switch (_that) {
case _TeamsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'home')  TeamModel home, @JsonKey(name: 'away')  TeamModel away)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TeamsModel() when $default != null:
return $default(_that.home,_that.away);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'home')  TeamModel home, @JsonKey(name: 'away')  TeamModel away)  $default,) {final _that = this;
switch (_that) {
case _TeamsModel():
return $default(_that.home,_that.away);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'home')  TeamModel home, @JsonKey(name: 'away')  TeamModel away)?  $default,) {final _that = this;
switch (_that) {
case _TeamsModel() when $default != null:
return $default(_that.home,_that.away);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TeamsModel implements TeamsModel {
  const _TeamsModel({@JsonKey(name: 'home') required this.home, @JsonKey(name: 'away') required this.away});
  factory _TeamsModel.fromJson(Map<String, dynamic> json) => _$TeamsModelFromJson(json);

@override@JsonKey(name: 'home') final  TeamModel home;
@override@JsonKey(name: 'away') final  TeamModel away;

/// Create a copy of TeamsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TeamsModelCopyWith<_TeamsModel> get copyWith => __$TeamsModelCopyWithImpl<_TeamsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TeamsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TeamsModel&&(identical(other.home, home) || other.home == home)&&(identical(other.away, away) || other.away == away));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,home,away);

@override
String toString() {
  return 'TeamsModel(home: $home, away: $away)';
}


}

/// @nodoc
abstract mixin class _$TeamsModelCopyWith<$Res> implements $TeamsModelCopyWith<$Res> {
  factory _$TeamsModelCopyWith(_TeamsModel value, $Res Function(_TeamsModel) _then) = __$TeamsModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'home') TeamModel home,@JsonKey(name: 'away') TeamModel away
});


@override $TeamModelCopyWith<$Res> get home;@override $TeamModelCopyWith<$Res> get away;

}
/// @nodoc
class __$TeamsModelCopyWithImpl<$Res>
    implements _$TeamsModelCopyWith<$Res> {
  __$TeamsModelCopyWithImpl(this._self, this._then);

  final _TeamsModel _self;
  final $Res Function(_TeamsModel) _then;

/// Create a copy of TeamsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? home = null,Object? away = null,}) {
  return _then(_TeamsModel(
home: null == home ? _self.home : home // ignore: cast_nullable_to_non_nullable
as TeamModel,away: null == away ? _self.away : away // ignore: cast_nullable_to_non_nullable
as TeamModel,
  ));
}

/// Create a copy of TeamsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TeamModelCopyWith<$Res> get home {
  
  return $TeamModelCopyWith<$Res>(_self.home, (value) {
    return _then(_self.copyWith(home: value));
  });
}/// Create a copy of TeamsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TeamModelCopyWith<$Res> get away {
  
  return $TeamModelCopyWith<$Res>(_self.away, (value) {
    return _then(_self.copyWith(away: value));
  });
}
}


/// @nodoc
mixin _$TeamModel {

@JsonKey(name: 'id') int get id;@JsonKey(name: 'name') String get name;@JsonKey(name: 'logo') String get logo;@JsonKey(name: 'winner') bool? get winner;
/// Create a copy of TeamModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeamModelCopyWith<TeamModel> get copyWith => _$TeamModelCopyWithImpl<TeamModel>(this as TeamModel, _$identity);

  /// Serializes this TeamModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeamModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.logo, logo) || other.logo == logo)&&(identical(other.winner, winner) || other.winner == winner));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,logo,winner);

@override
String toString() {
  return 'TeamModel(id: $id, name: $name, logo: $logo, winner: $winner)';
}


}

/// @nodoc
abstract mixin class $TeamModelCopyWith<$Res>  {
  factory $TeamModelCopyWith(TeamModel value, $Res Function(TeamModel) _then) = _$TeamModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'name') String name,@JsonKey(name: 'logo') String logo,@JsonKey(name: 'winner') bool? winner
});




}
/// @nodoc
class _$TeamModelCopyWithImpl<$Res>
    implements $TeamModelCopyWith<$Res> {
  _$TeamModelCopyWithImpl(this._self, this._then);

  final TeamModel _self;
  final $Res Function(TeamModel) _then;

/// Create a copy of TeamModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? logo = null,Object? winner = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,logo: null == logo ? _self.logo : logo // ignore: cast_nullable_to_non_nullable
as String,winner: freezed == winner ? _self.winner : winner // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [TeamModel].
extension TeamModelPatterns on TeamModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TeamModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TeamModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TeamModel value)  $default,){
final _that = this;
switch (_that) {
case _TeamModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TeamModel value)?  $default,){
final _that = this;
switch (_that) {
case _TeamModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'logo')  String logo, @JsonKey(name: 'winner')  bool? winner)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TeamModel() when $default != null:
return $default(_that.id,_that.name,_that.logo,_that.winner);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'logo')  String logo, @JsonKey(name: 'winner')  bool? winner)  $default,) {final _that = this;
switch (_that) {
case _TeamModel():
return $default(_that.id,_that.name,_that.logo,_that.winner);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'logo')  String logo, @JsonKey(name: 'winner')  bool? winner)?  $default,) {final _that = this;
switch (_that) {
case _TeamModel() when $default != null:
return $default(_that.id,_that.name,_that.logo,_that.winner);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TeamModel implements TeamModel {
  const _TeamModel({@JsonKey(name: 'id') required this.id, @JsonKey(name: 'name') required this.name, @JsonKey(name: 'logo') required this.logo, @JsonKey(name: 'winner') this.winner});
  factory _TeamModel.fromJson(Map<String, dynamic> json) => _$TeamModelFromJson(json);

@override@JsonKey(name: 'id') final  int id;
@override@JsonKey(name: 'name') final  String name;
@override@JsonKey(name: 'logo') final  String logo;
@override@JsonKey(name: 'winner') final  bool? winner;

/// Create a copy of TeamModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TeamModelCopyWith<_TeamModel> get copyWith => __$TeamModelCopyWithImpl<_TeamModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TeamModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TeamModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.logo, logo) || other.logo == logo)&&(identical(other.winner, winner) || other.winner == winner));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,logo,winner);

@override
String toString() {
  return 'TeamModel(id: $id, name: $name, logo: $logo, winner: $winner)';
}


}

/// @nodoc
abstract mixin class _$TeamModelCopyWith<$Res> implements $TeamModelCopyWith<$Res> {
  factory _$TeamModelCopyWith(_TeamModel value, $Res Function(_TeamModel) _then) = __$TeamModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'name') String name,@JsonKey(name: 'logo') String logo,@JsonKey(name: 'winner') bool? winner
});




}
/// @nodoc
class __$TeamModelCopyWithImpl<$Res>
    implements _$TeamModelCopyWith<$Res> {
  __$TeamModelCopyWithImpl(this._self, this._then);

  final _TeamModel _self;
  final $Res Function(_TeamModel) _then;

/// Create a copy of TeamModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? logo = null,Object? winner = freezed,}) {
  return _then(_TeamModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,logo: null == logo ? _self.logo : logo // ignore: cast_nullable_to_non_nullable
as String,winner: freezed == winner ? _self.winner : winner // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}


/// @nodoc
mixin _$GoalsModel {

@JsonKey(name: 'home') int? get home;@JsonKey(name: 'away') int? get away;
/// Create a copy of GoalsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GoalsModelCopyWith<GoalsModel> get copyWith => _$GoalsModelCopyWithImpl<GoalsModel>(this as GoalsModel, _$identity);

  /// Serializes this GoalsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GoalsModel&&(identical(other.home, home) || other.home == home)&&(identical(other.away, away) || other.away == away));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,home,away);

@override
String toString() {
  return 'GoalsModel(home: $home, away: $away)';
}


}

/// @nodoc
abstract mixin class $GoalsModelCopyWith<$Res>  {
  factory $GoalsModelCopyWith(GoalsModel value, $Res Function(GoalsModel) _then) = _$GoalsModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'home') int? home,@JsonKey(name: 'away') int? away
});




}
/// @nodoc
class _$GoalsModelCopyWithImpl<$Res>
    implements $GoalsModelCopyWith<$Res> {
  _$GoalsModelCopyWithImpl(this._self, this._then);

  final GoalsModel _self;
  final $Res Function(GoalsModel) _then;

/// Create a copy of GoalsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? home = freezed,Object? away = freezed,}) {
  return _then(_self.copyWith(
home: freezed == home ? _self.home : home // ignore: cast_nullable_to_non_nullable
as int?,away: freezed == away ? _self.away : away // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [GoalsModel].
extension GoalsModelPatterns on GoalsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GoalsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GoalsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GoalsModel value)  $default,){
final _that = this;
switch (_that) {
case _GoalsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GoalsModel value)?  $default,){
final _that = this;
switch (_that) {
case _GoalsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'home')  int? home, @JsonKey(name: 'away')  int? away)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GoalsModel() when $default != null:
return $default(_that.home,_that.away);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'home')  int? home, @JsonKey(name: 'away')  int? away)  $default,) {final _that = this;
switch (_that) {
case _GoalsModel():
return $default(_that.home,_that.away);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'home')  int? home, @JsonKey(name: 'away')  int? away)?  $default,) {final _that = this;
switch (_that) {
case _GoalsModel() when $default != null:
return $default(_that.home,_that.away);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GoalsModel implements GoalsModel {
  const _GoalsModel({@JsonKey(name: 'home') this.home, @JsonKey(name: 'away') this.away});
  factory _GoalsModel.fromJson(Map<String, dynamic> json) => _$GoalsModelFromJson(json);

@override@JsonKey(name: 'home') final  int? home;
@override@JsonKey(name: 'away') final  int? away;

/// Create a copy of GoalsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GoalsModelCopyWith<_GoalsModel> get copyWith => __$GoalsModelCopyWithImpl<_GoalsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GoalsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GoalsModel&&(identical(other.home, home) || other.home == home)&&(identical(other.away, away) || other.away == away));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,home,away);

@override
String toString() {
  return 'GoalsModel(home: $home, away: $away)';
}


}

/// @nodoc
abstract mixin class _$GoalsModelCopyWith<$Res> implements $GoalsModelCopyWith<$Res> {
  factory _$GoalsModelCopyWith(_GoalsModel value, $Res Function(_GoalsModel) _then) = __$GoalsModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'home') int? home,@JsonKey(name: 'away') int? away
});




}
/// @nodoc
class __$GoalsModelCopyWithImpl<$Res>
    implements _$GoalsModelCopyWith<$Res> {
  __$GoalsModelCopyWithImpl(this._self, this._then);

  final _GoalsModel _self;
  final $Res Function(_GoalsModel) _then;

/// Create a copy of GoalsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? home = freezed,Object? away = freezed,}) {
  return _then(_GoalsModel(
home: freezed == home ? _self.home : home // ignore: cast_nullable_to_non_nullable
as int?,away: freezed == away ? _self.away : away // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$ScoreModel {

@JsonKey(name: 'halftime') GoalsModel get halftime;@JsonKey(name: 'fulltime') GoalsModel get fulltime;@JsonKey(name: 'extratime') GoalsModel get extratime;@JsonKey(name: 'penalty') GoalsModel get penalty;
/// Create a copy of ScoreModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScoreModelCopyWith<ScoreModel> get copyWith => _$ScoreModelCopyWithImpl<ScoreModel>(this as ScoreModel, _$identity);

  /// Serializes this ScoreModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScoreModel&&(identical(other.halftime, halftime) || other.halftime == halftime)&&(identical(other.fulltime, fulltime) || other.fulltime == fulltime)&&(identical(other.extratime, extratime) || other.extratime == extratime)&&(identical(other.penalty, penalty) || other.penalty == penalty));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,halftime,fulltime,extratime,penalty);

@override
String toString() {
  return 'ScoreModel(halftime: $halftime, fulltime: $fulltime, extratime: $extratime, penalty: $penalty)';
}


}

/// @nodoc
abstract mixin class $ScoreModelCopyWith<$Res>  {
  factory $ScoreModelCopyWith(ScoreModel value, $Res Function(ScoreModel) _then) = _$ScoreModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'halftime') GoalsModel halftime,@JsonKey(name: 'fulltime') GoalsModel fulltime,@JsonKey(name: 'extratime') GoalsModel extratime,@JsonKey(name: 'penalty') GoalsModel penalty
});


$GoalsModelCopyWith<$Res> get halftime;$GoalsModelCopyWith<$Res> get fulltime;$GoalsModelCopyWith<$Res> get extratime;$GoalsModelCopyWith<$Res> get penalty;

}
/// @nodoc
class _$ScoreModelCopyWithImpl<$Res>
    implements $ScoreModelCopyWith<$Res> {
  _$ScoreModelCopyWithImpl(this._self, this._then);

  final ScoreModel _self;
  final $Res Function(ScoreModel) _then;

/// Create a copy of ScoreModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? halftime = null,Object? fulltime = null,Object? extratime = null,Object? penalty = null,}) {
  return _then(_self.copyWith(
halftime: null == halftime ? _self.halftime : halftime // ignore: cast_nullable_to_non_nullable
as GoalsModel,fulltime: null == fulltime ? _self.fulltime : fulltime // ignore: cast_nullable_to_non_nullable
as GoalsModel,extratime: null == extratime ? _self.extratime : extratime // ignore: cast_nullable_to_non_nullable
as GoalsModel,penalty: null == penalty ? _self.penalty : penalty // ignore: cast_nullable_to_non_nullable
as GoalsModel,
  ));
}
/// Create a copy of ScoreModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GoalsModelCopyWith<$Res> get halftime {
  
  return $GoalsModelCopyWith<$Res>(_self.halftime, (value) {
    return _then(_self.copyWith(halftime: value));
  });
}/// Create a copy of ScoreModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GoalsModelCopyWith<$Res> get fulltime {
  
  return $GoalsModelCopyWith<$Res>(_self.fulltime, (value) {
    return _then(_self.copyWith(fulltime: value));
  });
}/// Create a copy of ScoreModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GoalsModelCopyWith<$Res> get extratime {
  
  return $GoalsModelCopyWith<$Res>(_self.extratime, (value) {
    return _then(_self.copyWith(extratime: value));
  });
}/// Create a copy of ScoreModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GoalsModelCopyWith<$Res> get penalty {
  
  return $GoalsModelCopyWith<$Res>(_self.penalty, (value) {
    return _then(_self.copyWith(penalty: value));
  });
}
}


/// Adds pattern-matching-related methods to [ScoreModel].
extension ScoreModelPatterns on ScoreModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScoreModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScoreModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScoreModel value)  $default,){
final _that = this;
switch (_that) {
case _ScoreModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScoreModel value)?  $default,){
final _that = this;
switch (_that) {
case _ScoreModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'halftime')  GoalsModel halftime, @JsonKey(name: 'fulltime')  GoalsModel fulltime, @JsonKey(name: 'extratime')  GoalsModel extratime, @JsonKey(name: 'penalty')  GoalsModel penalty)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScoreModel() when $default != null:
return $default(_that.halftime,_that.fulltime,_that.extratime,_that.penalty);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'halftime')  GoalsModel halftime, @JsonKey(name: 'fulltime')  GoalsModel fulltime, @JsonKey(name: 'extratime')  GoalsModel extratime, @JsonKey(name: 'penalty')  GoalsModel penalty)  $default,) {final _that = this;
switch (_that) {
case _ScoreModel():
return $default(_that.halftime,_that.fulltime,_that.extratime,_that.penalty);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'halftime')  GoalsModel halftime, @JsonKey(name: 'fulltime')  GoalsModel fulltime, @JsonKey(name: 'extratime')  GoalsModel extratime, @JsonKey(name: 'penalty')  GoalsModel penalty)?  $default,) {final _that = this;
switch (_that) {
case _ScoreModel() when $default != null:
return $default(_that.halftime,_that.fulltime,_that.extratime,_that.penalty);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ScoreModel implements ScoreModel {
  const _ScoreModel({@JsonKey(name: 'halftime') required this.halftime, @JsonKey(name: 'fulltime') required this.fulltime, @JsonKey(name: 'extratime') required this.extratime, @JsonKey(name: 'penalty') required this.penalty});
  factory _ScoreModel.fromJson(Map<String, dynamic> json) => _$ScoreModelFromJson(json);

@override@JsonKey(name: 'halftime') final  GoalsModel halftime;
@override@JsonKey(name: 'fulltime') final  GoalsModel fulltime;
@override@JsonKey(name: 'extratime') final  GoalsModel extratime;
@override@JsonKey(name: 'penalty') final  GoalsModel penalty;

/// Create a copy of ScoreModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScoreModelCopyWith<_ScoreModel> get copyWith => __$ScoreModelCopyWithImpl<_ScoreModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ScoreModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScoreModel&&(identical(other.halftime, halftime) || other.halftime == halftime)&&(identical(other.fulltime, fulltime) || other.fulltime == fulltime)&&(identical(other.extratime, extratime) || other.extratime == extratime)&&(identical(other.penalty, penalty) || other.penalty == penalty));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,halftime,fulltime,extratime,penalty);

@override
String toString() {
  return 'ScoreModel(halftime: $halftime, fulltime: $fulltime, extratime: $extratime, penalty: $penalty)';
}


}

/// @nodoc
abstract mixin class _$ScoreModelCopyWith<$Res> implements $ScoreModelCopyWith<$Res> {
  factory _$ScoreModelCopyWith(_ScoreModel value, $Res Function(_ScoreModel) _then) = __$ScoreModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'halftime') GoalsModel halftime,@JsonKey(name: 'fulltime') GoalsModel fulltime,@JsonKey(name: 'extratime') GoalsModel extratime,@JsonKey(name: 'penalty') GoalsModel penalty
});


@override $GoalsModelCopyWith<$Res> get halftime;@override $GoalsModelCopyWith<$Res> get fulltime;@override $GoalsModelCopyWith<$Res> get extratime;@override $GoalsModelCopyWith<$Res> get penalty;

}
/// @nodoc
class __$ScoreModelCopyWithImpl<$Res>
    implements _$ScoreModelCopyWith<$Res> {
  __$ScoreModelCopyWithImpl(this._self, this._then);

  final _ScoreModel _self;
  final $Res Function(_ScoreModel) _then;

/// Create a copy of ScoreModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? halftime = null,Object? fulltime = null,Object? extratime = null,Object? penalty = null,}) {
  return _then(_ScoreModel(
halftime: null == halftime ? _self.halftime : halftime // ignore: cast_nullable_to_non_nullable
as GoalsModel,fulltime: null == fulltime ? _self.fulltime : fulltime // ignore: cast_nullable_to_non_nullable
as GoalsModel,extratime: null == extratime ? _self.extratime : extratime // ignore: cast_nullable_to_non_nullable
as GoalsModel,penalty: null == penalty ? _self.penalty : penalty // ignore: cast_nullable_to_non_nullable
as GoalsModel,
  ));
}

/// Create a copy of ScoreModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GoalsModelCopyWith<$Res> get halftime {
  
  return $GoalsModelCopyWith<$Res>(_self.halftime, (value) {
    return _then(_self.copyWith(halftime: value));
  });
}/// Create a copy of ScoreModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GoalsModelCopyWith<$Res> get fulltime {
  
  return $GoalsModelCopyWith<$Res>(_self.fulltime, (value) {
    return _then(_self.copyWith(fulltime: value));
  });
}/// Create a copy of ScoreModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GoalsModelCopyWith<$Res> get extratime {
  
  return $GoalsModelCopyWith<$Res>(_self.extratime, (value) {
    return _then(_self.copyWith(extratime: value));
  });
}/// Create a copy of ScoreModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GoalsModelCopyWith<$Res> get penalty {
  
  return $GoalsModelCopyWith<$Res>(_self.penalty, (value) {
    return _then(_self.copyWith(penalty: value));
  });
}
}

// dart format on
