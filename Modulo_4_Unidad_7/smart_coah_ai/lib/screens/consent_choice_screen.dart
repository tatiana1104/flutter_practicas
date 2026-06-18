import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import 'history_screen.dart';
import 'registration_screen.dart';

/// ============================================================
///  PANTALLA 3: Elección después del Consentimiento
/// ============================================================
/// Pantalla intermedia entre ConsentScreen y las funcionalidades.
/// Muestra 2 opciones:
///  - Registro del jugador
///  - Listado de jugadores (historial)
/// ------------------------------------------------------------
class ConsentChoiceScreen extends StatelessWidget {
  const ConsentChoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Elige una opción'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 12),
              Text(
                'Selecciona qué deseas hacer ahora:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryDark,
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegistrationScreen(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.person_add_alt_1_outlined),
                  label: const Text('Registro del jugador'),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HistoryScreen(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.list_alt_outlined),
                  label: const Text('Listado de jugadores'),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Podrás consultar el historial en cualquier momento.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.textSecondary,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

