import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import 'registration_screen.dart';
import 'privacy_policy_screen.dart';
import 'consent_choice_screen.dart';

/// ============================================================
///  PANTALLA 2: Consentimiento Informado (ConsentScreen)
/// ============================================================
/// El usuario debe ACEPTAR el uso de IA para poder continuar.
/// Incluye:
///  - Explicación del uso de Gemini
///  - Información sobre el tratamiento de datos
///  - Advertencia sobre posibles errores de la IA
///  - Checkbox de aceptación (obligatorio)
///
/// Es un StatefulWidget porque necesita "recordar" si el
/// checkbox está marcado o no (eso es estado que cambia).
/// ------------------------------------------------------------
class ConsentScreen extends StatefulWidget {
  const ConsentScreen({super.key});

  @override
  State<ConsentScreen> createState() => _ConsentScreenState();
}

class _ConsentScreenState extends State<ConsentScreen> {
  // Variable de estado: indica si el usuario aceptó (checkbox).
  bool _accepted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Consentimiento Informado')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // Expanded + ListView para que el texto se pueda
              // desplazar (scroll) si no cabe en la pantalla.
              Expanded(
                child: ListView(
                  children: const [
                    _ConsentBlock(
                      icon: Icons.smart_toy_outlined,
                      title: 'Uso de Gemini (IA)',
                      text:
                          'Esta aplicación utiliza la Inteligencia Artificial '
                          'de Google (Gemini) para generar recomendaciones '
                          'deportivas personalizadas según los datos que '
                          'ingreses.',
                    ),
                    _ConsentBlock(
                      icon: Icons.shield_outlined,
                      title: 'Tratamiento de datos',
                      text:
                          'Los datos que ingreses (nombre, edad, posición, '
                          'nivel y objetivo) se envían a Gemini únicamente '
                          'para generar tu recomendación. No se almacenan en '
                          'servidores propios de la aplicación.',
                    ),
                    _ConsentBlock(
                      icon: Icons.warning_amber_outlined,
                      title: 'Advertencia',
                      text:
                          'Las respuestas son generadas automáticamente y '
                          'pueden contener errores. No reemplazan la opinión '
                          'de un entrenador profesional.',
                    ),
                  ],
                ),
              ),

              // -------- Enlace a la Política de Privacidad --------
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PrivacyPolicyScreen(),
                    ),
                  );
                },
                child: const Text('Ver Política de Privacidad'),
              ),

              // ---------------- CHECKBOX de aceptación ------------
              // CheckboxListTile junta un checkbox con un texto.
              CheckboxListTile(
                value: _accepted,
                activeColor: AppColors.primary,
                contentPadding: EdgeInsets.zero,
                title: const Text(
                  'Acepto el uso de Inteligencia Artificial y el tratamiento '
                  'de mis datos.',
                ),
                onChanged: (value) {
                  // setState avisa a Flutter que repinte la pantalla
                  // con el nuevo valor del checkbox.
                  setState(() {
                    _accepted = value ?? false;
                  });
                },
              ),
              const SizedBox(height: 8),

              // ------------------- Botón Continuar ----------------
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  // RESTRICCIÓN: si no acepta (_accepted = false),
                  // onPressed es null y el botón queda DESHABILITADO.
                  onPressed: _accepted
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ConsentChoiceScreen(),
                            ),
                          );
                        }
                      : null,
                  child: const Text('Continuar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Widget privado (solo se usa en este archivo) que muestra un
/// bloque de consentimiento: icono + título + texto.
/// Lo creamos para no repetir el mismo código tres veces.
class _ConsentBlock extends StatelessWidget {
  final IconData icon;
  final String title;
  final String text;

  const _ConsentBlock({
    required this.icon,
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppColors.primary),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  text,
                  style: const TextStyle(
                    fontSize: 14,
                    height: 1.5,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
