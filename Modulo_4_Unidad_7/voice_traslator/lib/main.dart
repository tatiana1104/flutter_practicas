import 'package:flutter/material.dart';

import 'dart:io'; // Agregar esta importación para manejar permisos en Android
import 'package:speech_to_text/speech_to_text.dart'; // Agregar esta importación para reconocimiento de voz
import 'package:flutter_tts/flutter_tts.dart'; // Agregar esta importación para síntesis de voz
import 'package:translator/translator.dart'; // Agregar esta importación para traducción de texto

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Traductor de voz',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const TranslatorPage(), // Asegúrate de tener esta página creada
    );
  }
} 

class TranslatorPage extends StatefulWidget {
  const TranslatorPage({super.key});

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

  // Selecciones por defecto
  String sourceLang = 'es';
  String targetLang = 'en';

  String textoOriginal = ''; // Variable para almacenar el texto original
  String textoTraducido = ''; // Variable para almacenar el texto traducido
  bool escuchando = false; // Variable para controlar el estado de escucha

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

    var resultado = await traslator.translate(textoOriginal, from: sourceLang, to: targetLang);
    setState(() {
      textoTraducido = resultado.text; // Actualizar el texto traducido con el resultado de la traducción
    });

  }

  // Método para reproducir el texto traducido utilizando síntesis de voz
  Future<void> leer() async {

    await tts.setLanguage('en-US'); // Configurar el idioma para la síntesis de voz
    await tts.speak(textoTraducido); // Reproducir el texto traducido utilizando síntesis de voz

  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Traductor inteligente'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0), // Agregar un poco de padding alrededor del contenido

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // Asegurar que los botones ocupen todo el ancho disponible

          children: [
            Text(
              'Texto original:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),

            Container(
              padding: const EdgeInsets.all(12.0),
              height: 120,
              decoration: BoxDecoration (
                border: Border.all(), // Agregar un borde alrededor del contenedor
              ),
              child: Text(textoOriginal),
            ),

            const SizedBox(height: 12),

            // Selectores de idioma: origen y destino
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: sourceLang,
                    decoration: const InputDecoration(labelText: 'Origen'),
                    items: languages.entries
                        .map((e) => DropdownMenuItem(value: e.key, child: Text(e.value)))
                        .toList(),
                    onChanged: (v) => setState(() { sourceLang = v ?? sourceLang; }),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: targetLang,
                    decoration: const InputDecoration(labelText: 'Destino'),
                    items: languages.entries
                        .map((e) => DropdownMenuItem(value: e.key, child: Text(e.value)))
                        .toList(),
                    onChanged: (v) => setState(() { targetLang = v ?? targetLang; }),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: escuchando ? detener : escuchar, // Deshabilitar el botón si ya se está escuchando
              icon: Icon(
                escuchando ? Icons.stop : Icons.mic,
              ),
              label: Text(
                escuchando ? 'Detener' : 'Escuchar',),
            ),

            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: traducir, // Llamar al método traducir cuando se presione el botón
              child: const Text('Traducir a ingles'),
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
              decoration: BoxDecoration (
                border: Border.all(), // Agregar un borde alrededor del contenedor
              ),
              child: Text(textoTraducido),  
            ),

            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: leer,
              icon: const Icon (
                Icons.volume_up,
              ),
              label: const Text("Escuchar Traducción"),
            ),
            
          ],
        ),
      ),
    );
  }

}