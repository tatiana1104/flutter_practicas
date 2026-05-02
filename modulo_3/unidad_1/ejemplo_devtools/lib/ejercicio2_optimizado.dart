import 'package:flutter/material.dart';

/*
 * Optimizaciones realizadas en ejercicio2_optimizado.dart:
 *
 * 1. **Reemplazo de SingleChildScrollView por ListView.builder**:
 *    - Cambiado para usar ListView.builder en lugar de SingleChildScrollView con Column.
 *    - Beneficio: Renderiza solo los elementos visibles (lazy loading), mejorando el rendimiento con listas grandes.
 *
 * 2. **Optimización de renderizado**:
 *    - ListView.builder evita el renderizado completo del feed en cada rebuild.
 *    - Solo reconstruye elementos visibles, reduciendo el uso de CPU y memoria.
 *
 * 3. **Reducción de rebuilds totales con setState**:
 *    - El setState ahora afecta mínimamente gracias a ListView.builder.
 *    - Lógica de carga separada en cargarMas() con manejo de estado local (loading, errorMessage).
 *
 * 4. **Separación de widgets (modularización)**:
 *    - Creado PostItem como widget separado para cada post.
 *    - Agregados LoadingIndicator y ErrorMessageWidget para modularizar el indicador de carga y mensajes de error.
 *    - Beneficio: Código más reutilizable, mantenible y fácil de probar.
 *
 * 5. **Control de scroll automático**:
 *    - Agregado ScrollController para manejar el scroll.
 *    - Después de cargar más posts, se anima el scroll al final para mostrar los nuevos elementos.
 *
 * 6. **Manejo de errores**:
 *    - Envolvido cargarMas() en try-catch para capturar excepciones.
 *    - Muestra mensajes de error en la UI usando ErrorMessageWidget.
 *    - Previene cargas múltiples con verificación de 'loading'.
 *
 * 7. **Comentarios y limpieza**:
 *    - Agregados comentarios explicativos en el código para claridad.
 *    - Dispose del ScrollController para evitar memory leaks.
 *
 * Comparado con ejercicio2.dart original:
 * - Original: SingleChildScrollView con Column, rebuild total, sin modularización, sin scroll automático, sin manejo de errores.
 * - Optimizado: ListView.builder, renderizado eficiente, widgets modulares, scroll automático, manejo de errores robusto.
 */

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FeedScreen(),
    );
  }
}

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  List<String> posts = List.generate(100, (i) => "Post $i");
  bool loading = false;
  String? errorMessage; // Nueva variable para almacenar mensajes de error
  final ScrollController _scrollController = ScrollController(); // Controlador para manejar el scroll

  Future<void> cargarMas() async {
    if (loading) return; // Evitar múltiples cargas simultáneas

    setState(() {
      loading = true; 
      errorMessage = null; // Limpiar cualquier mensaje de error previo
    });

    // Simular una carga de datos con un retraso
    try {
      await Future.delayed(const Duration(seconds: 2));
      final newPosts = List.generate(50, (i) => "Post ${posts.length + i}"); // Generar nuevos posts
      setState(() {
        posts.addAll(newPosts); // Agregar nuevos posts a la lista
        loading = false;
      });

      // Desplazar automáticamente al final de la lista después de cargar nuevos posts
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      });
    } catch (e) {
      setState(() {
        loading = false;
        errorMessage = 'Error al cargar más posts: $e'; // Capturar y mostrar el mensaje de error
      });
    }
  }

  // Asegurarse de limpiar el controlador de scroll cuando el widget se destruya  
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("REBUILD TOTAL");

    return Scaffold(
      appBar: AppBar(title: const Text("Feed")),
      body: ListView.builder( // Cambiar a ListView.builder para manejar mejor la carga de posts  
        controller: _scrollController, // Asignar el controlador de scroll al ListView
        itemCount: posts.length + (loading ? 1 : 0) + (errorMessage != null ? 1 : 0),
        itemBuilder: (context, index) {
          if (index < posts.length) {
            return PostItem(post: posts[index]);
          } else if (loading && index == posts.length) {
            return const LoadingIndicator(); // Usar widget modular para el indicador de carga
          } else if (errorMessage != null && index == posts.length + (loading ? 1 : 0)) {
            return ErrorMessageWidget(message: errorMessage!); // Usar widget modular para el mensaje de error
          }
          return const SizedBox.shrink();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: cargarMas,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

// Widget modular para cada post en el feed
class PostItem extends StatelessWidget {
  const PostItem({super.key, required this.post});

  final String post;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      color: Colors.blue.shade100,
      child: Text(post),
    );
  }
}

// Widget modular para el indicador de carga
class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: Center(child: CircularProgressIndicator()),
    );
  }
}

// Widget modular para mostrar mensajes de error
class ErrorMessageWidget extends StatelessWidget {
  const ErrorMessageWidget({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Text(
          message,
          style: const TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}