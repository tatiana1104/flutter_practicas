import 'package:flutter/material.dart';

import 'qr_page.dart'; // Para la página de escaneo de códigos QR
import 'face_page.dart'; // Para la página de detección de rostros
import 'ocr_page.dart'; // Para la página de reconocimiento de texto utilizando OCR

class HomePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google ML Kit Scanner'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center, // Centrar verticalmente
          children: [
            buildButton(
              context,
              "OCR - Reconocimiento de texto",
              OCRPage(),
            ),
            SizedBox(height: 20),

            
            buildButton(
              context,
              "QR - Escaneo de códigos QR",
              QRPage(),
            ),
            SizedBox(height: 20),
            
            buildButton(
              context,
              "Rostro - Detección de rostros",
              FacePage(),
            ),
            
                      
          ],
            
        ),
      ),
    );
  }

  // Método para construir cada botón de la página principal
  Widget buildButton(BuildContext context, String text, Widget page) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton( // Botón para cada funcionalidad
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => page), // Navegar a la página correspondiente al botón presionado
          );
        },

        child: Text(text, style: TextStyle(fontSize: 18)), // Estilo del texto del botón
      ),
    );
  }
}