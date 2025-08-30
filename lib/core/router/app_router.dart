import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_commentary_app/core/di/dependency_injection.dart';
import 'package:football_commentary_app/core/router/routes.dart';
import 'package:football_commentary_app/features/splash/presentation/views/splash_view.dart';
import 'package:football_commentary_app/features/auth/presentation/views/login_view.dart';
import 'package:football_commentary_app/features/matches/presentation/views/matches_view.dart';
import 'package:football_commentary_app/features/voice_chat/presentation/views/voice_chat_rooms_view.dart';
import 'package:football_commentary_app/features/voice_chat/presentation/views/voice_chat_room_view.dart';
import 'package:football_commentary_app/features/matches/presentation/logic/cubit/matches_cubit.dart';
import 'package:football_commentary_app/features/voice_chat/presentation/logic/cubit/voice_chat_cubit.dart';
import 'package:football_commentary_app/features/voice_chat/presentation/views/single_match_voice_rooms_view.dart';

abstract class AppRouter {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static const String initialRoute = Routes.splashView;

  static List<String> routesStack = [];

  static String? get currentRoute =>
      routesStack.isNotEmpty ? routesStack.last : null;

  static String? get previousRoute =>
      routesStack.length > 1 ? routesStack[routesStack.length - 2] : null;

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashView:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
          settings: settings,
        );

      case Routes.loginView:
        return MaterialPageRoute(
          builder: (context) => const LoginView(),
          settings: settings,
        );

      case Routes.matchesView:
        return MaterialPageRoute(
          builder:
              (context) => BlocProvider(
                create: (context) => getIt<MatchesCubit>(),
                child: const MatchesView(),
              ),
          settings: settings,
        );

      case Routes.voiceChatRoomsView:
        final args = settings.arguments as Map<String, dynamic>?;
        return MaterialPageRoute(
          builder:
              (context) => BlocProvider(
                create: (context) => getIt<VoiceChatCubit>(),
                child: VoiceChatRoomsView(
                  matchId: args?['matchId'],
                  matchName: args?['matchName'],
                ),
              ),
          settings: settings,
        );

      case Routes.singleMatchVoiceRoomsView:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder:
              (context) => BlocProvider(
                create: (context) => getIt<VoiceChatCubit>(),
                child: SingleMatchVoiceRoomsView(
                  matchId: args['matchId'],
                  matchName: args['matchName'],
                ),
              ),
          settings: settings,
        );

      case Routes.voiceChatRoomView:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder:
              (context) => BlocProvider(
                create: (context) => getIt<VoiceChatCubit>(),
                child: VoiceChatRoomView(
                  roomId: args['roomId'],
                  roomName: args['roomName'],
                ),
              ),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder:
              (context) => const Scaffold(
                body: Center(child: Text('404 - Page Not Found')),
              ),
          settings: settings,
        );
    }
  }
}
