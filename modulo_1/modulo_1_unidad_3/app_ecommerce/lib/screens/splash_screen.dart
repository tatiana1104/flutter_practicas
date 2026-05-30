import 'package:flutter/material.dart';
import '../routes/custom_routes.dart'; // Importa rutas personalizadas
import 'login_screen.dart'; // Importa pantalla de login

class SplashScreen extends StatelessWidget { // Pantalla sin estado
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Estructura básica de pantalla
      body: Container( // Contenedor principal
        width: double.infinity, // Ancho completo
        decoration: const BoxDecoration( // Decoración del fondo
          gradient: LinearGradient( // Degradado lineal
            begin: Alignment.topCenter, // Inicia arriba
            end: Alignment.bottomCenter, // Termina abajo
            colors: [Color(0xFF6C63FF), Color(0xFF4834DF)], // Colores del degradado
          ),
        ),
        child: Column( // Columna para apilar widgets verticalmente
          mainAxisAlignment: MainAxisAlignment.center, // Centra verticalmente
          children: [
            // Contenedor del logo
            Container(
              padding: const EdgeInsets.all(20), // Espaciado interno
              decoration: BoxDecoration(
                color: Colors.white, // Fondo blanco
                borderRadius: BorderRadius.circular(20), // Bordes redondeados
                boxShadow: [ // Sombra
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2), // Color de sombra
                    blurRadius: 20, // Difuminado
                    offset: const Offset(0, 10), // Desplazamiento
                  ),
                ],
              ),
              child: const Icon( // Icono de bolsa de compras
                Icons.shopping_bag,
                size: 80,
                color: Color(0xFF6C63FF),
              ),
            ),
            const SizedBox(height: 30), // Espacio vertical
            const Text( // Título de la app
              'ShopMaster',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 2, // Espaciado entre letras
              ),
            ),
            const SizedBox(height: 10),
            const Text( // Subtítulo
              'Tu tienda favorita',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70, // Blanco con 70% opacidad
              ),
            ),
            const SizedBox(height: 60),
            // Botón para ingresar
            ElevatedButton(
              onPressed: () { // Acción al presionar
                Navigator.push( // Navega a LoginScreen
                  context,
                  CustomRoutes.fade(const LoginScreen()), // Usa transición fade
                );
              },
              style: ElevatedButton.styleFrom( // Estilo del botón
                backgroundColor: Colors.white,
                foregroundColor: const Color(0xFF6C63FF),
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 5, // Sombra del botón
              ),
              child: const Text(
                'INGRESAR',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}