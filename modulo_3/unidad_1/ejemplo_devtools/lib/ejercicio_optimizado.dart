import 'package:flutter/material.dart';

/*
 * Optimizaciones realizadas en ejercicio_optimizado.dart:
 *
 * Comparado con ejercicio.dart original:
 * - Original: Usaba SingleChildScrollView con Column, lo que renderizaba todos los 500 productos a la vez,
 *   causando rebuilds completos en cada setState y pobre rendimiento para listas grandes.
 *
 * Optimizaciones aplicadas:
 * 1. **Reemplazo de SingleChildScrollView por ListView.builder**:
 *    - Cambiado para usar ListView.builder, que renderiza solo los elementos visibles (lazy loading).
 *    - Beneficio: Mejor rendimiento y uso eficiente de memoria para listas grandes.
 *
 * 2. **Optimización de renderizado**:
 *    - Evita el renderizado completo de la lista en cada rebuild, solo reconstruye elementos visibles.
 *
 * 3. **Reducción de rebuilds con setState**:
 *    - setState ahora afecta mínimamente gracias a ListView.builder.
 *
 * 4. **Separación de widgets (modularización)**:
 *    - Creado ProductItem como widget separado para cada producto.
 *    - Beneficio: Código más reutilizable, mantenible y fácil de probar.
 *
 * 5. **Comentarios y limpieza**:
 *    - Agregados comentarios explicativos para claridad.
 */

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ProductScreen(),
    );
  }
}

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<String> productos = List.generate(500, (index) => "Producto $index");

  @override
  Widget build(BuildContext context) {
    print("REBUILD COMPLETO");

    return Scaffold(
      appBar: AppBar(title: const Text("Productos")),
      body: ListView.builder( // Usar ListView.builder para renderizado eficiente
        itemCount: productos.length,
        itemBuilder: (context, index) {
          return ProductItem(producto: productos[index]); // Usar widget modular para cada producto
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            productos.add("Producto nuevo ${productos.length}");
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

// Widget modular para cada producto
class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.producto});

  final String producto;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(5),
      color: Colors.blue.shade100,
      child: Text(producto),
    );
  }
}