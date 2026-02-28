import 'package:flutter/material.dart';
import '../routes/custom_routes.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget { // Pantalla CON estado (campos de texto)
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState(); // Crea el estado
}

class _LoginScreenState extends State<LoginScreen> { // Clase del estado
  // Controladores para capturar texto de los campos
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true; // Controla si la contraseña está oculta

  @override
  void dispose() { // Se ejecuta al destruir el widget
    _emailController.dispose(); // Libera memoria del controlador
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( // Barra superior
        title: const Text('Iniciar Sesión'),
        centerTitle: true, // Centra el título
      ),
      body: SingleChildScrollView( // Permite scroll si el teclado tapa contenido
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // Estira hijos horizontalmente
          children: [
            const SizedBox(height: 40),
            const Icon( // Icono de usuario
              Icons.account_circle,
              size: 100,
              color: Color(0xFF6C63FF),
            ),
            const SizedBox(height: 40),
            // Campo de email
            TextField(
              controller: _emailController, // Vincula el controlador
              keyboardType: TextInputType.emailAddress, // Teclado para email
              decoration: InputDecoration( // Decoración del campo
                labelText: 'Correo electrónico',
                prefixIcon: const Icon(Icons.email, color: Color(0xFF6C63FF)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder( // Borde cuando está enfocado
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Color(0xFF6C63FF), width: 2),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Campo de contraseña
            TextField(
              controller: _passwordController,
              obscureText: _obscurePassword, // Oculta/muestra el texto
              decoration: InputDecoration(
                labelText: 'Contraseña',
                prefixIcon: const Icon(Icons.lock, color: Color(0xFF6C63FF)),
                suffixIcon: IconButton( // Botón para mostrar/ocultar
                  icon: Icon(
                    _obscurePassword ? Icons.visibility_off : Icons.visibility,
                    color: const Color(0xFF6C63FF),
                  ),
                  onPressed: () {
                    setState(() { // Actualiza el estado y redibuja
                      _obscurePassword = !_obscurePassword; // Invierte el valor
                    });
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Color(0xFF6C63FF), width: 2),
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Link de olvidé contraseña
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {}, // Sin acción por ahora
                child: const Text(
                  '¿Olvidaste tu contraseña?',
                  style: TextStyle(color: Color(0xFF6C63FF)),
                ),
              ),
            ),
            const SizedBox(height: 30),
            // Botón de login
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement( // Reemplaza la pantalla actual
                  context,
                  CustomRoutes.slide(const HomeScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6C63FF),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 3,
              ),
              child: const Text(
                'INICIAR SESIÓN',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Sección de registro
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('¿No tienes cuenta?'),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Regístrate',
                    style: TextStyle(
                      color: Color(0xFF6C63FF),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}