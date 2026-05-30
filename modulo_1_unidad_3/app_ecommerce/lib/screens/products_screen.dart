// ================= IMPORTACIONES =================

// Importa los widgets Material de Flutter
import 'package:flutter/material.dart';

// Importa rutas personalizadas para animaciones
import '../routes/custom_routes.dart';

// Importa la pantalla de detalle del producto
import 'product_detail_screen.dart';

// ================= PANTALLA DE PRODUCTOS =================

// StatelessWidget porque la lista de productos no cambia dinámicamente
class ProductsScreen extends StatelessWidget {
  // Categoría seleccionada (recibida desde la pantalla anterior)
  final String category;

  // Constructor que recibe la categoría obligatoriamente
  const ProductsScreen({super.key, required this.category});

  // ================= LISTA DE PRODUCTOS =================
  // Getter que devuelve una lista de productos simulados
  // Cada producto es un Map con id, nombre, precio, icono e descripción
  List<Map<String, dynamic>> get products => [
        {
          'id': 1,
          'name': 'Producto 1',
          'price': 29.99,
          'image': Icons.inventory_2,
          'description': 'Descripción del producto 1',
        },
        {
          'id': 2,
          'name': 'Producto 2',
          'price': 49.99,
          'image': Icons.inventory_2,
          'description': 'Descripción del producto 2',
        },
        {
          'id': 3,
          'name': 'Producto 3',
          'price': 19.99,
          'image': Icons.inventory_2,
          'description': 'Descripción del producto 3',
        },
        {
          'id': 4,
          'name': 'Producto 4',
          'price': 99.99,
          'image': Icons.inventory_2,
          'description': 'Descripción del producto 4',
        },
        {
          'id': 5,
          'name': 'Producto 5',
          'price': 39.99,
          'image': Icons.inventory_2,
          'description': 'Descripción del producto 5',
        },
        {
          'id': 6,
          'name': 'Producto 6',
          'price': 59.99,
          'image': Icons.inventory_2,
          'description': 'Descripción del producto 6',
        },
      ];

  // ================= MÉTODO BUILD =================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior
      appBar: AppBar(
        // Muestra la categoría en el título
        title: Text('Productos - $category'),
        centerTitle: true,
      ),

      // ================= LISTA DE PRODUCTOS =================
      body: ListView.builder(
        // Espaciado interno de la lista
        padding: const EdgeInsets.all(16),

        // Cantidad de productos
        itemCount: products.length,

        // Construye cada tarjeta de producto
        itemBuilder: (context, index) {
          // Obtiene el producto según el índice
          final product = products[index];

          // Retorna la tarjeta del producto
          return _buildProductCard(context, product);
        },
      ),
    );
  }

  // ================= TARJETA DE PRODUCTO =================
  // Widget reutilizable para mostrar un producto en la lista
  Widget _buildProductCard(
    BuildContext context,
    Map<String, dynamic> product,
  ) {
    return GestureDetector(
      // Detecta el toque sobre la tarjeta
      onTap: () {
        // Navega a la pantalla de detalle del producto
        Navigator.push(
          context,
          CustomRoutes.slide(
            ProductDetailScreen(product: product),
          ),
        );
      },

      child: Card(
        margin: const EdgeInsets.only(bottom: 16),
        elevation: 4,

        // Bordes redondeados
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),

        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // ================= IMAGEN DEL PRODUCTO =================
              Container(
                width: 80,
                height: 80,

                decoration: BoxDecoration(
                  color: const Color(0xFF6C63FF).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),

                // Icono del producto
                child: Icon(
                  product['image'],
                  size: 40,
                  color: const Color(0xFF6C63FF),
                ),
              ),

              const SizedBox(width: 16),

              // ================= INFORMACIÓN DEL PRODUCTO =================
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Nombre del producto
                    Text(
                      product['name'],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 4),

                    // Descripción corta
                    Text(
                      product['description'],
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                    ),

                    const SizedBox(height: 8),

                    // Precio del producto
                    Text(
                      '\$${product['price'].toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF6C63FF),
                      ),
                    ),
                  ],
                ),
              ),

              // ================= ICONO DE NAVEGACIÓN =================
              const Icon(
                Icons.arrow_forward_ios,
                color: Color(0xFF6C63FF),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
