import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:football_commentary_app/features/voice_chat/domain/entities/voice_chat_room_entity.dart';

part 'voice_chat_room_model.freezed.dart';
part 'voice_chat_room_model.g.dart';

@freezed
abstract class VoiceChatRoomModel with _$VoiceChatRoomModel {
  const factory VoiceChatRoomModel({
    required String id,
    required String name,
    String? description,
    @JsonKey(name: 'match_id') int? matchId,
    @JsonKey(name: 'created_by') required String createdBy,
    @JsonKey(name: 'created_by_name') required String createdByName,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'participant_count') required int participantCount,
    @JsonKey(name: 'max_participants') @Default(10) int maxParticipants,
    @JsonKey(name: 'is_active') @Default(true) bool isActive,
  }) = _VoiceChatRoomModel;

  factory VoiceChatRoomModel.fromJson(Map<String, dynamic> json) =>
      _$VoiceChatRoomModelFromJson(json);
}

extension VoiceChatRoomModelX on VoiceChatRoomModel {
  VoiceChatRoomEntity toEntity() {
    return VoiceChatRoomEntity(
      id: id,
      name: name,
      description: description,
      matchId: matchId,
      createdBy: createdBy,
      createdByName: createdByName,
      createdAt: createdAt,
      participantCount: participantCount,
      maxParticipants: maxParticipants,
      isActive: isActive,
    );
  }
}
