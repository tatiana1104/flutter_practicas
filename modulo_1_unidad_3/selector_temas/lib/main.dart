// ============================================
// ARCHIVO: main.dart
// Pantalla principal con 3 botones para elegir
// cual implementacion de tema quieres ver:
// Provider, BLoC o Riverpod
// ============================================

import 'package:flutter/material.dart'; // Importa los widgets básicos de Flutter

// Importamos las 3 pantallas, cada una en su archivo
import 'package:selector_temas/logic/theme_provider.dart'; // Pantalla con Provider
import 'package:selector_temas/logic/theme_bloc.dart'; // Pantalla con BLoC/Cubit
import 'package:selector_temas/logic/theme_riverpod.dart'; // Pantalla con Riverpod

// Punto de entrada de la aplicacion Flutter
void main() {
  runApp(MiApp()); // Arranca la app
}

// Widget raiz: un MaterialApp con la pantalla del menu
class MiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Selector de Temas', // Titulo de la app
      theme: ThemeData(
        brightness: Brightness.light, // Tema base del menu: claro
        colorScheme: ColorScheme.light(
          primary: Colors.indigo, // Color principal del menu: indigo
        ),
      ),
      home: MenuPrincipal(), // Pantalla de inicio: el menu
    );
  }
}

// Pantalla del menu con los 3 botones
class MenuPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior
      appBar: AppBar(title: Text('Elige una implementacion')),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(24), // Espacio alrededor del contenido
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Centrar verticalmente
            crossAxisAlignment: CrossAxisAlignment.stretch, // Botones de ancho completo
            children: [
              // Titulo descriptivo
              Text(
                'Selector de Temas',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8), // Espacio pequeno

              // Subtitulo explicativo
              Text(
                'Elige cual patron de estado quieres probar:',
                style: TextStyle(fontSize: 16, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40), // Espacio grande

              // ---- BOTON 1: Provider ----
              ElevatedButton(
                // Al presionar, navega a PantallaProvider (logica_provider.dart)
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => PantallaProvider()),
                ),
                // Estilo del boton: fondo azul, texto blanco, bordes redondeados
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text('Provider', style: TextStyle(fontSize: 18)),
              ),
              SizedBox(height: 16), // Espacio entre botones

              // ---- BOTON 2: BLoC ----
              ElevatedButton(
                // Al presionar, navega a PantallaBloc (logica_bloc.dart)
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => PantallaBloc()),
                ),
                // Estilo: fondo verde
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text('BLoC / Cubit', style: TextStyle(fontSize: 18)),
              ),
              SizedBox(height: 16),

              // ---- BOTON 3: Riverpod ----
              ElevatedButton(
                // Al presionar, navega a PantallaRiverpod (logica_riverpod.dart)
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => PantallaRiverpod()),
                ),
                // Estilo: fondo violeta
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text('Riverpod', style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
