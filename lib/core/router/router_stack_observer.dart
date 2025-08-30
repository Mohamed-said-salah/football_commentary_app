import 'package:flutter/material.dart';
import 'package:football_commentary_app/core/router/app_router.dart';

class RouteStackObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    if (route.settings.name != null) {
      AppRouter.routesStack.add(route.settings.name!);
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    if (AppRouter.routesStack.isNotEmpty) {
      AppRouter.routesStack.removeLast();
    }
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (AppRouter.routesStack.isNotEmpty && newRoute?.settings.name != null) {
      AppRouter.routesStack.last = newRoute!.settings.name!;
    }
  }
}

