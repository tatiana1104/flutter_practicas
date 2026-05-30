// ================= IMPORTACIONES =================

// Importa los widgets Material de Flutter
import 'package:flutter/material.dart';

// Importa rutas personalizadas para animaciones
import '../routes/custom_routes.dart';

// Importa la pantalla de categorías
import 'categories_screen.dart';

// Importa la pantalla del carrito
import 'cart_screen.dart';

// ================= PANTALLA PRINCIPAL (HOME) =================

// StatelessWidget porque la pantalla no maneja estado interno
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // ================= MÉTODO BUILD =================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ---------------- APP BAR ----------------
      appBar: AppBar(
        // Título de la app
        title: const Text('ShopMaster'),

        // Centra el título
        centerTitle: true,

        // Evita que aparezca el botón de retroceso
        automaticallyImplyLeading: false,

        // Acciones del AppBar (lado derecho)
        actions: [
          IconButton(
            // Icono del carrito
            icon: const Icon(Icons.shopping_cart),

            // Navega a la pantalla del carrito
            onPressed: () {
              Navigator.push(
                context,
                CustomRoutes.slide(const CartScreen()),
              );
            },
          ),
        ],
      ),

      // ---------------- CUERPO PRINCIPAL ----------------
      // SingleChildScrollView permite hacer scroll vertical
      body: SingleChildScrollView(
        child: Column(
          // Estira los widgets horizontalmente
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ================= BANNER PRINCIPAL =================
            Container(
              height: 200,
              margin: const EdgeInsets.all(16),

              // Decoración visual del banner
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),

                // Gradiente de fondo
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF6C63FF),
                    Color(0xFFFF6584),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),

                // Sombra para efecto de elevación
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF6C63FF).withOpacity(0.4),
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),

              // Stack permite superponer widgets
              child: const Stack(
                children: [
                  // Icono decorativo en el fondo
                  Positioned(
                    right: 20,
                    top: 20,
                    child: Icon(
                      Icons.local_offer,
                      size: 100,
                      color: Colors.white24,
                    ),
                  ),

                  // Texto del banner
                  Padding(
                    padding: EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '¡Ofertas Especiales!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Hasta 50% de descuento',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ================= ACCIONES RÁPIDAS =================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  // Tarjeta de Categorías
                  Expanded(
                    child: _buildActionCard(
                      context,
                      icon: Icons.category,
                      title: 'Categorías',
                      color: const Color(0xFF6C63FF),
                      onTap: () {
                        Navigator.push(
                          context,
                          CustomRoutes.slide(
                            const CategoriesScreen(),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(width: 16),

                  // Tarjeta del Carrito
                  Expanded(
                    child: _buildActionCard(
                      context,
                      icon: Icons.shopping_cart,
                      title: 'Carrito',
                      color: const Color(0xFFFF6584),
                      onTap: () {
                        Navigator.push(
                          context,
                          CustomRoutes.slide(
                            const CartScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // ================= TÍTULO DE SECCIÓN =================
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Explora nuestras categorías',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 16),

            // ================= PREVIEW DE CATEGORÍAS =================
            SizedBox(
              height: 120,

              // ListView horizontal
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildCategoryPreview(
                      'Electrónica',
                      Icons.devices,
                      Colors.blue),
                  _buildCategoryPreview(
                      'Ropa',
                      Icons.checkroom,
                      Colors.pink),
                  _buildCategoryPreview(
                      'Hogar',
                      Icons.home,
                      Colors.orange),
                  _buildCategoryPreview(
                      'Deportes',
                      Icons.sports_soccer,
                      Colors.green),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // ================= BOTÓN PRINCIPAL =================
            Padding(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                // Navega a la pantalla de categorías
                onPressed: () {
                  Navigator.push(
                    context,
                    CustomRoutes.slide(
                      const CategoriesScreen(),
                    ),
                  );
                },

                // Estilos del botón
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color(0xFF6C63FF),
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(15),
                  ),
                ),

                // Contenido del botón
                child: const Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center,
                  children: [
                    Icon(Icons.category),
                    SizedBox(width: 10),
                    Text(
                      'VER CATEGORÍAS',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ================= TARJETA DE ACCIÓN =================
  // Widget reutilizable para botones grandes (Categorías / Carrito)
  Widget _buildActionCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      // Detecta toques
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),

        // Decoración visual
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: color.withOpacity(0.3),
          ),
        ),

        // Contenido de la tarjeta
        child: Column(
          children: [
            Icon(icon, size: 40, color: color),
            const SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ================= PREVIEW DE CATEGORÍA =================
  // Widget pequeño para mostrar categorías en horizontal
  Widget _buildCategoryPreview(
      String name, IconData icon, Color color) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 12),

      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: color),
          const SizedBox(height: 8),
          Text(
            name,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
