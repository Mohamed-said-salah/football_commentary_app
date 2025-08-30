// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voice_chat_room_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VoiceChatRoomModel _$VoiceChatRoomModelFromJson(Map<String, dynamic> json) =>
    _VoiceChatRoomModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      matchId: (json['match_id'] as num?)?.toInt(),
      createdBy: json['created_by'] as String,
      createdByName: json['created_by_name'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      participantCount: (json['participant_count'] as num).toInt(),
      maxParticipants: (json['max_participants'] as num?)?.toInt() ?? 10,
      isActive: json['is_active'] as bool? ?? true,
    );

Map<String, dynamic> _$VoiceChatRoomModelToJson(_VoiceChatRoomModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'match_id': instance.matchId,
      'created_by': instance.createdBy,
      'created_by_name': instance.createdByName,
      'created_at': instance.createdAt.toIso8601String(),
      'participant_count': instance.participantCount,
      'max_participants': instance.maxParticipants,
      'is_active': instance.isActive,
    };
