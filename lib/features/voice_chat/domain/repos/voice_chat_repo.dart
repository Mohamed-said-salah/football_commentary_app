import 'package:dartz/dartz.dart';
import 'package:football_commentary_app/core/error/failures.dart';
import 'package:football_commentary_app/features/voice_chat/domain/entities/voice_chat_room_entity.dart';

abstract class VoiceChatRepo {
  Future<Either<Failure, List<VoiceChatRoomEntity>>> getRooms();
  Future<Either<Failure, List<VoiceChatRoomEntity>>> getRoomsByMatch(int matchId);
  Future<Either<Failure, VoiceChatRoomEntity>> createRoom({
    required String name,
    String? description,
    int? matchId,
    required String createdBy,
    required String createdByName,
  });
  Future<Either<Failure, void>> joinRoom(String roomId, String userId);
  Future<Either<Failure, void>> leaveRoom(String roomId, String userId);
  Stream<List<VoiceChatRoomEntity>> getRoomsStream();
  Stream<List<VoiceChatRoomEntity>> getRoomsByMatchStream(int matchId);
}

