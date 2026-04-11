import 'package:flutter/material.dart';
import 'screens/post_list_screen.dart';
import 'screens/post_detail_screen.dart';
import 'screens/user_profile_screen.dart';

void main() {
  runApp(MyApp()); // Punto de entrada de la aplicación.
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blog App', // Título de la aplicación.
      theme: ThemeData(
        primarySwatch: Colors.blue, // Tema principal de la aplicación.
      ),
      initialRoute: '/', // Ruta inicial de la aplicación.
      routes: {
        '/': (context) => PostListScreen(), // Pantalla de lista de publicaciones.
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/postDetail') {
          final String postId = settings.arguments as String; // Obtiene el argumento postId.
          return MaterialPageRoute(
            builder: (context) => PostDetailScreen(postId: postId),
          );
        } else if (settings.name == '/userProfile') {
          final String userId = settings.arguments as String; // Obtiene el argumento userId.
          return MaterialPageRoute(
            builder: (context) => UserProfileScreen(userId: userId),
          );
        }
        return null; // Devuelve null si la ruta no coincide.
      },
    );
  }
}
