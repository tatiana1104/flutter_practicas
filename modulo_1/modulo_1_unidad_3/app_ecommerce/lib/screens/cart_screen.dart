// ================= IMPORTACIONES =================

// Importa el paquete principal de Flutter con widgets Material Design
import 'package:flutter/material.dart';

// Importa rutas personalizadas para manejar animaciones de navegación
import '../routes/custom_routes.dart';

// Importa la pantalla de checkout (pago)
import 'checkout_screen.dart';

// ================= CLASE PRINCIPAL =================

// CartScreen representa la pantalla del carrito de compras
// Extiende StatelessWidget porque el contenido no cambia dinámicamente
class CartScreen extends StatelessWidget {
  // Constructor constante (mejora el rendimiento)
  const CartScreen({super.key});

  // ================= DATOS DEL CARRITO =================

  // Lista de productos del carrito
  // Cada producto es un Map con nombre, precio y cantidad
  // dynamic permite manejar distintos tipos de datos
  final List<Map<String, dynamic>> cartItems = const [
    {'name': 'Producto 1', 'price': 29.99, 'quantity': 2},
    {'name': 'Producto 2', 'price': 49.99, 'quantity': 1},
    {'name': 'Producto 3', 'price': 19.99, 'quantity': 3},
  ];

  // ================= CÁLCULO DEL TOTAL =================

  // Getter que calcula el total del carrito
  // Se ejecuta cada vez que se accede a "total"
  double get total {
    // fold recorre la lista y acumula un valor
    return cartItems.fold(
      0, // Valor inicial del acumulador
      (sum, item) =>
          // A la suma se le agrega precio * cantidad de cada producto
          sum + (item['price'] * item['quantity']),
    );
  }

  // ================= MÉTODO BUILD =================

  // build construye la interfaz visual de la pantalla
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold proporciona la estructura básica de la pantalla
      appBar: AppBar(
        // Título de la barra superior
        title: const Text('Carrito de Compras'),
        // Centra el título
        centerTitle: true,
      ),

      // ================= CONTENIDO PRINCIPAL =================

      // Operador ternario:
      // Si el carrito está vacío → muestra vista vacía
      // Si tiene productos → muestra la lista
      body: cartItems.isEmpty
          ? _buildEmptyCart()
          : Column(
              children: [
                // ================= LISTA DE PRODUCTOS =================

                // Expanded permite que la lista use el espacio disponible
                Expanded(
                  child: ListView.builder(
                    // Espaciado interno de la lista
                    padding: const EdgeInsets.all(16),

                    // Número de elementos a mostrar
                    itemCount: cartItems.length,

                    // Construye cada elemento de la lista
                    itemBuilder: (context, index) {
                      // Obtiene el producto según el índice
                      final item = cartItems[index];

                      // Devuelve la tarjeta del producto
                      return _buildCartItem(item);
                    },
                  ),
                ),

                // ================= RESUMEN DE COMPRA =================

                // Contenedor fijo en la parte inferior
                Container(
                  padding: const EdgeInsets.all(24),

                  // Decoración visual del contenedor
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      // Sombra superior
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 10,
                        offset: const Offset(0, -5),
                      ),
                    ],
                    // Bordes redondeados arriba
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(30),
                    ),
                  ),

                  child: Column(
                    children: [
                      // ================= SUBTOTAL =================
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Subtotal',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                          // Muestra el subtotal con 2 decimales
                          Text('\$${total.toStringAsFixed(2)}'),
                        ],
                      ),

                      const SizedBox(height: 8),

                      // ================= ENVÍO =================
                      const Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Envío',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            'Gratis',
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      const Divider(height: 24),

                      // ================= TOTAL FINAL =================
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Total',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '\$${total.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF6C63FF),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // ================= BOTÓN CHECKOUT =================
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          // Acción al presionar el botón
                          onPressed: () {
                            // Navega a la pantalla de checkout
                            Navigator.push(
                              context,
                              CustomRoutes.slideUp(
                                CheckoutScreen(total: total),
                              ),
                            );
                          },

                          // Estilos del botón
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color(0xFF6C63FF),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              vertical: 16,
                            ),
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
                              Icon(Icons.payment),
                              SizedBox(width: 10),
                              Text(
                                'FINALIZAR COMPRA',
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
              ],
            ),
    );
  }

  // ================= CARRITO VACÍO =================

  // Widget que se muestra cuando no hay productos
  Widget _buildEmptyCart() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart_outlined,
            size: 100,
            color: Colors.grey,
          ),
          SizedBox(height: 20),
          Text(
            'Tu carrito está vacío',
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  // ================= ITEM DEL CARRITO =================

  // Construye la tarjeta visual de un producto
  Widget _buildCartItem(Map<String, dynamic> item) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // Icono del producto
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color:
                    const Color(0xFF6C63FF).withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.inventory_2,
                color: Color(0xFF6C63FF),
                size: 35,
              ),
            ),

            const SizedBox(width: 16),

            // Información del producto
            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    item['name'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '\$${item['price'].toStringAsFixed(2)}',
                    style: const TextStyle(
                      color: Color(0xFF6C63FF),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            // Cantidad del producto
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 6,
              ),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'x${item['quantity']}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
