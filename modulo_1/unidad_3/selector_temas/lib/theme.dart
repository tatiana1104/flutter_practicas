// ============================================
// ARCHIVO: temas.dart
// Define los 3 temas y la clase EstadoTema
// Este archivo es compartido por las 3 implementaciones
// ============================================

import 'package:flutter/material.dart'; // Importa los widgets básicos de Flutter

// Tema claro
final temaClaro = ThemeData(
  brightness: Brightness.light, // Modo claro: fondo blanco, texto negro
  colorScheme: ColorScheme.light(
    primary: Colors.blue, // Color principal: azul
  ),
);

// Tema oscuro
final temaOscuro = ThemeData(
  brightness: Brightness.dark, // Modo oscuro: fondo negro, texto blanco
);

// Tema devSenior (violeta con negro)
final temaDevSenior = ThemeData(
  brightness: Brightness.dark, // Base oscura
  scaffoldBackgroundColor: Colors.black, // Fondo de pantalla: negro
  colorScheme: ColorScheme.dark(
    primary: Colors.deepPurple, // Color principal: violeta oscuro
    secondary: Colors.purpleAccent, // Color secundario: violeta brillante
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.deepPurple, // Barra superior: violeta
  ),
);

// Clase simple que agrupa un ThemeData con su nombre
// Se usa en BLoC y Riverpod para emitir ambos valores juntos
class EstadoTema {
  final ThemeData tema; // El ThemeData de Flutter
  final String nombre; // Nombre para mostrar en pantalla

  EstadoTema(this.tema, this.nombre); // Constructor corto de Dart
}
