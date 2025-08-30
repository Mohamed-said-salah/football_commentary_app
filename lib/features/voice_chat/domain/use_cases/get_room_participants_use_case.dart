import 'package:dartz/dartz.dart';
import 'package:football_commentary_app/core/error/failures.dart';
import 'package:football_commentary_app/features/voice_chat/domain/repos/voice_chat_repo.dart';

class GetRoomParticipantsUseCase {
  final VoiceChatRepo _voiceChatRepo;

  GetRoomParticipantsUseCase(this._voiceChatRepo);

  Future<Either<Failure, List<Map<String, dynamic>>>> call(String roomId) async {
    return await _voiceChatRepo.getRoomParticipants(roomId);
  }
}
