// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'voice_chat_room_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VoiceChatRoomModel {

 String get id; String get name; String? get description;@JsonKey(name: 'match_id') int? get matchId;@JsonKey(name: 'created_by') String get createdBy;@JsonKey(name: 'created_by_name') String get createdByName;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'participant_count') int get participantCount;@JsonKey(name: 'max_participants') int get maxParticipants;@JsonKey(name: 'is_active') bool get isActive;
/// Create a copy of VoiceChatRoomModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VoiceChatRoomModelCopyWith<VoiceChatRoomModel> get copyWith => _$VoiceChatRoomModelCopyWithImpl<VoiceChatRoomModel>(this as VoiceChatRoomModel, _$identity);

  /// Serializes this VoiceChatRoomModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VoiceChatRoomModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.matchId, matchId) || other.matchId == matchId)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.createdByName, createdByName) || other.createdByName == createdByName)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.participantCount, participantCount) || other.participantCount == participantCount)&&(identical(other.maxParticipants, maxParticipants) || other.maxParticipants == maxParticipants)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,matchId,createdBy,createdByName,createdAt,participantCount,maxParticipants,isActive);

@override
String toString() {
  return 'VoiceChatRoomModel(id: $id, name: $name, description: $description, matchId: $matchId, createdBy: $createdBy, createdByName: $createdByName, createdAt: $createdAt, participantCount: $participantCount, maxParticipants: $maxParticipants, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class $VoiceChatRoomModelCopyWith<$Res>  {
  factory $VoiceChatRoomModelCopyWith(VoiceChatRoomModel value, $Res Function(VoiceChatRoomModel) _then) = _$VoiceChatRoomModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? description,@JsonKey(name: 'match_id') int? matchId,@JsonKey(name: 'created_by') String createdBy,@JsonKey(name: 'created_by_name') String createdByName,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'participant_count') int participantCount,@JsonKey(name: 'max_participants') int maxParticipants,@JsonKey(name: 'is_active') bool isActive
});




}
/// @nodoc
class _$VoiceChatRoomModelCopyWithImpl<$Res>
    implements $VoiceChatRoomModelCopyWith<$Res> {
  _$VoiceChatRoomModelCopyWithImpl(this._self, this._then);

  final VoiceChatRoomModel _self;
  final $Res Function(VoiceChatRoomModel) _then;

/// Create a copy of VoiceChatRoomModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? matchId = freezed,Object? createdBy = null,Object? createdByName = null,Object? createdAt = null,Object? participantCount = null,Object? maxParticipants = null,Object? isActive = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,matchId: freezed == matchId ? _self.matchId : matchId // ignore: cast_nullable_to_non_nullable
as int?,createdBy: null == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String,createdByName: null == createdByName ? _self.createdByName : createdByName // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,participantCount: null == participantCount ? _self.participantCount : participantCount // ignore: cast_nullable_to_non_nullable
as int,maxParticipants: null == maxParticipants ? _self.maxParticipants : maxParticipants // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [VoiceChatRoomModel].
extension VoiceChatRoomModelPatterns on VoiceChatRoomModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VoiceChatRoomModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VoiceChatRoomModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VoiceChatRoomModel value)  $default,){
final _that = this;
switch (_that) {
case _VoiceChatRoomModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VoiceChatRoomModel value)?  $default,){
final _that = this;
switch (_that) {
case _VoiceChatRoomModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? description, @JsonKey(name: 'match_id')  int? matchId, @JsonKey(name: 'created_by')  String createdBy, @JsonKey(name: 'created_by_name')  String createdByName, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'participant_count')  int participantCount, @JsonKey(name: 'max_participants')  int maxParticipants, @JsonKey(name: 'is_active')  bool isActive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VoiceChatRoomModel() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.matchId,_that.createdBy,_that.createdByName,_that.createdAt,_that.participantCount,_that.maxParticipants,_that.isActive);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? description, @JsonKey(name: 'match_id')  int? matchId, @JsonKey(name: 'created_by')  String createdBy, @JsonKey(name: 'created_by_name')  String createdByName, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'participant_count')  int participantCount, @JsonKey(name: 'max_participants')  int maxParticipants, @JsonKey(name: 'is_active')  bool isActive)  $default,) {final _that = this;
switch (_that) {
case _VoiceChatRoomModel():
return $default(_that.id,_that.name,_that.description,_that.matchId,_that.createdBy,_that.createdByName,_that.createdAt,_that.participantCount,_that.maxParticipants,_that.isActive);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? description, @JsonKey(name: 'match_id')  int? matchId, @JsonKey(name: 'created_by')  String createdBy, @JsonKey(name: 'created_by_name')  String createdByName, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'participant_count')  int participantCount, @JsonKey(name: 'max_participants')  int maxParticipants, @JsonKey(name: 'is_active')  bool isActive)?  $default,) {final _that = this;
switch (_that) {
case _VoiceChatRoomModel() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.matchId,_that.createdBy,_that.createdByName,_that.createdAt,_that.participantCount,_that.maxParticipants,_that.isActive);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VoiceChatRoomModel implements VoiceChatRoomModel {
  const _VoiceChatRoomModel({required this.id, required this.name, this.description, @JsonKey(name: 'match_id') this.matchId, @JsonKey(name: 'created_by') required this.createdBy, @JsonKey(name: 'created_by_name') required this.createdByName, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'participant_count') required this.participantCount, @JsonKey(name: 'max_participants') this.maxParticipants = 10, @JsonKey(name: 'is_active') this.isActive = true});
  factory _VoiceChatRoomModel.fromJson(Map<String, dynamic> json) => _$VoiceChatRoomModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? description;
@override@JsonKey(name: 'match_id') final  int? matchId;
@override@JsonKey(name: 'created_by') final  String createdBy;
@override@JsonKey(name: 'created_by_name') final  String createdByName;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'participant_count') final  int participantCount;
@override@JsonKey(name: 'max_participants') final  int maxParticipants;
@override@JsonKey(name: 'is_active') final  bool isActive;

/// Create a copy of VoiceChatRoomModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VoiceChatRoomModelCopyWith<_VoiceChatRoomModel> get copyWith => __$VoiceChatRoomModelCopyWithImpl<_VoiceChatRoomModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VoiceChatRoomModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VoiceChatRoomModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.matchId, matchId) || other.matchId == matchId)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.createdByName, createdByName) || other.createdByName == createdByName)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.participantCount, participantCount) || other.participantCount == participantCount)&&(identical(other.maxParticipants, maxParticipants) || other.maxParticipants == maxParticipants)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,matchId,createdBy,createdByName,createdAt,participantCount,maxParticipants,isActive);

@override
String toString() {
  return 'VoiceChatRoomModel(id: $id, name: $name, description: $description, matchId: $matchId, createdBy: $createdBy, createdByName: $createdByName, createdAt: $createdAt, participantCount: $participantCount, maxParticipants: $maxParticipants, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class _$VoiceChatRoomModelCopyWith<$Res> implements $VoiceChatRoomModelCopyWith<$Res> {
  factory _$VoiceChatRoomModelCopyWith(_VoiceChatRoomModel value, $Res Function(_VoiceChatRoomModel) _then) = __$VoiceChatRoomModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? description,@JsonKey(name: 'match_id') int? matchId,@JsonKey(name: 'created_by') String createdBy,@JsonKey(name: 'created_by_name') String createdByName,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'participant_count') int participantCount,@JsonKey(name: 'max_participants') int maxParticipants,@JsonKey(name: 'is_active') bool isActive
});




}
/// @nodoc
class __$VoiceChatRoomModelCopyWithImpl<$Res>
    implements _$VoiceChatRoomModelCopyWith<$Res> {
  __$VoiceChatRoomModelCopyWithImpl(this._self, this._then);

  final _VoiceChatRoomModel _self;
  final $Res Function(_VoiceChatRoomModel) _then;

/// Create a copy of VoiceChatRoomModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? matchId = freezed,Object? createdBy = null,Object? createdByName = null,Object? createdAt = null,Object? participantCount = null,Object? maxParticipants = null,Object? isActive = null,}) {
  return _then(_VoiceChatRoomModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,matchId: freezed == matchId ? _self.matchId : matchId // ignore: cast_nullable_to_non_nullable
as int?,createdBy: null == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String,createdByName: null == createdByName ? _self.createdByName : createdByName // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,participantCount: null == participantCount ? _self.participantCount : participantCount // ignore: cast_nullable_to_non_nullable
as int,maxParticipants: null == maxParticipants ? _self.maxParticipants : maxParticipants // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
