// Importa Flutter para construir widgets.
import 'package:flutter/material.dart';

// Pantalla que muestra el detalle del producto y permite cambiar el tema.
// Es Stateless porque no maneja estado interno: recibe todo desde fuera.
class ProductDetailScreen extends StatelessWidget {
  // Función que recibe un booleano para cambiar el tema en el padre.
  final Function(bool) onThemeChanged;

  // Indica si el modo actual es oscuro (true) o claro (false).
  final bool isDarkMode;

  // Constructor que obliga a pasar onThemeChanged e isDarkMode.
  const ProductDetailScreen({
    super.key,
    required this.onThemeChanged,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    // Obtiene el ThemeData actual para usar colores y estilos del tema.
    final theme = Theme.of(context);

    // Devuelve la estructura principal de la pantalla.
    return Scaffold(
      // Barra superior de la app
      appBar: AppBar(
        title: const Text("Detalle del Producto"), // Texto del título
        centerTitle: true, // Centra el título en la AppBar

        // Acciones en la AppBar (a la derecha): aquí colocamos el interruptor.
        actions: [
          // Switch para alternar tema claro/oscuro.
          Switch(
            value: isDarkMode, // Estado actual del switch (true = oscuro)
            onChanged: onThemeChanged, // Llama a la función pasada desde el padre
          ),
        ],
      ),

      // Cuerpo principal de la pantalla que puede desplazarse si el contenido es largo.
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16), // Espacio interior alrededor del contenido
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Alinea los hijos a la izquierda
          children: [
            // Contenedor para la imagen del producto
            Container(
              height: 250, // Alto fijo para mostrar la imagen
              width: double.infinity, // Ocupa todo el ancho disponible
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), // Bordes redondeados
                color: theme.colorScheme.surfaceVariant, // Color de fondo según el tema
                image: const DecorationImage(
                  // Reemplaza "assets/product.jpg" por la ruta real de tu imagen
                  image: AssetImage("assets/product.jpg"), // Imagen del producto
                  fit: BoxFit.cover, // Ajusta la imagen para cubrir todo el contenedor
                ),
              ),
            ),

            const SizedBox(height: 20), // Separador vertical

            // Nombre del producto
            Text(
              "Zapatilla GEL-ROCKET 12", // Texto fijo de ejemplo
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold, // Pone el texto en negrita
              ),
            ),

            const SizedBox(height: 8), // Separador pequeño

            // Precio del producto
            Text(
              "\$99.990", // Precio de ejemplo
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600, // Negrita ligera
                color: theme.colorScheme.primary, // Color principal del tema
              ),
            ),

            const SizedBox(height: 16), // Separador intermedio

            // Descripción del producto
            Text(
              "La zapatilla GEL-ROCKET 12 ofrece un buen equilibrio de estabilidad y flexibilidad para moverte con confianza en la pista​."
              "Esta zapatilla está diseñada con un empeine de gran sujeción que te ayudará a desplazarte con confianza en los movimientos laterales.",
              style: theme.textTheme.bodyLarge, // Estilo estándar del tema
            ),

            const SizedBox(height: 30), // Espacio antes del botón

            // Botón principal para añadir al carrito
            SizedBox(
              width: double.infinity, // El botón ocupa todo el ancho posible
              child: ElevatedButton(
                onPressed: () {
                  // Aquí se pondría la lógica para añadir al carrito.
                  // Por ahora está vacío porque solo queremos la UI.
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14), // Altura del botón
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Bordes redondeados
                  ),
                ),
                child: const Text("Añadir al Carrito"), // Texto del botón
              ),
            ),
          ],
        ),
      ),
    );
  }
}
