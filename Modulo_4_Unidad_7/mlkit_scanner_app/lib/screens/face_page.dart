import 'package:flutter/material.dart';

import 'dart:io'; // Para manejar archivos de imagen seleccionados desde la galería o la cámara
import 'package:image_picker/image_picker.dart'; // Para seleccionar imágenes desde la galería o la cámara
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart'; // Para la detección de rostros utilizando Google ML Kit

class FacePage extends StatefulWidget {
  
  @override
  State<FacePage> createState() => _FacePageState(); // Crear el estado de la página de detección de rostros
}

class _FacePageState extends State<FacePage> {

  String result = "No se detecto ningún rostro"; // Variable para almacenar el resultado de la detección de rostros

  File? imageFile; // Variable para almacenar la imagen seleccionada

  Future<void> detectFace() async {
    try {
      final picker = ImagePicker(); // Crear una instancia de ImagePicker para seleccionar imágenes

      final pickedFile = await picker.pickImage(source: ImageSource.camera); // Permitir al usuario seleccionar una imagen desde la cámara

      if (pickedFile == null) return; // Si no se selecciona ninguna imagen, salir de la función

      imageFile = File(pickedFile.path); // Almacenar la imagen seleccionada en la variable imageFile

      setState(() {}); // Actualizar el estado para mostrar la imagen seleccionada

      final inputImage = InputImage.fromFile(imageFile!); // Crear un objeto InputImage a partir del archivo de imagen seleccionado

      final options = FaceDetectorOptions(
        enableContours: true, // Habilitar la detección de contornos faciales
        enableClassification: true, // Habilitar la clasificación de expresiones faciales (sonrisa, ojos abiertos, etc.)  
      );

      final faceDetector = FaceDetector(options: options); // Crear una instancia de FaceDetector para detectar rostros con contornos habilitados

      final faces = await faceDetector.processImage(inputImage); // Procesar la imagen para obtener los rostros detectados con IA

      result = "Rostros detectados: ${faces.length}"; // Almacenar el resultado de la detección de rostros en la variable result

      setState(() {}); // Actualizar el estado para mostrar el resultado de la detección de rostros

      faceDetector.close(); // Cerrar el detector de rostros para liberar recursos
    } 
    catch (e) {
      print("Error al detectar rostros: $e"); // Imprimir cualquier error que ocurra durante el proceso de detección de rostros
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text('Rostro - Detección de rostros'), // Título de la página de detección de rostros
      ),

      body: Padding(
        
        padding: EdgeInsets.all(20), // Agregar un padding alrededor del contenido
        
        child: Column(
          
          //mainAxisAlignment: MainAxisAlignment.center, // Centrar el contenido verticalmente
          children: [
            
            ElevatedButton( // Botón para iniciar el proceso de detección de rostros
              onPressed: detectFace, // Llamar a la función detectFace cuando se presione el botón
              child: Text("Detectar Rostro"), // Texto del botón
            ),
            
            SizedBox(height: 20), // Espacio entre el botón y el resultado de la detección de rostros
            Text(result), // Mostrar el resultado de la detección de rostros
          ],
        ),
      ),
    );
  }

}
