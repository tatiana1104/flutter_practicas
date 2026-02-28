import 'package:flutter/material.dart';
import '../routes/app_routes.dart'; // Importa las rutas de la aplicación
import '../services/auth_service.dart'; // Importa el servicio de autenticación

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void login(BuildContext context) {
    AuthService.isLoggedIn = true;
    Navigator.pushReplacementNamed(context, AppRoutes.home);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => login(context),
          child: const Text('Iniciar Sesión'),
        ),
      ),
    );
  }
}
