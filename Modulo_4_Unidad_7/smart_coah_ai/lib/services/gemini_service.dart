import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../models/player.dart';

/// ============================================================
///  SERVICIO: GeminiService
/// ============================================================
/// Encapsula la llamada a la API REST de Google Gemini.
/// ------------------------------------------------------------

class GeminiException implements Exception {
  final String message;
  GeminiException(this.message);

  @override
  String toString() => message;
}

class GeminiService {
  // API Key (para entorno de desarrollo). Evita el error de fromEnvironment.
  static const String _apiKey = 'AIzaSyD_n-2xYpnb_HG5OzY150BTes3Wq_wy7Is';

  // Modelo confirmado por tu consola.
  static const String _model = 'gemini-3.5-flash';

  // Usamos v1 (típicamente más estable para Gemini).
  static const String _baseUrl =
      'https://generativelanguage.googleapis.com/v1/models';

  Future<String> getRecommendations(Player player) async {
    if (_apiKey.isEmpty) {
      throw GeminiException('No se configuró la API Key de Gemini.');
    }

    final uri = Uri.parse('$_baseUrl/$_model:generateContent?key=$_apiKey');

    final body = jsonEncode({
      'contents': [
        {
          'parts': [
            {'text': player.toPrompt()},
          ],
        },
      ],
    });

    const maxRetries = 3;
    var attempt = 0;

    while (true) {
      try {
        final response = await http.post(
          uri,
          headers: const {'Content-Type': 'application/json'},
          body: body,
        );

        // 503: servicio temporalmente no disponible/saturado.
        if (response.statusCode == 503) {
          if (attempt >= maxRetries) {
            throw GeminiException(
              'Gemini está temporalmente no disponible (503). Intenta de nuevo más tarde.',
            );
          }

          attempt++;
          final delaySeconds = 1 << (attempt - 1); // 1, 2, 4...
          await Future.delayed(Duration(seconds: delaySeconds));
          continue;
        }

        if (response.statusCode == 400 || response.statusCode == 403) {
          throw GeminiException(
            'API Key inválida o sin permisos. Verifica tu llave de Gemini.',
          );
        }

        if (response.statusCode != 200) {
          throw GeminiException(
            'Error de Gemini (código ${response.statusCode}). Intenta de nuevo.',
          );
        }

        final data = jsonDecode(response.body);
        final text =
            data['candidates']?[0]?['content']?['parts']?[0]?['text'];

        if (text == null || (text as String).trim().isEmpty) {
          throw GeminiException('Gemini devolvió una respuesta vacía.');
        }

        return (text as String).trim();
      } on SocketException {
        throw GeminiException(
          'Sin conexión a Internet. Revisa tu red e intenta otra vez.',
        );
      } on GeminiException {
        rethrow;
      } catch (_) {
        throw GeminiException('Ocurrió un error inesperado. Intenta de nuevo.');
      }
    }
  }
}

