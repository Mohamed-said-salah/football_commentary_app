import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:football_commentary_app/core/error/failures.dart';
import 'package:football_commentary_app/features/voice_chat/domain/entities/voice_chat_room_entity.dart';
import 'package:football_commentary_app/features/voice_chat/domain/repos/voice_chat_repo.dart';

class VoiceChatRepoImpl implements VoiceChatRepo {
  final DatabaseReference _database = FirebaseDatabase.instance.ref();

  @override
  Future<Either<Failure, List<VoiceChatRoomEntity>>> getRooms() async {
    try {
      print('🔍 VoiceChat: Fetching all rooms from Firebase...');
      final snapshot = await _database.child('voice_chat_rooms').get();
      print('🔍 VoiceChat: Firebase snapshot exists: ${snapshot.exists}');

      if (!snapshot.exists) {
        print('🔍 VoiceChat: No rooms found in database');
        return const Right([]);
      }

      final rooms = <VoiceChatRoomEntity>[];
      final data = snapshot.value as Map<dynamic, dynamic>;
      print('🔍 VoiceChat: Raw data from Firebase: $data');

      data.forEach((key, value) {
        try {
          final roomData = Map<String, dynamic>.from(value as Map);
          print('🔍 VoiceChat: Processing room $key: $roomData');

          final room = VoiceChatRoomEntity(
            id: key.toString(),
            name: roomData['name'] ?? '',
            description: roomData['description'],
            matchId: roomData['match_id'],
            createdBy: roomData['created_by'] ?? '',
            createdByName: roomData['created_by_name'] ?? '',
            createdAt: DateTime.fromMillisecondsSinceEpoch(
              roomData['created_at'] ?? DateTime.now().millisecondsSinceEpoch,
            ),
            participantCount: roomData['participant_count'] ?? 0,
            maxParticipants: roomData['max_participants'] ?? 10,
            isActive: roomData['is_active'] ?? true,
          );

          rooms.add(room);
          print('🔍 VoiceChat: Successfully created room entity: ${room.name}');
        } catch (e) {
          print('❌ VoiceChat: Error processing room $key: $e');
        }
      });

      // Sort by creation date (newest first)
      rooms.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      print('🔍 VoiceChat: Total rooms found: ${rooms.length}');

      return Right(rooms);
    } catch (e) {
      print('❌ VoiceChat: Error fetching rooms: $e');
      return Left(ServerFailure('Failed to get rooms: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<VoiceChatRoomEntity>>> getRoomsByMatch(
    int matchId,
  ) async {
    try {
      print('🔍 VoiceChat: Fetching rooms for match ID: $matchId');
      final snapshot = await _database.child('voice_chat_rooms').get();
      print('🔍 VoiceChat: Firebase snapshot exists: ${snapshot.exists}');

      if (!snapshot.exists) {
        print('🔍 VoiceChat: No rooms found in database');
        return const Right([]);
      }

      final rooms = <VoiceChatRoomEntity>[];
      final data = snapshot.value as Map<dynamic, dynamic>;
      print('🔍 VoiceChat: Raw data from Firebase: $data');
      print('🔍 VoiceChat: Total rooms in database: ${data.length}');

      data.forEach((key, value) {
        try {
          final roomData = Map<String, dynamic>.from(value as Map);
          final roomMatchId = roomData['match_id'];
          print(
            '🔍 VoiceChat: Room $key has match_id: $roomMatchId (looking for: $matchId)',
          );
          print('🔍 VoiceChat: Room $key data: $roomData');

          // Only include rooms that match the specified matchId
          if (roomMatchId == matchId) {
            print(
              '🔍 VoiceChat: Processing room $key for match $matchId: $roomData',
            );

            final room = VoiceChatRoomEntity(
              id: key.toString(),
              name: roomData['name'] ?? '',
              description: roomData['description'],
              matchId: roomMatchId,
              createdBy: roomData['created_by'] ?? '',
              createdByName: roomData['created_by_name'] ?? '',
              createdAt: DateTime.fromMillisecondsSinceEpoch(
                roomData['created_at'] ?? DateTime.now().millisecondsSinceEpoch,
              ),
              participantCount: roomData['participant_count'] ?? 0,
              maxParticipants: roomData['max_participants'] ?? 10,
              isActive: roomData['is_active'] ?? true,
            );

            rooms.add(room);
            print(
              '🔍 VoiceChat: Successfully created room entity for match $matchId: ${room.name}',
            );
          } else {
            print(
              '🔍 VoiceChat: Room $key does not match match ID $matchId (has: $roomMatchId)',
            );
          }
        } catch (e) {
          print('❌ VoiceChat: Error processing room $key: $e');
        }
      });

      // Sort by creation date (newest first)
      rooms.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      print(
        '🔍 VoiceChat: Total rooms found for match $matchId: ${rooms.length}',
      );

      return Right(rooms);
    } catch (e) {
      print('❌ VoiceChat: Error fetching rooms for match $matchId: $e');
      return Left(
        ServerFailure('Failed to get rooms for match: ${e.toString()}'),
      );
    }
  }

  @override
  Future<Either<Failure, VoiceChatRoomEntity>> createRoom({
    required String name,
    String? description,
    int? matchId,
    required String createdBy,
    required String createdByName,
  }) async {
    try {
      print('🔍 VoiceChat: Creating room with name: $name');
      print(
        '🔍 VoiceChat: Room details - description: $description, matchId: $matchId',
      );
      print('🔍 VoiceChat: Created by: $createdByName ($createdBy)');

      final roomRef = _database.child('voice_chat_rooms').push();
      final roomId = roomRef.key!;
      final now = DateTime.now();

      print('🔍 VoiceChat: Generated room ID: $roomId');

      final roomData = {
        'name': name,
        'description': description,
        'match_id': matchId,
        'created_by': createdBy,
        'created_by_name': createdByName,
        'created_at': now.millisecondsSinceEpoch,
        'participant_count': 1,
        'max_participants': 10,
        'is_active': true,
      };

      print('🔍 VoiceChat: Room data to save: $roomData');
      await roomRef.set(roomData);
      print('✅ VoiceChat: Room saved to Firebase successfully');

      // Add creator as participant
      await _database
          .child('voice_chat_participants')
          .child(roomId)
          .child(createdBy)
          .set({
            'user_id': createdBy,
            'user_name': createdByName,
            'joined_at': now.millisecondsSinceEpoch,
          });
      print('✅ VoiceChat: Creator added as participant');

      final room = VoiceChatRoomEntity(
        id: roomId,
        name: name,
        description: description,
        matchId: matchId,
        createdBy: createdBy,
        createdByName: createdByName,
        createdAt: now,
        participantCount: 1,
        maxParticipants: 10,
        isActive: true,
      );

      print(
        '🎯 VoiceChat: Room created successfully: ${room.name} (ID: ${room.id})',
      );
      return Right(room);
    } catch (e) {
      print('❌ VoiceChat: Error creating room: $e');
      return Left(ServerFailure('Failed to create room: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> joinRoom(String roomId, String userId) async {
    try {
      // Check if room exists and is active
      final roomSnapshot =
          await _database.child('voice_chat_rooms').child(roomId).get();

      if (!roomSnapshot.exists) {
        return const Left(ServerFailure('Room not found'));
      }

      final roomData = Map<String, dynamic>.from(roomSnapshot.value as Map);
      final participantCount = roomData['participant_count'] ?? 0;
      final maxParticipants = roomData['max_participants'] ?? 10;

      if (participantCount >= maxParticipants) {
        return const Left(ServerFailure('Room is full'));
      }

      // Add user as participant
      await _database
          .child('voice_chat_participants')
          .child(roomId)
          .child(userId)
          .set({
            'user_id': userId,
            'joined_at': DateTime.now().millisecondsSinceEpoch,
          });

      // Update participant count
      await _database
          .child('voice_chat_rooms')
          .child(roomId)
          .child('participant_count')
          .set(participantCount + 1);

      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to join room: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> leaveRoom(String roomId, String userId) async {
    try {
      // Remove user from participants
      await _database
          .child('voice_chat_participants')
          .child(roomId)
          .child(userId)
          .remove();

      // Update participant count
      final roomSnapshot =
          await _database.child('voice_chat_rooms').child(roomId).get();

      if (roomSnapshot.exists) {
        final roomData = Map<String, dynamic>.from(roomSnapshot.value as Map);
        final participantCount = roomData['participant_count'] ?? 0;
        final newCount =
            (participantCount - 1).clamp(0, double.infinity).toInt();

        await _database
            .child('voice_chat_rooms')
            .child(roomId)
            .child('participant_count')
            .set(newCount);

        // If no participants left, mark room as inactive
        if (newCount == 0) {
          await _database
              .child('voice_chat_rooms')
              .child(roomId)
              .child('is_active')
              .set(false);
        }
      }

      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to leave room: ${e.toString()}'));
    }
  }

  @override
  Stream<List<VoiceChatRoomEntity>> getRoomsStream() {
    return _database.child('voice_chat_rooms').onValue.map((event) {
      if (!event.snapshot.exists) {
        return <VoiceChatRoomEntity>[];
      }

      final rooms = <VoiceChatRoomEntity>[];
      final data = event.snapshot.value as Map<dynamic, dynamic>;

      data.forEach((key, value) {
        final roomData = Map<String, dynamic>.from(value as Map);
        rooms.add(
          VoiceChatRoomEntity(
            id: key.toString(),
            name: roomData['name'] ?? '',
            description: roomData['description'],
            matchId: roomData['match_id'],
            createdBy: roomData['created_by'] ?? '',
            createdByName: roomData['created_by_name'] ?? '',
            createdAt: DateTime.fromMillisecondsSinceEpoch(
              roomData['created_at'] ?? DateTime.now().millisecondsSinceEpoch,
            ),
            participantCount: roomData['participant_count'] ?? 0,
            maxParticipants: roomData['max_participants'] ?? 10,
            isActive: roomData['is_active'] ?? true,
          ),
        );
      });

      // Sort by creation date (newest first)
      rooms.sort((a, b) => b.createdAt.compareTo(a.createdAt));

      return rooms;
    });
  }

  @override
  Stream<List<VoiceChatRoomEntity>> getRoomsByMatchStream(int matchId) {
    print('🔍 VoiceChat: Setting up stream for match ID: $matchId');
    return _database.child('voice_chat_rooms').onValue.map((event) {
      print('🔍 VoiceChat: Stream event received for match $matchId');
      print('🔍 VoiceChat: Stream event exists: ${event.snapshot.exists}');
      
      if (!event.snapshot.exists) {
        print('🔍 VoiceChat: Stream: No rooms found in database');
        return <VoiceChatRoomEntity>[];
      }

      final rooms = <VoiceChatRoomEntity>[];
      final data = event.snapshot.value as Map<dynamic, dynamic>;
      print('🔍 VoiceChat: Stream: Raw data from Firebase: $data');
      print('🔍 VoiceChat: Stream: Total rooms in database: ${data.length}');

      data.forEach((key, value) {
        try {
          final roomData = Map<String, dynamic>.from(value as Map);
          final roomMatchId = roomData['match_id'];
          print('🔍 VoiceChat: Stream: Room $key has match_id: $roomMatchId (looking for: $matchId)');

          // Only include rooms that match the specified matchId
          if (roomMatchId == matchId) {
            print('🔍 VoiceChat: Stream: Processing room $key for match $matchId');

            final room = VoiceChatRoomEntity(
              id: key.toString(),
              name: roomData['name'] ?? '',
              description: roomData['description'],
              matchId: roomMatchId,
              createdBy: roomData['created_by'] ?? '',
              createdByName: roomData['created_by_name'] ?? '',
              createdAt: DateTime.fromMillisecondsSinceEpoch(
                roomData['created_at'] ?? DateTime.now().millisecondsSinceEpoch,
              ),
              participantCount: roomData['participant_count'] ?? 0,
              maxParticipants: roomData['max_participants'] ?? 10,
              isActive: roomData['is_active'] ?? true,
            );

            rooms.add(room);
            print('🔍 VoiceChat: Stream: Added room ${room.name} for match $matchId');
          } else {
            print('🔍 VoiceChat: Stream: Room $key does not match match ID $matchId (has: $roomMatchId)');
          }
        } catch (e) {
          print('❌ VoiceChat: Stream: Error processing room $key: $e');
        }
      });

      // Sort by creation date (newest first)
      rooms.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      print('🔍 VoiceChat: Stream: Total rooms found for match $matchId: ${rooms.length}');
      print('🔍 VoiceChat: Stream: Room names: ${rooms.map((r) => r.name).toList()}');

      return rooms;
    });
  }
}
