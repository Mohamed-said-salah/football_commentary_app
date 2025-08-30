import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_commentary_app/core/di/dependency_injection.dart';
import 'package:football_commentary_app/core/router/app_router.dart';
import 'package:football_commentary_app/core/router/router_stack_observer.dart';
import 'package:football_commentary_app/core/theme/app_theme.dart';
import 'package:football_commentary_app/features/auth/presentation/logic/cubit/auth_cubit.dart';
import 'package:football_commentary_app/features/auth/presentation/logic/cubit/auth_state.dart';
import 'package:football_commentary_app/features/language/logic/cubit/language_cubit.dart';
import 'package:football_commentary_app/generated/l10n.dart';
import 'package:flutter_portal/flutter_portal.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 923),
      minTextAdapt: true,
      splitScreenMode: false,
      builder:
          (context, child) => BlocBuilder<LanguageCubit, LanguageState>(
            bloc: LanguageCubit.instance,
            builder:
                (context, state) => Portal(
                  child: MaterialApp(
                    title: "Football Commentary",
                    theme: getAppTheme(),
                    locale: Locale(state.currentLocale),
                    localizationsDelegates: const [
                      S.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    supportedLocales: state.supportedLocales,
                    debugShowCheckedModeBanner: false,
                    navigatorKey: AppRouter.navigatorKey,
                    initialRoute: AppRouter.initialRoute,
                    onGenerateRoute: AppRouter.onGenerateRoute,
                    navigatorObservers: [RouteStackObserver()],
                    onUnknownRoute:
                        (settings) => CupertinoPageRoute(
                          builder:
                              (_) => const Scaffold(
                                body: Center(
                                  child: Text('404 - Page Not Found'),
                                ),
                              ),
                        ),
                  ),
                ),
          ),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LanguageCubit>(
          create: (context) => LanguageCubit.instance,
        ),
        BlocProvider<AuthCubit>(create: (context) => getIt<AuthCubit>()),
      ],
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          print('🔐 MAIN APP: Auth state changed: $state');

          if (state is AuthAuthenticated) {
            print('🔐 MAIN APP: User authenticated: ${state.user.name}');
          } else if (state is AuthUnauthenticated) {
            print('🔐 MAIN APP: User unauthenticated');
          } else if (state is AuthError) {
            print('🔐 MAIN APP: Auth error: ${state.message}');
          }
        },
        child: const App(),
      ),
    );
  }
}
