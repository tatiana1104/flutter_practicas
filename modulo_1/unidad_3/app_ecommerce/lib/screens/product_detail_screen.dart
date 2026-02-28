// ================= IMPORTACIONES =================

// Importa los widgets y componentes Material de Flutter
import 'package:flutter/material.dart';

// Importa rutas personalizadas para animaciones de navegación
import '../routes/custom_routes.dart';

// Importa la pantalla del carrito
import 'cart_screen.dart';

// ================= PANTALLA DE DETALLE DE PRODUCTO =================

// StatelessWidget porque los datos no cambian dentro de esta pantalla
class ProductDetailScreen extends StatelessWidget {
  // Mapa que contiene la información del producto
  // Ejemplo: name, price, description, etc.
  final Map<String, dynamic> product;

  // Constructor que recibe obligatoriamente el producto
  const ProductDetailScreen({super.key, required this.product});

  // ================= MÉTODO BUILD =================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ---------------- APP BAR ----------------
      appBar: AppBar(
        title: const Text('Detalle del Producto'),
        centerTitle: true,

        // Acciones en la parte derecha del AppBar
        actions: [
          IconButton(
            // Icono de favorito
            icon: const Icon(Icons.favorite_border),
            // Acción vacía (podría usarse para marcar como favorito)
            onPressed: () {},
          ),
        ],
      ),

      // ---------------- CUERPO PRINCIPAL ----------------
      // SingleChildScrollView permite hacer scroll si el contenido es grande
      body: SingleChildScrollView(
        child: Column(
          // Hace que los hijos ocupen todo el ancho disponible
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ================= IMAGEN DEL PRODUCTO =================
            Container(
              height: 300,
              // Fondo de color suave
              decoration: BoxDecoration(
                color: const Color(0xFF6C63FF).withOpacity(0.1),
              ),
              // Icono representando la imagen del producto
              child: const Icon(
                Icons.inventory_2,
                size: 120,
                color: Color(0xFF6C63FF),
              ),
            ),

            // ================= INFORMACIÓN DEL PRODUCTO =================
            Padding(
              // Espaciado interno
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // -------- NOMBRE DEL PRODUCTO --------
                  Text(
                    product['name'], // Se obtiene del mapa
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  // -------- PRECIO DEL PRODUCTO --------
                  Text(
                    // Muestra el precio con 2 decimales
                    '\$${product['price'].toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF6C63FF),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // ================= RATING =================
                  Row(
                    children: [
                      // Genera 5 estrellas automáticamente
                      ...List.generate(
                        5,
                        (index) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 24,
                        ),
                      ),

                      const SizedBox(width: 8),

                      // Texto de reseñas
                      Text(
                        '(128 reseñas)',
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // ================= DESCRIPCIÓN =================
                  const Text(
                    'Descripción',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Texto descriptivo del producto
                  Text(
                    product['description'] +
                        '\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. '
                        'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
                        'Ut enim ad minim veniam, quis nostrud exercitation.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                      height: 1.5, // Espaciado entre líneas
                    ),
                  ),

                  const SizedBox(height: 24),

                  // ================= CARACTERÍSTICAS =================
                  const Text(
                    'Características',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Lista de características reutilizando un widget
                  _buildFeatureItem('Envío gratis', Icons.local_shipping),
                  _buildFeatureItem('Garantía de 1 año', Icons.verified_user),
                  _buildFeatureItem('Devolución en 30 días', Icons.replay),
                ],
              ),
            ),
          ],
        ),
      ),

      // ================= BARRA INFERIOR =================
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),

        // Sombra para separar visualmente del contenido
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),

        // Botón principal
        child: ElevatedButton(
          onPressed: () {
            // ---------------- SNACKBAR ----------------
            // Muestra un mensaje flotante
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('Producto agregado al carrito'),
                backgroundColor: const Color(0xFF6C63FF),
                behavior: SnackBarBehavior.floating,

                // Bordes redondeados del SnackBar
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),

                // Acción dentro del SnackBar
                action: SnackBarAction(
                  label: 'VER CARRITO',
                  textColor: Colors.white,
                  onPressed: () {
                    // Navega a la pantalla del carrito
                    Navigator.push(
                      context,
                      CustomRoutes.slide(const CartScreen()),
                    );
                  },
                ),
              ),
            );
          },

          // Estilos del botón
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF6C63FF),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),

          // Contenido del botón
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add_shopping_cart),
              SizedBox(width: 10),
              Text(
                'AGREGAR AL CARRITO',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ================= ITEM DE CARACTERÍSTICA =================

  // Widget reutilizable para mostrar una característica con icono
  Widget _buildFeatureItem(String text, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF6C63FF), size: 20),
          const SizedBox(width: 12),
          Text(
            text,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
