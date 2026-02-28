import 'package:flutter/material.dart';

class CustomRoutes { // Clase con métodos estáticos para rutas

  // Transición con desvanecimiento
  static Route fade(Widget page) { // Recibe un widget como parámetro
    return PageRouteBuilder( // Constructor de rutas personalizadas
      pageBuilder: (context, animation, secondaryAnimation) => page, // Retorna la página
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition( // Aplica efecto fade
          opacity: animation, // Controla la opacidad con la animación
          child: child, // El widget hijo
        );
      },
      transitionDuration: const Duration(milliseconds: 300), // Duración: 300ms
    );
  }

  // Transición deslizante desde la derecha
  static Route slide(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition( // Aplica efecto deslizante
          position: Tween<Offset>( // Define inicio y fin del movimiento
            begin: const Offset(1.0, 0.0), // Empieza fuera (derecha)
            end: Offset.zero, // Termina en posición normal
          ).animate(CurvedAnimation( // Aplica curva de animación
            parent: animation,
            curve: Curves.easeInOut, // Curva suave
          )),
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
  }

  // Transición con escala (zoom)
  static Route scale(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition( // Aplica efecto de escala
          scale: Tween<double>(begin: 0.0, end: 1.0).animate( // De 0% a 100%
            CurvedAnimation(parent: animation, curve: Curves.easeInOut),
          ),
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
  }

  // Transición deslizante desde abajo
  static Route slideUp(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.0, 1.0), // Empieza abajo
            end: Offset.zero, // Termina en posición normal
          ).animate(CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut,
          )),
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
  }
}