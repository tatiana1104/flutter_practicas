import 'package:flutter/material.dart';
import 'screens/login.dart';
import 'utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //ocultar banner de debug
      title: 'Demo Catalogo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColor,
          secondary: secondaryColor,
          background: backgroundColor,
        ),
        useMaterial3: true, //utilizar materiales de dart version 3
        scaffoldBackgroundColor: backgroundColor,
        textTheme: TextTheme(
          bodyLarge: bodyTextStyle,
          bodyMedium: subtitleTextStyle,
          titleMedium: titleTextStyle,
          headlineMedium: headingTextStyle,
        ),
      ),
      home: const LoginScreen(), //pantalla principal de la aplicacion
    );
  }
}
