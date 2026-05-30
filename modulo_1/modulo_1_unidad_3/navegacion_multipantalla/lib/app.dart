//Va la lógica principal de la aplicación

import 'package:flutter/material.dart';
import 'routes/app_routes.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/profile_screen.dart';
import 'services/auth_service.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Route<dynamic> _generateRoute(RouteSettings settings) {
    if (settings.name == AppRoutes.home && !AuthService.isLoggedIn) {
      return MaterialPageRoute(builder: (_) => const LoginScreen());
    }

    switch (settings.name) {
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case AppRoutes.profile:
        final String username = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => ProfileScreen(username: username),
        );
      default:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navegación Profesional',
      initialRoute: AppRoutes.login,
      onGenerateRoute: _generateRoute,
    );
  }
}
