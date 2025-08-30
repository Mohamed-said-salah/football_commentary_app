import 'package:dartz/dartz.dart';
import 'package:football_commentary_app/core/error/failures.dart';
import 'package:football_commentary_app/features/voice_chat/domain/repos/voice_chat_repo.dart';

class LeaveRoomUseCase {
  final VoiceChatRepo _voiceChatRepo;

  LeaveRoomUseCase(this._voiceChatRepo);

  Future<Either<Failure, void>> call(String roomId, String userId) async {
    return await _voiceChatRepo.leaveRoom(roomId, userId);
  }
}

