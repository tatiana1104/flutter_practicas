// ================= IMPORTACIONES =================

// Importa los widgets Material de Flutter
import 'package:flutter/material.dart';

// Importa la pantalla principal (Home)
import 'home_screen.dart';

// ================= PANTALLA CHECKOUT =================

// StatefulWidget porque el contenido cambia
// (cuando el pedido se confirma)
class CheckoutScreen extends StatefulWidget {
  // Total recibido desde el carrito
  final double total;

  // Constructor que recibe el total obligatoriamente
  const CheckoutScreen({super.key, required this.total});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

// ================= ESTADO DEL CHECKOUT =================
class _CheckoutScreenState extends State<CheckoutScreen> {
  // Controla si el pedido ya fue confirmado
  bool _orderConfirmed = false;

  // ================= MÉTODO BUILD =================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior
      appBar: AppBar(
        title: const Text('Checkout'),
        centerTitle: true,
      ),

      // Si el pedido está confirmado → vista de éxito
      // Si no → formulario de checkout
      body: _orderConfirmed
          ? _buildSuccessView(context)
          : _buildCheckoutForm(context),
    );
  }

  // ================= FORMULARIO DE CHECKOUT =================
  Widget _buildCheckoutForm(BuildContext context) {
    return SingleChildScrollView(
      // Permite scroll si el contenido es largo
      padding: const EdgeInsets.all(24),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // ================= RESUMEN DEL PEDIDO =================
          Container(
            padding: const EdgeInsets.all(20),

            // Fondo con color suave
            decoration: BoxDecoration(
              color: const Color(0xFF6C63FF).withOpacity(0.1),
              borderRadius: BorderRadius.circular(15),
            ),

            child: Column(
              children: [
                // Icono decorativo
                const Icon(
                  Icons.receipt_long,
                  size: 50,
                  color: Color(0xFF6C63FF),
                ),

                const SizedBox(height: 16),

                const Text(
                  'Resumen del Pedido',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 16),

                // Filas con información del pedido
                _buildSummaryRow(
                  'Productos (3)',
                  '\$${widget.total.toStringAsFixed(2)}',
                ),
                _buildSummaryRow('Envío', 'Gratis'),
                _buildSummaryRow(
                  'Impuestos',
                  '\$${(widget.total * 0.16).toStringAsFixed(2)}',
                ),

                const Divider(height: 24),

                // Total final a pagar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total a pagar',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      // Total + impuestos
                      '\$${(widget.total * 1.16).toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF6C63FF),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // ================= INFORMACIÓN DE ENVÍO =================
          const Text(
            'Información de Envío',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 16),

          // Campos de texto para datos del usuario
          _buildTextField('Nombre completo', Icons.person),
          _buildTextField('Dirección', Icons.location_on),
          _buildTextField('Ciudad', Icons.location_city),
          _buildTextField(
              'Código postal', Icons.markunread_mailbox),
          _buildTextField('Teléfono', Icons.phone),

          const SizedBox(height: 24),

          // ================= MÉTODO DE PAGO =================
          const Text(
            'Método de Pago',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 16),

          // Opciones de pago (una marcada como seleccionada)
          _buildPaymentOption(
              'Tarjeta de crédito', Icons.credit_card, true),
          _buildPaymentOption(
              'PayPal', Icons.account_balance_wallet, false),
          _buildPaymentOption(
              'Pago contra entrega', Icons.local_shipping, false),

          const SizedBox(height: 30),

          // ================= BOTÓN CONFIRMAR PEDIDO =================
          ElevatedButton(
            onPressed: () {
              // Cambia el estado a confirmado
              setState(() {
                _orderConfirmed = true;
              });
            },

            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF6C63FF),
              foregroundColor: Colors.white,
              padding:
                  const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),

            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.check_circle),
                SizedBox(width: 10),
                Text(
                  'CONFIRMAR PEDIDO',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ================= VISTA DE ÉXITO =================
  Widget _buildSuccessView(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icono de éxito
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check_circle,
                size: 100,
                color: Colors.green,
              ),
            ),

            const SizedBox(height: 32),

            const Text(
              '¡Pedido Confirmado!',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),

            const SizedBox(height: 16),

            // Mensaje de confirmación
            Text(
              'Tu pedido ha sido procesado exitosamente.\n'
              'Recibirás un correo con los detalles.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
                height: 1.5,
              ),
            ),

            const SizedBox(height: 16),

            // Número de orden
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Column(
                children: [
                  Text(
                    'Número de orden',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '#ORD-2026-001234',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF6C63FF),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // Botón para volver al inicio
            ElevatedButton(
              onPressed: () {
                // Elimina todas las pantallas anteriores
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const HomeScreen()),
                  (route) => false,
                );
              },

              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6C63FF),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                    horizontal: 40, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),

              child: const Text(
                'VOLVER AL INICIO',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ================= FILA DE RESUMEN =================
  // Widget reutilizable para mostrar etiqueta + valor
  Widget _buildSummaryRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: const TextStyle(color: Colors.grey)),
          Text(value),
        ],
      ),
    );
  }

  // ================= CAMPO DE TEXTO =================
  // Widget reutilizable para inputs del formulario
  Widget _buildTextField(String label, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          prefixIcon:
              Icon(icon, color: const Color(0xFF6C63FF)),

          // Borde normal
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),

          // Borde cuando el campo está activo
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Color(0xFF6C63FF),
              width: 2,
            ),
          ),
        ),
      ),
    );
  }

  // ================= OPCIÓN DE PAGO =================
  // Muestra una opción de pago con selección visual
  Widget _buildPaymentOption(
      String title, IconData icon, bool selected) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),

      decoration: BoxDecoration(
        border: Border.all(
          color: selected
              ? const Color(0xFF6C63FF)
              : Colors.grey[300]!,
          width: selected ? 2 : 1,
        ),
        borderRadius: BorderRadius.circular(12),
      ),

      child: ListTile(
        leading:
            Icon(icon, color: const Color(0xFF6C63FF)),
        title: Text(title),

        // Muestra check si está seleccionada
        trailing: selected
            ? const Icon(Icons.check_circle,
                color: Color(0xFF6C63FF))
            : null,
      ),
    );
  }
}
