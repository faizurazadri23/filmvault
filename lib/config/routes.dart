import 'package:filmvault/ui/authenticate/login_page.dart';
import 'package:filmvault/ui/dashboard/dashboard_page.dart';
import 'package:filmvault/ui/splash_page.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String splash = '/';
  static const String login = '/login';
  static const String dashboard = 'dashboard';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(
          builder: (_) => const SplashPage(),
        );

      case login:
        return MaterialPageRoute(
          builder: (_) => const LoginPage(),
        );

      case dashboard:
        return MaterialPageRoute(
          builder: (_) => const DashboardPage(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
