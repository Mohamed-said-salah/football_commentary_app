import 'package:dartz/dartz.dart';
import 'package:football_commentary_app/core/error/failures.dart';
import 'package:football_commentary_app/features/voice_chat/domain/repos/voice_chat_repo.dart';

class JoinRoomUseCase {
  final VoiceChatRepo _voiceChatRepo;

  JoinRoomUseCase(this._voiceChatRepo);

  Future<Either<Failure, void>> call(String roomId, String userId) async {
    return await _voiceChatRepo.joinRoom(roomId, userId);
  }
}

