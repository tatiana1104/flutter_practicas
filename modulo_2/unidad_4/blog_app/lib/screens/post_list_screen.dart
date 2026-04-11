import 'package:flutter/material.dart';
import '../services/api_services.dart';
import '../models/post.dart';

class PostListScreen extends StatelessWidget {
  final ApiService apiService = ApiService(); // Instancia del servicio API.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Publicaciones'), // Título de la pantalla.
      ),
      body: FutureBuilder<List<Post>>( // Construye la interfaz basada en datos futuros.
        future: apiService.fetchPosts(), // Llama al método para obtener publicaciones.
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator()); // Muestra un indicador de carga mientras espera.
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}')); // Muestra un mensaje de error si ocurre.
          } else if (snapshot.hasData) {
            final posts = snapshot.data!; // Obtiene la lista de publicaciones.
            return ListView.builder(
              itemCount: posts.length, // Número de elementos en la lista.
              itemBuilder: (context, index) {
                final post = posts[index]; // Obtiene cada publicación.
                return ListTile(
                  title: Text(post.title), // Muestra el título de la publicación.
                  subtitle: Text('Usuario ID: ${post.userId}'), // Muestra el ID del usuario.
                  onTap: () {
                    Navigator.pushNamed( // Navega a la pantalla de detalles del post.
                      context,
                      '/postDetail',
                      arguments: post.id, // Pasa el ID del post como argumento.
                    );
                  },
                );
              },
            );
          } else {
            return Center(child: Text('No hay publicaciones disponibles')); // Mensaje si no hay datos.
          }
        },
      ),
    );
  }
}