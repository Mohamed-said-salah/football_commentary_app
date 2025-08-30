import 'package:flutter/material.dart';

import '../../generated/l10n.dart';

extension NavigationExtensions on BuildContext {
  /// Pushes a named route onto the navigator that most tightly encloses the
  /// given `context`.
  ///
  /// The [route] parameter specifies the name of the route to be pushed, and
  /// the [arguments] parameter allows passing additional data to the new route.
  ///
  /// This method returns a [Future] that completes when the route is fully
  /// pushed onto the navigator.
  Future<void> push(String route, Object arguments) async =>
      await Navigator.of(this).pushNamed(route, arguments: arguments);

  /// Replaces the current route of the navigator that most tightly
  /// encloses the given `context` by pushing a new route named [route]
  /// with the provided [arguments] and disposing the previous route.
  /// The new route is created using the route name and arguments.
  ///
  /// This is useful for scenarios where you want to replace the current
  /// view with a new view and prevent the user from navigating back to
  /// the previous one.
  ///
  /// The [arguments] are passed to the new route during navigation.
  Future<void> pushReplacement(String route, Object arguments) async =>
      await Navigator.of(
        this,
      ).pushReplacementNamed(route, arguments: arguments);

 Future<void> pushNamedAndRemoveUntil(String route, Object arguments) async =>
      await Navigator.of(
        this,
      ).pushNamedAndRemoveUntil(route, (route) => false, arguments: arguments);
  /// Pushes a named route onto the navigator that most tightly encloses the
  /// given `context`, and removes all the previous routes until the
  /// predicate returns `true`. The predicate is evaluated when the new route
  /// is pushed and whenever the user attempts to pop this new route off the
  /// navigator. If the predicate returns `true`, the navigator stops removing
  /// routes and the new route is pushed on top of the remaining routes.
  ///
  /// The [arguments] are passed to the new route during navigation.
  Future<void> pushAndRemoveUntil(String route, Object arguments) async =>
      await Navigator.of(
        this,
      ).pushNamedAndRemoveUntil(route, (route) => false, arguments: arguments);

  /// Pops the current route off the navigator and pushes a new route identified
  /// by the given [route] name with the provided [arguments].
  ///
  /// This method removes the current route from the stack, replacing it with
  /// the new route, and waits for the new route to be fully pushed before
  /// completing.
  Future<void> popAndPush(String route, Object arguments) async =>
      await Navigator.of(this).popAndPushNamed(route, arguments: arguments);

  /// Navigates to a new route identified by the given [route] name,
  /// while allowing the route to be restored during state restoration.
  ///
  /// The [arguments] are passed to the new route during navigation.
  void restorablePush(String route, Object arguments) =>
      Navigator.of(this).restorablePushNamed(route, arguments: arguments);

  /// Pops the current route off the navigator and pushes a new route identified
  /// by the given [route] name with the provided [arguments] while allowing the
  /// new route to be restored during state restoration.
  ///
  /// This method is useful for scenarios where you want to remove the current
  /// view and navigate to a new one that supports state restoration, ensuring
  /// that the new route can be restored to its previous state if needed.
  ///
  /// The [arguments] are passed to the new route during navigation.
  void restorablePushReplacement(String route, Object arguments) async =>
      Navigator.of(
        this,
      ).restorablePushReplacementNamed(route, arguments: arguments);

  /// Pops the current route off the navigator and pushes a new route identified
  /// by the given [route] name with the provided [arguments] while allowing the
  /// new route to be restored during state restoration.
  ///
  /// This method is useful for scenarios where you want to remove the current
  /// view and navigate to a new one that supports state restoration, ensuring
  /// that the new route can be restored to its previous state if needed.
  ///
  /// The [arguments] are passed to the new route during navigation.
  ///
  /// The predicate is evaluated when the new route is pushed and whenever the
  /// user attempts to pop this new route off the navigator. If the predicate
  /// returns `true`, the navigator stops removing routes and the new route is
  /// pushed on top of the remaining routes.
  void restorablePushNamedAndRemoveUntil(
    String route,
    Object arguments,
  ) async => Navigator.of(this).restorablePushNamedAndRemoveUntil(
    route,
    (route) => false,
    arguments: arguments,
  );

  /// Pops the current route off the navigator and pushes a new route identified
  /// by the given [route] name with the provided [arguments] while allowing the
  /// new route to be restored during state restoration.
  ///
  /// This method is useful for scenarios where you want to remove the current
  /// view and navigate to a new one that supports state restoration, ensuring
  /// that the new route can be restored to its previous state if needed.
  ///
  /// The [arguments] are passed to the new route during navigation.
  void restorablePopAndPush(String route, Object arguments) async =>
      Navigator.of(this).restorablePopAndPushNamed(route, arguments: arguments);

  void pop([bool? value]) => Navigator.of(this).pop(value);
}

extension Localization on BuildContext {
  S get tr => S.of(this);

  String getTranslated({required String ar, required String en}) {
    return Localizations.localeOf(this).languageCode == 'ar' ? ar : en;
  }
}
