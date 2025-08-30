import 'package:dartz/dartz.dart';
import 'package:football_commentary_app/core/error/failures.dart';
import 'package:football_commentary_app/features/voice_chat/domain/entities/voice_chat_room_entity.dart';
import 'package:football_commentary_app/features/voice_chat/domain/repos/voice_chat_repo.dart';

class GetRoomsUseCase {
  final VoiceChatRepo _voiceChatRepo;

  GetRoomsUseCase(this._voiceChatRepo);

  Future<Either<Failure, List<VoiceChatRoomEntity>>> call() async {
    return await _voiceChatRepo.getRooms();
  }

  Future<Either<Failure, List<VoiceChatRoomEntity>>> getRoomsByMatch(int matchId) async {
    return await _voiceChatRepo.getRoomsByMatch(matchId);
  }

  Stream<List<VoiceChatRoomEntity>> getRoomsStream() {
    return _voiceChatRepo.getRoomsStream();
  }

  Stream<List<VoiceChatRoomEntity>> getRoomsByMatchStream(int matchId) {
    return _voiceChatRepo.getRoomsByMatchStream(matchId);
  }
}

