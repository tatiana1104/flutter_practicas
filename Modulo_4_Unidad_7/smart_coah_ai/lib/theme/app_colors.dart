import 'package:flutter/material.dart';

/// ============================================================
///  PALETA DE COLORES CENTRAL DE LA APP (SmartCoach AI)
/// ============================================================
/// Aquí se concentran TODOS los colores de la aplicación.
/// Si quieres cambiar el aspecto visual de la app, solo debes
/// modificar este archivo. Ninguna pantalla debe escribir un
/// color "a mano"; siempre debe tomarlo de aquí.
///
/// Usamos una clase con campos `static const` para poder
/// acceder a los colores así:  AppColors.primary
/// ------------------------------------------------------------
class AppColors {
  // Constructor privado: evita que alguien cree un objeto de
  // esta clase por error. Solo se usa para agrupar constantes.
  AppColors._();

  // -------------------- COLORES PRINCIPALES -----------------
  // Color de marca (verde deportivo). Es el color dominante.
  static const Color primary = Color(0xFF1B8A5A);

  // Variante más oscura del primario (para textos sobre fondos
  // claros o estados presionados).
  static const Color primaryDark = Color(0xFF12613F);

  // Color de acento (naranja energía) para botones secundarios
  // y detalles que deben resaltar.
  static const Color accent = Color(0xFFF2A33C);

  // -------------------------- NEUTROS -----------------------
  // Fondo general de las pantallas (casi blanco).
  static const Color background = Color(0xFFF6F8F7);

  // Color de las tarjetas (Card) y superficies elevadas.
  static const Color surface = Color(0xFFFFFFFF);

  // Texto principal (gris muy oscuro, más suave que el negro puro).
  static const Color textPrimary = Color(0xFF1F2A24);

  // Texto secundario (gris medio) para descripciones y ayudas.
  static const Color textSecondary = Color(0xFF6B7770);

  // Bordes y líneas divisorias.
  static const Color border = Color(0xFFDDE3E0);

  // ----------------------- COLORES DE ESTADO ----------------
  // Color para mostrar errores (mensajes, validaciones).
  static const Color error = Color(0xFFD64545);

  // Color para mensajes de éxito o confirmación.
  static const Color success = Color(0xFF2E9E5B);

  // Texto que va ENCIMA de un fondo de color primario.
  static const Color onPrimary = Color(0xFFFFFFFF);
}
