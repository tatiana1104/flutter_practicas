import 'package:flutter/material.dart';
import 'registration_form_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Formulario Dinamico APP',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true, //utilizar materiales de dart version 3
      ),
      home: const RegistrationFormScreen(), //pantalla principal de la aplicacion
      );
  }
}
