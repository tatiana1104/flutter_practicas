import 'package:flutter/material.dart';
import '../routes/app_routes.dart'; // Importa las rutas de la aplicación

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void goProfile(BuildContext context) {
    Navigator.pushNamed(
      context,
      AppRoutes.profile,
      arguments: 'Carolina',
    ); // Pasa el nombre de usuario como argumento
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => goProfile(context),
          child: const Text('Ir a Perfil'),
        ),
      ),
    );
  }
}
