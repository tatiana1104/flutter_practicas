import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

/// ============================================================
///  WIDGET: AiDisclaimer (Aviso de transparencia de IA)
/// ============================================================
/// Muestra el mensaje OBLIGATORIO de transparencia que indica
/// que la respuesta fue generada por IA, que puede contener
/// errores y que no reemplaza a un entrenador profesional.
///
/// Lo hacemos como widget reutilizable para no repetir el mismo
/// código en varias pantallas.
/// ------------------------------------------------------------
class AiDisclaimer extends StatelessWidget {
  const AiDisclaimer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        // Fondo naranja muy suave para llamar la atención sin molestar.
        color: AppColors.accent.withOpacity(0.12),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.accent),
      ),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icono de advertencia.
          Icon(Icons.info_outline, color: AppColors.accent),
          SizedBox(width: 10),
          // Expanded permite que el texto use el espacio restante
          // y haga salto de línea correctamente.
          Expanded(
            child: Text(
              'Esta respuesta fue generada mediante Inteligencia Artificial '
              '(Gemini). Puede contener errores y NO reemplaza la opinión de '
              'un entrenador profesional.',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 13,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
