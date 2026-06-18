import 'package:flutter/material.dart';

import '../models/player.dart';
import '../services/gemini_service.dart';
import '../theme/app_colors.dart';
import '../widgets/ai_disclaimer.dart';
import '../widgets/info_card.dart';

/// ============================================================
///  PANTALLA 6: Resultados (ResultsScreen)
/// ============================================================
/// Muestra:
///  - Información del jugador (nombre, edad, posición, nivel)
///  - La respuesta generada por Gemini, organizada y legible
///  - El aviso OBLIGATORIO de transparencia de IA (widget aparte)
///
/// Requerimiento extra:
///  - Si no hay recomendaciones generadas, mostrar botón para
///    generar recomendaciones.
///  - Mientras Gemini genera: mostrar CircularProgressIndicator + mensaje.
///  - Gemini debe incluir:
///    Nombre, Edad, Posición, Nivel, Objetivo.
///    Responder con:
///      ANÁLISIS DEL JUGADOR
///      RECOMENDACIONES DE ENTRENAMIENTO
///      CONSEJOS DE ALIMENTACIÓN
///      RECOMENDACIONES DE RECUPERACIÓN FÍSICA
/// ------------------------------------------------------------
class ResultsScreen extends StatefulWidget {
  final Player player;
  final String aiResponse;

  const ResultsScreen({
    super.key,
    required this.player,
    required this.aiResponse,
  });

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  late String _aiText;
  bool _isLoading = false;

  final GeminiService _geminiService = GeminiService();

  @override
  void initState() {
    super.initState();
    _aiText = widget.aiResponse;
  }

  bool get _hasRecommendations => _aiText.trim().isNotEmpty;

  Future<void> _generateRecommendations() async {
    if (_isLoading) return;

    setState(() => _isLoading = true);

    try {
      final result = await _geminiService.getRecommendations(widget.player);

      // Actualizamos el modelo por si se usa en historial.
      widget.player.recommendations = result;

      if (!mounted) return;
      setState(() => _aiText = result);
    } on GeminiException catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message),
          backgroundColor: AppColors.error,
        ),
      );
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Ocurrió un error inesperado. Intenta de nuevo.'),
          backgroundColor: AppColors.error,
        ),
      );
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Resultados')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const AiDisclaimer(),
          const SizedBox(height: 16),

          InfoCard(
            icon: Icons.person,
            title: 'Información del Jugador',
            content: 'Nombre: ${widget.player.name}\n'
                'Edad: ${widget.player.age} años\n'
                'Posición: ${widget.player.position}\n'
                'Nivel: ${widget.player.level}',
          ),

          if (_isLoading) ...[
            const SizedBox(height: 16),
            const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(color: AppColors.primary),
                  SizedBox(height: 16),
                  Text(
                    'La IA está procesando tu consulta...',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ] else if (_hasRecommendations) ...[
            const SizedBox(height: 16),
            InfoCard(
              icon: Icons.auto_awesome,
              title: 'Recomendaciones de la IA',
              content: _aiText,
            ),
            const SizedBox(height: 16),
          ],

          // Botón según exista respuesta
          SizedBox(
            width: double.infinity,
            child: _hasRecommendations
                ? ElevatedButton.icon(
                    onPressed: () {
                      Navigator.popUntil(context, (route) => route.isFirst);
                    },
                    icon: const Icon(Icons.refresh),
                    label: const Text('Hacer otra consulta'),
                  )
                : ElevatedButton.icon(
                    onPressed: _generateRecommendations,
                    icon: const Icon(Icons.auto_awesome),
                    label: const Text('Generar recomendaciones'),
                  ),
          ),
        ],
      ),
    );
  }
}

