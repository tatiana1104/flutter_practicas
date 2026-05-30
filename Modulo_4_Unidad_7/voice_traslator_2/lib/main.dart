import 'package:flutter/material.dart';

import 'dart:io'; // Agregar esta importación para manejar permisos en Android
import 'package:speech_to_text/speech_to_text.dart'; // Agregar esta importación para reconocimiento de voz
import 'package:flutter_tts/flutter_tts.dart'; // Agregar esta importación para síntesis de voz
import 'package:translator/translator.dart'; // Agregar esta importación para traducción de texto

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDark = false;

  void toggleTheme() => setState(() => isDark = !isDark);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Traductor de voz',
      theme: ThemeData(
        primarySwatch: Colors.indigo, // Color principal para el tema claro
        brightness: Brightness.light, // Brillo para el tema claro
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.indigo, // Color principal para el tema oscuro
        brightness: Brightness.dark, // Brillo para el tema oscuro
      ),
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light, // Cambiar entre tema oscuro y claro según el estado de isDark
      home: TranslatorPage(isDark: isDark, onToggleTheme: toggleTheme), // Pasar el estado y el callback al widget principal de traducción
    );
  }
}

class TranslatorPage extends StatefulWidget {
  final bool isDark; // Variable para controlar el tema oscuro o claro
  final VoidCallback onToggleTheme; // Callback para cambiar el tema desde el widget principal

  const TranslatorPage({super.key, required this.isDark, required this.onToggleTheme}); // Constructor que recibe el estado del tema y el callback para cambiarlo

  @override
  State<TranslatorPage> createState() => _TranslatorPageState();
}


class _TranslatorPageState extends State<TranslatorPage> {
  final SpeechToText speech = SpeechToText(); // Instancia para reconocimiento de voz
  final FlutterTts tts = FlutterTts(); // Instancia para síntesis de voz
  final traslator = GoogleTranslator(); // Instancia para traducción

  // Idiomas disponibles (código -> etiqueta)
  final Map<String, String> languages = {
    'es': 'Español',
    'en': 'English',
    'fr': 'Français',
  };

  // Mapa para locales TTS (puedes extender según necesidad)
  final Map<String, String> ttsLocales = {
    'es': 'es-ES',
    'en': 'en-US',
    'fr': 'fr-FR',
  };

  // Selecciones por defecto
  String sourceLang = 'es';
  String targetLang = 'en';

  String textoOriginal = ''; // Variable para almacenar el texto original
  String textoTraducido = ''; // Variable para almacenar el texto traducido
  bool escuchando = false; // Variable para controlar el estado de escucha

  // Historial de traducciones (más reciente primero)
  final List<Map<String, String>> history = [];
  // Variables sencillas para controlar la UI

  // Método para iniciar el reconocimiento de voz
  Future<void> escuchar() async {
    bool disponible = await speech.initialize(); // Inicializar el reconocimiento de voz

    if (disponible) {

      setState(() {
        escuchando = true; // Cambiar el estado a escuchando
      }); // Cambiar el estado a escuchando

      speech.listen(onResult: (result) {
        setState(() {
          textoOriginal = result.recognizedWords; // Actualizar el texto original con el resultado del reconocimiento
        });
      });

    }
  }

  

  // Método para detener el reconocimiento de voz
  Future<void> detener() async {
    await speech.stop(); // Detener el reconocimiento de voz

    setState(() {
      escuchando = false; // Cambiar el estado a no escuchando
    });

  }

  // Método para traducir el texto original
  Future<void> traducir() async {
    if (textoOriginal.trim().isEmpty) return;

    var resultado = await traslator.translate(textoOriginal, from: sourceLang, to: targetLang);
    // Actualizar texto traducido y añadir a historial
    setState(() {
      textoTraducido = resultado.text; // Actualizar el texto traducido
      final entry = {
        'original': textoOriginal,
        'translated': textoTraducido,
        'from': languages[sourceLang] ?? sourceLang,
        'to': languages[targetLang] ?? targetLang,
        'time': DateTime.now().toIso8601String(),
      };
      // Insertar al inicio del historial en memoria
      history.insert(0, entry);
      // Mantener tamaño razonable
      if (history.length > 50) history.removeRange(50, history.length);
    });
  }

  

  // Método para reproducir el texto traducido utilizando síntesis de voz
  Future<void> leer() async {
    final locale = ttsLocales[targetLang] ?? 'en-US';
    await tts.setLanguage(locale); // Configurar el idioma para la síntesis de voz
    await tts.speak(textoTraducido); // Reproducir el texto traducido utilizando síntesis de voz
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Traductor inteligente'),
        actions: [
          IconButton( // Botón para cambiar entre tema claro y oscuro
            tooltip: 'Tema claro/oscuro',
            icon: Icon(widget.isDark ? Icons.dark_mode : Icons.light_mode),
            onPressed: widget.onToggleTheme,
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Texto original:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            Container(
              padding: const EdgeInsets.all(12.0),
              height: 120,
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: Text(textoOriginal),
            ),

            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: escuchando ? detener : escuchar,
              icon: Icon(escuchando ? Icons.stop : Icons.mic),
              label: Text(escuchando ? 'Detener' : 'Escuchar'),
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Origen'),
                      DropdownButton<String>(
                        value: sourceLang,
                        isExpanded: true,
                        items: languages.entries
                            .map((e) => DropdownMenuItem(value: e.key, child: Text(e.value)))
                            .toList(),
                        onChanged: (v) {
                          if (v == null) return;
                          setState(() {
                            sourceLang = v;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Destino'),
                      DropdownButton<String>(
                        value: targetLang,
                        isExpanded: true,
                        items: languages.entries
                            .map((e) => DropdownMenuItem(value: e.key, child: Text(e.value)))
                            .toList(),
                        onChanged: (v) {
                          if (v == null) return;
                          setState(() {
                            targetLang = v;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: traducir,
              child: Text('Traducir a ${languages[targetLang] ?? targetLang}'),
            ),

            const SizedBox(height: 20),
            const Text(
              'Texto traducido:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(12.0),
              height: 120,
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: Text(textoTraducido),
            ),

            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: leer,
              icon: const Icon(
                Icons.volume_up,
              ),
              label: const Text("Escuchar Traducción"),
            ),

            const SizedBox(height: 20),
            const Text(
              'Historial de traducciones:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Container(
              height: 160,
              color: Theme.of(context).cardColor,
              child: history.isEmpty
                  ? const Center(child: Text('No hay traducciones aún'))
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: history.length,
                      itemBuilder: (context, index) {
                        final h = history[index];
                        return ListTile(
                          title: Text(h['original'] ?? ''),
                          subtitle: Text(h['translated'] ?? ''),
                          trailing: Text('${h['from']}→${h['to']}'),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

}