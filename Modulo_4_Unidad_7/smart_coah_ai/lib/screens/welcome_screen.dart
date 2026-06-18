import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import 'consent_screen.dart';
import 'history_screen.dart';

/// ============================================================
///  PANTALLA 1: Bienvenida (WelcomeScreen)
/// ============================================================
/// Primera pantalla que ve el usuario. Muestra:
///  - Nombre de la aplicación
///  - Logo / imagen representativa
///  - Descripción breve de la funcionalidad
///  - Botón para ingresar (navega a la pantalla de consentimiento)
/// ------------------------------------------------------------
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // SafeArea evita que el contenido choque con la barra de estado.
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          // Center + Column centra todo verticalmente.
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ----------------------- LOGO --------------------
                Image.asset(
                  '../assets/images/logo.png',
                  width: 160,
                  height: 160,
                ),
                const SizedBox(height: 24),

                // ------------------- NOMBRE DE LA APP -------------
                const Text(
                  'SmartCoach AI',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryDark,
                  ),
                ),
                const SizedBox(height: 12),

                // --------------------- DESCRIPCIÓN ----------------
                const Text(
                  'Tu entrenador inteligente. Recibe recomendaciones '
                  'deportivas personalizadas de entrenamiento, alimentación '
                  'y recuperación, generadas con Inteligencia Artificial.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.5,
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 40),

                // ------------------- BOTÓN DE INGRESO -------------
                SizedBox(
                  width: double.infinity, // ocupa todo el ancho
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Navigator nos lleva a la siguiente pantalla.
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ConsentScreen(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.sports_soccer),
                    label: const Text('Comenzar'),
                  ),
                ),
                const SizedBox(height: 12),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
