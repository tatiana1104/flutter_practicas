import 'package:flutter/material.dart';

class RegistrationFormScreen extends StatefulWidget {
  const RegistrationFormScreen({super.key});

  @override
  State<RegistrationFormScreen> createState() => _RegistrationFormScreenState();
}

//clase de estado asociado - clase privada
class _RegistrationFormScreenState extends State<RegistrationFormScreen> {
  final _formKey =
      GlobalKey<
        FormState
      >(); //el uso del global key para controlar el formulario
  final _isFormValidNotifier = ValueNotifier<bool>(
    false,
  ); //controlador para el estado del boton
  final TextEditingController _emailController =
      TextEditingController(); //controlador para el campo de email
  final TextEditingController _passwordController =
      TextEditingController(); //controlador para el campo de password

  @override
  void dispose() {
    _isFormValidNotifier.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'El email es obligatorio';
    }
    const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'; //estructura del email
    final regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return 'Formato de email incorrecto';
    }
    return null; //el email es valido
  }

  String? _validatePassword(String? value) {
    if (value == null || value.length < 8) {
      return 'La contraseña debe tener al menos 8 caracteres';
    }
    return null; //la contraseña es valida
  }

  void _checkFormValidity() {
    _isFormValidNotifier.value =
        _formKey.currentState?.validate() ??
        false; //verifica si el formulario es valido
  }

  void _submitForm() {
    if (_isFormValidNotifier.value) {
      debugPrint(
        'Email : ${_emailController.text}',
      ); //imprime el email en la consola
      debugPrint(
        'Contraseña : ${_passwordController.text}',
      ); //imprime la contraseña en la consola
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Registro exitoso')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Formulario de Registro')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, //asignar llave
          autovalidateMode:
              AutovalidateMode.onUserInteraction, //validacion en tiempo real
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.stretch, //estirar los elementos al maximo
            children: <Widget>[
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress, //tipo de teclado
                validator: _validateEmail,
                onChanged: (_) =>
                    _checkFormValidity(), //verificar validez al cambiar
              ),
              const SizedBox(height: 16.0), //espacio entre campos
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Contraseña',
                  border: OutlineInputBorder(),
                ),
                obscureText: true, //ocultar texto
                validator: _validatePassword,
                onChanged: (_) =>
                    _checkFormValidity(), //verificar validez al cambiar
              ),
              const SizedBox(height: 30.0),

              ValueListenableBuilder<bool>(
                valueListenable: _isFormValidNotifier,
                builder: (context, isValid, child) {
                  return ElevatedButton(
                    onPressed: isValid
                        ? _submitForm
                        : null, // Deshabilitado si no es válido
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: const Text(
                      'Registrarse',
                      style: TextStyle(fontSize: 18),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
