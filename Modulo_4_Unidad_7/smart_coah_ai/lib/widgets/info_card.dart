import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

/// ============================================================
///  WIDGET: InfoCard (Tarjeta de información)
/// ============================================================
/// Tarjeta simple con un título y un contenido (texto).
/// La usamos en la pantalla de resultados para mostrar la
/// información del jugador y la respuesta de Gemini de forma
/// organizada y fácil de leer.
/// ------------------------------------------------------------
class InfoCard extends StatelessWidget {
  final String title; // Título de la tarjeta
  final String content; // Texto que se muestra dentro
  final IconData icon; // Icono que acompaña al título

  const InfoCard({
    super.key,
    required this.title,
    required this.content,
    this.icon = Icons.article_outlined,
  });

  @override
  Widget build(BuildContext context) {
    // Card toma el estilo definido en app_theme.dart
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ----------------- Encabezado (icono + título) ---
            Row(
              children: [
                Icon(icon, color: AppColors.primary, size: 22),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryDark,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            // ----------------------- Contenido ----------------
            Text(
              content,
              style: const TextStyle(
                fontSize: 15,
                height: 1.5, // separación entre líneas (legibilidad)
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
