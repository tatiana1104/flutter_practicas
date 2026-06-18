import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'screens/welcome_screen.dart';

/// ============================================================
///  PUNTO DE ENTRADA DE LA APLICACIÓN (main.dart)
/// ============================================================
/// La función main() es lo primero que se ejecuta. runApp()
/// inicia la app mostrando el widget raíz (SmartCoachApp).
/// ------------------------------------------------------------
void main() {
  runApp(const SmartCoachApp());
}

/// Widget raíz de la aplicación.
class SmartCoachApp extends StatelessWidget {
  const SmartCoachApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp configura toda la app: tema, título y pantalla inicial.
    return MaterialApp(
      title: 'SmartCoach AI',
      // Quitamos la cinta de "DEBUG" de la esquina.
      debugShowCheckedModeBanner: false,
      // Aplicamos el tema (Material 3) definido en app_theme.dart.
      theme: AppTheme.light,
      // La primera pantalla que se muestra es la de bienvenida.
      home: const WelcomeScreen(),
    );
  }
}
