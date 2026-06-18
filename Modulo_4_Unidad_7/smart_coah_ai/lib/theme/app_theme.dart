import 'package:flutter/material.dart';
import 'app_colors.dart';

/// ============================================================
///  TEMA GLOBAL DE LA APLICACIÓN (Material Design 3)
/// ============================================================
/// Este archivo arma el ThemeData usando los colores definidos
/// en app_colors.dart. Al usar Material 3 (useMaterial3: true)
/// obtenemos botones, campos y tarjetas con el estilo moderno.
/// ------------------------------------------------------------
class AppTheme {
  AppTheme._();

  /// Devuelve el tema claro que usará toda la app.
  static ThemeData get light {
    return ThemeData(
      // Activamos Material Design 3 (requisito del taller).
      useMaterial3: true,

      // El "colorScheme" es la base de colores de Material 3.
      // Lo generamos a partir de nuestro color de marca.
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        primary: AppColors.primary,
        secondary: AppColors.accent,
        surface: AppColors.surface,
        error: AppColors.error,
        brightness: Brightness.light,
      ),

      // Color de fondo general de las pantallas (Scaffold).
      scaffoldBackgroundColor: AppColors.background,

      // ----------------------- AppBar -----------------------
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.onPrimary, // color de texto/iconos
        elevation: 0,
        centerTitle: true,
      ),

      // ------------------- Botones principales --------------
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.onPrimary,
          padding: const EdgeInsets.symmetric(vertical: 16),
          // Bordes redondeados.
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      // ----------------------- Tarjetas ---------------------
      cardTheme: CardThemeData(
        color: AppColors.surface,
        elevation: 2,
        margin: const EdgeInsets.symmetric(vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),

      // ------------------ Campos de formulario --------------
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surface,
        // Borde normal.
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        // Borde cuando el campo está enfocado.
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
        ),
        // Borde cuando hay un error de validación.
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.error),
        ),
      ),
    );
  }
}
