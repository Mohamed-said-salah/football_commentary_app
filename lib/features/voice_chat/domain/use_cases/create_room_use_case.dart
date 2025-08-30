import 'package:dartz/dartz.dart';
import 'package:football_commentary_app/core/error/failures.dart';
import 'package:football_commentary_app/features/voice_chat/domain/entities/voice_chat_room_entity.dart';
import 'package:football_commentary_app/features/voice_chat/domain/repos/voice_chat_repo.dart';

class CreateRoomUseCase {
  final VoiceChatRepo _voiceChatRepo;

  CreateRoomUseCase(this._voiceChatRepo);

  Future<Either<Failure, VoiceChatRoomEntity>> call({
    required String name,
    String? description,
    int? matchId,
    required String createdBy,
    required String createdByName,
  }) async {
    return await _voiceChatRepo.createRoom(
      name: name,
      description: description,
      matchId: matchId,
      createdBy: createdBy,
      createdByName: createdByName,
    );
  }
}

