import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:football_commentary_app/core/env/environment_variables.dart';
import 'package:football_commentary_app/core/networking/api_service.dart';
import 'package:football_commentary_app/core/networking/dio_factory.dart';
import 'package:football_commentary_app/core/utils/services/firebase_auth_service.dart';

// Features
import 'package:football_commentary_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:football_commentary_app/features/auth/domain/repos/auth_repo.dart';
import 'package:football_commentary_app/features/auth/domain/use_cases/google_sign_in_use_case.dart';
import 'package:football_commentary_app/features/auth/domain/use_cases/sign_out_use_case.dart';
import 'package:football_commentary_app/features/auth/domain/use_cases/get_current_user_use_case.dart';
import 'package:football_commentary_app/features/auth/presentation/logic/cubit/auth_cubit.dart';

import 'package:football_commentary_app/features/matches/data/repos/matches_repo_impl.dart';
import 'package:football_commentary_app/features/matches/domain/repos/matches_repo.dart';
import 'package:football_commentary_app/features/matches/domain/use_cases/get_live_matches_use_case.dart';
import 'package:football_commentary_app/features/matches/presentation/logic/cubit/matches_cubit.dart';

import 'package:football_commentary_app/features/voice_chat/data/repos/voice_chat_repo_impl.dart';
import 'package:football_commentary_app/features/voice_chat/domain/repos/voice_chat_repo.dart';
import 'package:football_commentary_app/features/voice_chat/domain/use_cases/create_room_use_case.dart';
import 'package:football_commentary_app/features/voice_chat/domain/use_cases/get_rooms_use_case.dart';
import 'package:football_commentary_app/features/voice_chat/domain/use_cases/join_room_use_case.dart';
import 'package:football_commentary_app/features/voice_chat/domain/use_cases/leave_room_use_case.dart';
import 'package:football_commentary_app/features/voice_chat/domain/use_cases/get_room_participants_use_case.dart';
import 'package:football_commentary_app/features/voice_chat/presentation/logic/cubit/voice_chat_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Core services
  getIt.registerLazySingleton<FirebaseAuthService>(() => FirebaseAuthService());

  //===================================================================
  // NETWORK DEPENDENCIES
  //===================================================================

  // Register Dio instance
  final Dio dio = DioFactory.getDio();

  // Add interceptors
  DioFactory.addDioInterceptor();

  // Register API service
  if (!getIt.isRegistered<ApiService>()) {
    getIt.registerLazySingleton<ApiService>(
      () => ApiService(dio, baseUrl: EnvironmentVariables.footballApiBaseUrl),
    );
  }

  //===================================================================
  // AUTH FEATURE DEPENDENCIES
  //===================================================================

  // Auth Repository
  if (!getIt.isRegistered<AuthRepo>()) {
    getIt.registerFactory<AuthRepo>(
      () => AuthRepoImpl(getIt<FirebaseAuthService>()),
    );
  }

  // Auth Use Cases
  getIt.registerFactory(() => GoogleSignInUseCase(getIt<AuthRepo>()));
  getIt.registerFactory(() => SignOutUseCase(getIt<AuthRepo>()));
  getIt.registerFactory(() => GetCurrentUserUseCase(getIt<AuthRepo>()));

  // Auth Cubit - Singleton for app-wide authentication service
  getIt.registerLazySingleton<AuthCubit>(
    () => AuthCubit(
      googleSignInUseCase: getIt(),
      signOutUseCase: getIt(),
      getCurrentUserUseCase: getIt(),
      authRepo: getIt<AuthRepo>(),
    ),
  );

  //===================================================================
  // MATCHES FEATURE DEPENDENCIES
  //===================================================================

  // Matches Repository
  getIt.registerFactory<MatchesRepo>(
    () => MatchesRepoImpl(getIt<ApiService>()),
  );

  // Matches Use Cases
  getIt.registerFactory(() => GetLiveMatchesUseCase(getIt<MatchesRepo>()));

  // Matches Cubit
  getIt.registerFactory(() => MatchesCubit(getLiveMatchesUseCase: getIt()));

  //===================================================================
  // VOICE CHAT FEATURE DEPENDENCIES
  //===================================================================

  // Voice Chat Repository
  getIt.registerFactory<VoiceChatRepo>(() => VoiceChatRepoImpl());

  // Voice Chat Use Cases
  getIt.registerFactory(() => CreateRoomUseCase(getIt<VoiceChatRepo>()));

  getIt.registerFactory(() => GetRoomsUseCase(getIt<VoiceChatRepo>()));

  getIt.registerFactory(() => JoinRoomUseCase(getIt<VoiceChatRepo>()));

  getIt.registerFactory(() => LeaveRoomUseCase(getIt<VoiceChatRepo>()));

  getIt.registerFactory(() => GetRoomParticipantsUseCase(getIt<VoiceChatRepo>()));

  // Voice Chat Cubit
  getIt.registerFactory(
    () => VoiceChatCubit(
      createRoomUseCase: getIt(),
      getRoomsUseCase: getIt(),
      joinRoomUseCase: getIt(),
      leaveRoomUseCase: getIt(),
      getRoomParticipantsUseCase: getIt(),
    ),
  );
}
