import 'package:flutter/material.dart';

import 'dart:io'; // Para manejar archivos de imagen seleccionados desde la galería o la cámara
import 'package:image_picker/image_picker.dart'; // Para seleccionar imágenes desde la galería o la cámara  
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart'; // Para el reconocimiento de texto utilizando Google ML Kit

class OCRPage extends StatefulWidget {
  
  @override
  State<OCRPage> createState() => _OCRPageState(); // Crear el estado de la página OCR
}

class _OCRPageState extends State<OCRPage> {

  String recognizedText = "No hay texto detectado"; // Variable para almacenar el texto reconocido
  
  File? imageFile; // Variable para almacenar la imagen seleccionada

  // Función para seleccionar una imagen y reconocer el texto en ella
  Future<void> scanText() async {
    try {
      final picker = ImagePicker(); // Crear una instancia de ImagePicker para seleccionar imágenes

      final pickedFile = await picker.pickImage(source: ImageSource.camera); // Permitir al usuario seleccionar una imagen desde la cámara
        
      if (pickedFile == null) return; // Si no se selecciona ninguna imagen, salir de la función

      imageFile = File(pickedFile.path); // Almacenar la imagen seleccionada en la variable imageFile

      setState(() {}); // Actualizar el estado para mostrar la imagen seleccionada 

      final inputImage = InputImage.fromFile(imageFile!); // Crear un objeto InputImage a partir del archivo de imagen seleccionado

      final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin); // Crear una instancia de TextRecognizer para el reconocimiento de texto en inglés

      final RecognizedText recognizedTextData = await textRecognizer.processImage(inputImage); // Procesar la imagen para obtener el texto reconocido con IA

      setState(() {}); // Actualizar el estado para mostrar el texto reconocido

      textRecognizer.close(); // Cerrar el reconocedor de texto para liberar recursos
    }
    catch (e) {
      print("Error al reconocer el texto: $e"); // Imprimir cualquier error que ocurra durante el proceso de reconocimiento de texto
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OCR - Reconocimiento de texto'), // Título de la página OCR
      ),
      body: Padding(
        padding: EdgeInsets.all(20), // Agregar un padding alrededor del contenido

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centrar el contenido verticalmente
          children: [
            ElevatedButton( // Botón para iniciar el proceso de reconocimiento de texto
              onPressed: scanText, // Llamar a la función scanText cuando se presione el botón
              child: Text("Escanear texto"), // Texto del botón
            ),
            SizedBox(height: 20), // Espacio entre el botón y el texto reconocido

            if (imageFile != null) // Si se ha seleccionado una imagen, mostrarla en la pantalla
              Image.file( // Mostrar la imagen seleccionada
                imageFile!, // Usar el operador de null assertion para asegurar que imageFile no es nulo
                height: 250, // Establecer una altura para la imagen
              ),
              
            SizedBox(height: 20), // Espacio entre la imagen y el texto reconocido

            Expanded( // Usar Expanded para que el texto reconocido ocupe el espacio restante
              child: SingleChildScrollView( // Permitir desplazamiento si el texto reconocido es largo
                child: Text(
                  recognizedText, // Mostrar el texto reconocido
                  style: TextStyle(fontSize: 18), // Estilo del texto reconocido
                ),
              ),
            )
            
          ],
        ),
      ),
    );
  }
}
