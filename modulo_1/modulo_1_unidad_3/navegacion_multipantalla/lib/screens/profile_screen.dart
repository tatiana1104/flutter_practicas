import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final String username;

  const ProfileScreen({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Perfil')),
      body: Center(
        child: Text(
          'Bienvenido, $username',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
