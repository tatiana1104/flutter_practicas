import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../utils/validators.dart';
import 'home.dart';

/// Pantalla de inicio de sesión de la aplicación
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  /// Clave global para el formulario
  final _formKey = GlobalKey<FormState>();

  /// Controlador para el campo de correo electrónico
  final _emailController = TextEditingController();

  /// Controlador para el campo de contraseña
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  /// Método para validar y procesar el login
  void _login() {
    if (_formKey.currentState!.validate()) {
      // Navegar a la pantalla de inicio
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      /// Color de fondo de la pantalla
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          /// Padding general de la pantalla, responsive
          padding: EdgeInsets.symmetric(
            horizontal: screenSize.width * 0.05,
            vertical: mediumSpacing,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              /// Centrar el contenido verticalmente
              mainAxisAlignment: MainAxisAlignment.center,

              /// Centrar horizontalmente
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /// Imagen del login, tamaño responsive

                /// Círculo decorativo
                /// Logo circular usando logoSize y primaryColor
                Center(
                  child: Container(
                    width: logoSize,
                    height: logoSize,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: primaryColor,
                    ),
                  ),
                ),
                SizedBox(height: mediumSpacing),

                /// Título de la pantalla
                /// Texto "Bienvenido" con estilo headingTextStyle y color titleColor
                Text(
                  'Bienvenido',
                  style: headingTextStyle.copyWith(color: titleColor),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: extraLargeSpacing),

                /// Campo de texto para el correo electrónico

                /// Etiqueta del email
                SizedBox(
                  width: screenSize.width * 0.8,
                  child: Text(
                    'Email',
                    style: bodyTextStyle,
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(height: smallSpacing),
                SizedBox(
                  width: screenSize.width * 0.8,
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      /// Configuración del input: label, borde con inputBorderRadius, fondo blanco, padding izquierdo
                      labelText: 'tu@email.com',
                      labelStyle: bodyTextStyle,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(inputBorderRadius),
                      ),
                      filled: true,
                      fillColor: whiteColor,
                      contentPadding: EdgeInsets.only(left: inputPaddingLeft),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: Validator.email,
                  ),
                ),
                SizedBox(height: mediumSpacing),

                /// Campo de texto para la contraseña
                /// Etiqueta de la contraseña
                SizedBox(
                  width: screenSize.width * 0.8,
                  child: Text(
                    'Contraseña',
                    style: bodyTextStyle,
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(height: smallSpacing),
                SizedBox(
                  width: screenSize.width * 0.8,
                  child: TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: '********',
                      labelStyle: bodyTextStyle,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(inputBorderRadius),
                      ),
                      filled: true,
                      fillColor: whiteColor,
                      contentPadding: EdgeInsets.only(left: inputPaddingLeft),
                    ),
                    obscureText: true,
                    validator: Validator.password,
                  ),
                ),
                SizedBox(height: largeSpacing),

                /// Botón para iniciar sesión
                SizedBox(
                  width: screenSize.width * 0.8,
                  child: ElevatedButton(
                    onPressed: _login,
                    style: ElevatedButton.styleFrom(
                      /// Estilo del botón: color primario, padding vertical, radio buttonBorderRadius
                      backgroundColor: primaryColor,
                      padding: EdgeInsets.symmetric(vertical: mediumSpacing),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(buttonBorderRadius),
                      ),
                    ),
                    child: Text(
                      'Ingresar',
                      style: titleTextStyle.copyWith(color: whiteColor),
                    ),
                  ),
                ),
                SizedBox(height: mediumSpacing),

                /// Enlace para recuperar contraseña
                TextButton(
                  onPressed: () {
                    // Navegar a recuperación de contraseña
                  },
                  child: Text(
                    '¿Olvidaste tu contraseña?',
                    style: bodyTextStyle.copyWith(color: primaryColor),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
