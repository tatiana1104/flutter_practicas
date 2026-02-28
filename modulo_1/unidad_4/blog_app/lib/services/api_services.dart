import 'dart:convert'; // Importa la biblioteca para convertir datos JSON.
import 'package:http/http.dart' as http; // Importa la biblioteca HTTP para realizar solicitudes a la API.
import '../models/comment.dart'; // Importa el modelo Comment.
import '../models/post.dart'; // Importa el modelo Post.
import '../models/user.dart'; // Importa el modelo User.

class ApiService {
  final String baseUrl = 'https://jsonplaceholder.typicode.com'; // Define la URL base de la API.

  // Obtiene la lista de comentarios
  Future<List<Comment>> fetchComments() async {
    final response = await http.get(Uri.parse('$baseUrl/comments')); // Realiza una solicitud GET al endpoint de comentarios.

    if (response.statusCode == 200) { // Verifica si la respuesta fue exitosa (código 200).
      List<dynamic> data = jsonDecode(response.body); // Decodifica el cuerpo de la respuesta JSON en una lista dinámica.
      return data.map((json) => Comment.fromJson(json)).toList(); // Convierte cada elemento JSON en un objeto Comment y devuelve la lista.
    } else {
      throw Exception('No se pudieron cargar los comentarios'); // Lanza una excepción si la solicitud falla.
    }
  }

  // Obtiene la lista de publicaciones (GET)
  Future<List<Post>> fetchPosts() async {
    final response = await http.get(Uri.parse('$baseUrl/posts')); // Realiza una solicitud GET al endpoint de publicaciones.

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      print('Datos obtenidos: $data'); // Debug: Imprime los datos obtenidos.
      return data.map((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception('No se pudieron cargar las publicaciones');
    }
  }

  // Obtiene los detalles de un post específico.
  Future<Post> fetchPostDetails(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/posts/$id')); // Realiza una solicitud GET al endpoint de detalles de un post.

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return Post.fromJson(data);
    } else {
      throw Exception('No se pudieron cargar los detalles del post');
    }
  }

  // Obtiene la información de un usuario.
  Future<User> fetchUser(String userId) async {
    final response = await http.get(Uri.parse('$baseUrl/users/$userId')); // Realiza una solicitud GET al endpoint de detalles de un usuario.

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return User.fromJson(data);
    } else {
      throw Exception('No se pudieron cargar los detalles del usuario');
    }
  }

  // Crea una nueva publicación (POST).
  Future<Post> createPost(Map<String, String> postData) async {
    final response = await http.post(
      Uri.parse('$baseUrl/posts'), // Define el endpoint para crear una publicación.
      headers: {'Content-Type': 'application/json'}, // Especifica que el contenido es JSON.
      body: jsonEncode(postData), // Codifica los datos del cuerpo en formato JSON.
    );

    if (response.statusCode == 201) {
      return Post.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('No se pudo crear la publicación');
    }
  }

  // Actualiza una publicación existente (PUT).
  Future<Post> updatePost(String id, Map<String, String> postData) async {
    final response = await http.put(
      Uri.parse('$baseUrl/posts/$id'), // Define el endpoint para actualizar una publicación específica.
      headers: {'Content-Type': 'application/json'}, // Especifica que el contenido es JSON.
      body: jsonEncode(postData), // Codifica los datos del cuerpo en formato JSON.
    );

    if (response.statusCode == 200) {
      return Post.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('No se pudo actualizar la publicación');
    }
  }

  // Elimina una publicación (DELETE).
  Future<void> deletePost(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/posts/$id')); // Realiza una solicitud DELETE al endpoint de una publicación específica.

    if (response.statusCode == 200) {
      return;
    } else {
      throw Exception('No se pudo eliminar la publicación');
    }
  }
}