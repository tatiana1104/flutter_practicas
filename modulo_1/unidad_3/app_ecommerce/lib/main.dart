import 'package:flutter/material.dart'; 
import 'screens/splash_screen.dart'; // Importa la pantalla de splash

void main() {
  runApp(const MyApp()); // Punto de entrada: ejecuta la aplicación
}

class MyApp extends StatelessWidget { // Widget principal sin estado
  const MyApp({super.key}); // Constructor constante

  @override
  Widget build(BuildContext context) { // Construye la interfaz
    return MaterialApp( // Widget raíz de la app
      title: 'Ecommerce App', // Título de la aplicación
      debugShowCheckedModeBanner: false, // Oculta el banner de debug
      theme: ThemeData( // Configuración del tema visual
        colorScheme: ColorScheme.fromSeed( // Genera colores a partir de uno base
          seedColor: const Color(0xFF6C63FF), // Color semilla (morado)
          primary: const Color(0xFF6C63FF), // Color primario
          secondary: const Color(0xFFFF6584), // Color secundario (rosa)
        ),
        useMaterial3: true, // Usa Material Design 3
        appBarTheme: const AppBarTheme( // Estilo global del AppBar
          backgroundColor: Color(0xFF6C63FF), // Fondo morado
          foregroundColor: Colors.white, // Texto blanco
          elevation: 0, // Sin sombra
        ),
      ),
      home: const SplashScreen(), // Pantalla inicial
    );
  }
}