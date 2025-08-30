import 'package:equatable/equatable.dart';

class VoiceChatRoomEntity extends Equatable {
  final String id;
  final String name;
  final String? description;
  final int? matchId;
  final String createdBy;
  final String createdByName;
  final DateTime createdAt;
  final int participantCount;
  final int maxParticipants;
  final bool isActive;

  const VoiceChatRoomEntity({
    required this.id,
    required this.name,
    this.description,
    this.matchId,
    required this.createdBy,
    required this.createdByName,
    required this.createdAt,
    required this.participantCount,
    this.maxParticipants = 10,
    this.isActive = true,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        matchId,
        createdBy,
        createdByName,
        createdAt,
        participantCount,
        maxParticipants,
        isActive,
      ];
}

