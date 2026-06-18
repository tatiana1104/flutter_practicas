import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

/// ============================================================
///  PANTALLA 8: Política de Privacidad (PrivacyPolicyScreen)
/// ============================================================
/// Pantalla accesible desde la app que explica el manejo de
/// los datos del usuario. Incluye todos los puntos requeridos.
/// ------------------------------------------------------------
class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Política de Privacidad')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        // Cada sección se construye con el widget _PolicySection.
        children: const [
          _PolicySection(
            title: 'Datos recopilados',
            text:
                'Recopilamos los datos que ingresas en el formulario: nombre, '
                'edad, posición de juego, nivel deportivo y objetivo de '
                'entrenamiento.',
          ),
          _PolicySection(
            title: 'Finalidad de los datos',
            text:
                'Los datos se usan únicamente para generar recomendaciones '
                'deportivas personalizadas mediante Inteligencia Artificial.',
          ),
          _PolicySection(
            title: 'Procesamiento mediante IA',
            text:
                'La información se envía a la API de Gemini (Google) para '
                'producir las recomendaciones. El procesamiento es automático.',
          ),
          _PolicySection(
            title: 'Derechos del usuario',
            text:
                'Tienes derecho a conocer qué datos se usan, a no '
                'proporcionarlos y a dejar de usar la aplicación en cualquier '
                'momento.',
          ),
          _PolicySection(
            title: 'Eliminación de datos',
            text:
                'La aplicación no almacena tus datos de forma permanente. Al '
                'cerrar la app, la información ingresada se elimina.',
          ),
          _PolicySection(
            title: 'Revocación del consentimiento',
            text:
                'Puedes revocar tu consentimiento en cualquier momento '
                'dejando de usar la aplicación y sin generar nuevas consultas.',
          ),
        ],
      ),
    );
  }
}

/// Widget privado para mostrar una sección (título + texto) de
/// la política. Evita repetir el mismo bloque varias veces.
class _PolicySection extends StatelessWidget {
  final String title;
  final String text;

  const _PolicySection({required this.title, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryDark,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            text,
            style: const TextStyle(
              fontSize: 15,
              height: 1.5,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
