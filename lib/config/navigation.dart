import 'package:flutter/material.dart';

class Navigation {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static final Navigation _instance = Navigation._internal();

  factory Navigation() => _instance;

  Navigation._internal();

  static Navigation get instance => _instance;

  Future<void> navigateTo(String routeName, {Object? arguments}) {
    return navigatorKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  Future<void> navigateToWithoutRouteName(BuildContext context, Widget page) {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  //Navigate to a new page by route name and remove all previous page
  Future<void> navigateAndReplaceAll(String routeName, {Object? arguments}) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
        routeName, (route) => false,
        arguments: arguments);
  }

  //Navigate to a new page by route name and replace the current page
  Future<void> navigateAndReplace(String routeName, {Object? arguments}) {
    return navigatorKey.currentState!
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> navigateWithResult(String nameRouted) async {
    return navigatorKey.currentState!.pushNamed(nameRouted);
  }

  Future<dynamic> navigateToRouteWithArguments(String nameRouted,
      {Object? arguments}) async {
    return navigatorKey.currentState!.pushNamed(
      nameRouted,
      arguments: arguments,
    );
  }

  //go back to the previous page
  void goBack() {
    if (navigatorKey.currentState!.canPop()) {
      navigatorKey.currentState!.pop();
    }
  }

  //go back with a result
  void goBackWithResult(dynamic result) {
    navigatorKey.currentState!.pop(result);
  }
}
