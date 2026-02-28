// Importa el paquete principal de Flutter con widgets y utilidades.
import 'package:flutter/material.dart';

// Importa la pantalla del producto que estará en screens/product_detail_screen.dart
import 'screens/product.dart';

// Punto de entrada de la aplicación.
// runApp() arranca la app y dibuja el widget pasado como raíz.
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget { //App con estado para cambiar tema
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState(); // Crea el estado asociado
}

class _MyAppState extends State<MyApp> {
  bool isDark = false; // Variable que indica si el tema es oscuro (false = claro)

  @override
  Widget build(BuildContext context) {
    // MaterialApp configura la app: temas, rutas, home, etc.
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Oculta la etiqueta "debug" en la esquina

      themeMode: isDark ? ThemeMode.dark : ThemeMode.light, //// Activa el tema según isDark

      // Definición del tema claro.
      theme: ThemeData(
        brightness: Brightness.light, // Marca que es un tema claro
        useMaterial3: true, // Activa Material Design 3
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue), // Paleta basada en azul
      ),

      // Definición del tema oscuro.
      darkTheme: ThemeData(
        brightness: Brightness.dark, // Marca que es un tema oscuro
        useMaterial3: true, // Material 3 también para el modo oscuro
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue, // Misma semilla de color para coherencia
          brightness: Brightness.dark, // Indica colores adaptados al modo oscuro
        ),
      ),

      // La pantalla inicial (home) es ProductDetailScreen.
      // Le pasamos dos parámetros: la función para cambiar el tema y el estado actual.
      home: ProductDetailScreen(
        isDarkMode: isDark, // Estado actual del tema (true = oscuro)
        onThemeChanged: (value) {
          // Esta función se ejecuta cuando el switch cambia en la pantalla.
          setState(() {
            isDark = value; // Actualiza la variable isDark y reconstruye la app
          });
        },
      ),
    );
  }
}
