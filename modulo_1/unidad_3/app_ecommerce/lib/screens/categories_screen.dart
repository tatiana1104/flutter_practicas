import 'package:flutter/material.dart';
import '../routes/custom_routes.dart';
import 'products_screen.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  // Lista de categorías con sus datos
  final List<Map<String, dynamic>> categories = const [
    {'name': 'Electrónica', 'icon': Icons.devices, 'color': 0xFF2196F3},
    {'name': 'Ropa', 'icon': Icons.checkroom, 'color': 0xFFE91E63},
    {'name': 'Hogar', 'icon': Icons.home, 'color': 0xFFFF9800},
    {'name': 'Deportes', 'icon': Icons.sports_soccer, 'color': 0xFF4CAF50},
    {'name': 'Libros', 'icon': Icons.book, 'color': 0xFF9C27B0},
    {'name': 'Juguetes', 'icon': Icons.toys, 'color': 0xFFFF5722},
    {'name': 'Belleza', 'icon': Icons.face, 'color': 0xFFF06292},
    {'name': 'Alimentos', 'icon': Icons.restaurant, 'color': 0xFF8BC34A},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categorías'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder( // Crea una cuadrícula de elementos
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 columnas
            crossAxisSpacing: 16, // Espacio horizontal entre items
            mainAxisSpacing: 16, // Espacio vertical entre items
            childAspectRatio: 1, // Proporción 1:1 (cuadrado)
          ),
          itemCount: categories.length, // Número de elementos
          itemBuilder: (context, index) { // Construye cada elemento
            final category = categories[index]; // Obtiene la categoría actual
            return _buildCategoryCard( // Retorna la tarjeta
              context,
              name: category['name'], // Accede al nombre
              icon: category['icon'], // Accede al icono
              color: Color(category['color']), // Convierte int a Color
            );
          },
        ),
      ),
    );
  }

  // Método privado que construye cada tarjeta de categoría
  Widget _buildCategoryCard(
    BuildContext context, {
    required String name, // Parámetros nombrados requeridos
    required IconData icon,
    required Color color,
  }) {
    return GestureDetector( // Detecta toques
      onTap: () { // Al tocar
        Navigator.push(
          context,
          CustomRoutes.slide(ProductsScreen(category: name)), // Pasa el nombre
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1), // Color con 10% opacidad
                shape: BoxShape.circle, // Forma circular
              ),
              child: Icon(icon, size: 50, color: color),
            ),
            const SizedBox(height: 12),
            Text(
              name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}