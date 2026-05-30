import 'package:flutter/material.dart'; // Importa la biblioteca Flutter para construir la interfaz de usuario.
import '../services/api_services.dart'; // Importa el servicio API para realizar solicitudes a la API.
import '../models/user.dart'; // Importa el modelo User para manejar los datos de los usuarios.

class UserProfileScreen extends StatelessWidget {
  final String userId; // Define la propiedad userId.

  UserProfileScreen({required this.userId}); // Constructor para recibir el argumento userId.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil del Usuario'), // Título de la pantalla.
      ),
      body: Center(
        child: Text('ID del Usuario: $userId'), // Muestra el ID del usuario.
      ),
    );
  }
}