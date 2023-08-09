import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> snackBarKey = GlobalKey<ScaffoldMessengerState>();

  Future<dynamic> navigateTo(String routeName, {dynamic argument}) {
    return navigatorKey.currentState!.pushNamed(routeName, arguments: argument);
  }

  Future<dynamic> navigateToReplace(String routeName, {dynamic argument}) {
    return navigatorKey.currentState!
        .pushReplacementNamed(routeName, arguments: argument);
  }

  Future<dynamic> navigateToAndRemoveUntil(String routeName,
      {dynamic argument}) {
    return navigatorKey.currentState!
        .pushNamedAndRemoveUntil(routeName, (route) => false);
  }

  void goBack({dynamic value}) {
    return navigatorKey.currentState!.pop(value);
  }
}
