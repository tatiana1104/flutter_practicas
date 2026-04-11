import 'package:flutter/material.dart'; // Importa la biblioteca Flutter para construir la interfaz de usuario.
import '../services/api_services.dart'; // Importa el servicio API para realizar solicitudes a la API.
import '../models/post.dart'; // Importa el modelo Post para manejar los datos de las publicaciones.
import '../models/user.dart'; // Importa el modelo User para manejar los datos de los usuarios.

class PostDetailScreen extends StatelessWidget {
  final String postId; // Parámetro obligatorio para recibir el ID del post.

  PostDetailScreen({required this.postId}); // Constructor para inicializar el postId.

  final ApiService apiService = ApiService(); // Instancia del servicio API.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles del Post'), // Título de la pantalla.
      ),
      body: FutureBuilder<Post>(
        future: apiService.fetchPostDetails(postId), // Llama al método para obtener los detalles del post.
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator()); // Muestra un indicador de carga mientras espera.
          } else if (snapshot.hasError) {
            return Center(child: Text('Error al cargar los detalles del post.')); // Muestra un mensaje de error si ocurre.
          } else {
            final post = snapshot.data!; // Obtiene los detalles del post.
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.title,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), // Muestra el título del post.
                  ),
                  SizedBox(height: 16),
                  Text(post.body), // Muestra el cuerpo del post.
                ],
              ),
            );
          }
        },
      ),
    );
  }
}