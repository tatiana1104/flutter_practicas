import 'package:flutter/material.dart';

import 'dart:io'; // Para manejar archivos de imagen seleccionados desde la galería o la cámara
import 'package:image_picker/image_picker.dart';  // Para seleccionar imágenes desde la galería o la cámara
import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart'; // Para el escaneo de códigos QR utilizando Google ML Kit

class QRPage extends StatefulWidget {

  @override
  State<QRPage> createState() => _QRPageState(); // Crear el estado de la página QR
}

class _QRPageState extends State<QRPage> {

  String qrResult = "No se deteto QR";  // Variable para almacenar el resultado del escaneo de códigos QR

  File? imageFile; // Variable para almacenar la imagen seleccionada   

  Future<void> scanQR() async {

    try {

      final picker = ImagePicker(); // Crear una instancia de ImagePicker para seleccionar imágenes

      final pickedFile = await picker.pickImage(source: ImageSource.camera); // Permitir al usuario seleccionar una imagen desde la cámara

      if (pickedFile == null) return; // Si no se selecciona ninguna imagen, salir de la función

      imageFile = File(pickedFile.path); // Almacenar la imagen seleccionada en la variable imageFile

      setState ((){}); // Actualizar el estado para mostrar la imagen seleccionada

      final inputImage = InputImage.fromFile(imageFile!); // Crear un objeto InputImage a partir del archivo de imagen seleccionado

      final barcodeScanner = BarcodeScanner(); // Crear una instancia de BarcodeScanner para escanear códigos QR

      final barcodes = await barcodeScanner.processImage(inputImage); // Procesar la imagen para obtener los códigos QR detectados con IA

      for (Barcode barcode in barcodes) { // Iterar sobre los códigos QR detectados y almacenar el resultado del escaneo en la variable qrResult
        qrResult = barcode.rawValue ?? "Sin información"; // Si el código QR no tiene un valor raw, mostrar "Sin información"
      }

      setState((){}); // Actualizar el estado para mostrar el resultado del escaneo de códigos QR

      barcodeScanner.close(); // Cerrar el escáner de códigos de barras para liberar recursos
    } 
    catch (e) {
      print("Error al escanear el código QR: $e"); // Imprimir cualquier error que ocurra durante el proceso de escaneo de códigos QR
    }
  }

  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        title: Text('QR - Escaneo de códigos QR'), // Título de la página QR
      ),

      body: Padding(

        padding: EdgeInsets.all(20), // Agregar un padding alrededor del contenido

        child: Column(

          //mainAxisAlignment: MainAxisAlignment.center, // Centrar el contenido verticalmente
          children: [

            ElevatedButton( // Botón para iniciar el proceso de escaneo de códigos QR
              onPressed: scanQR, // Llamar a la función scanQR cuando se presione el botón
              child: Text("Escanear QR"), // Texto del botón
            ),

            SizedBox(height: 20), // Espacio entre el botón y el resultado del escaneo

            if (imageFile != null) // Si se ha seleccionado una imagen, mostrarla en la pantalla
              Image.file( // Mostrar la imagen seleccionada
                imageFile!,
                height: 250,
              ), 

            SizedBox(height: 20), // Espacio entre la imagen y el resultado del escaneo

            Text( // Mostrar el resultado del escaneo de códigos QR
              qrResult,
              style: TextStyle(fontSize: 20), // Estilo del texto del resultado del escaneo
            ),
          ],
        ),
      ),
    );
  }

}

