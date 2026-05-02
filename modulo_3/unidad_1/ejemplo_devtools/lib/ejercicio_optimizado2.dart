import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// 🔹 App principal optimizada
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductScreen(),
    );
  }
}

// 🔹 Pantalla principal
class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<String> productos = List.generate(50, (index) => "Producto $index");

  bool isLoading = false;

  // 🔹 Simulación de carga de datos (API falsa)
  Future<void> cargarMasProductos() async {
    if (isLoading) return;

    setState(() {
      isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    List<String> nuevos = List.generate(
      20,
      (index) => "Producto ${productos.length + index}",
    );

    setState(() {
      productos.addAll(nuevos);
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("REBUILD GENERAL");

    return Scaffold(
      appBar: AppBar(
        title: const Text("Productos Optimizados"),
      ),
      body: Column(
        children: [
          // 🔹 Lista optimizada
          Expanded(
            child: ListView.builder(
              itemCount: productos.length + 1,
              itemBuilder: (context, index) {
                // 🔹 Loader al final de la lista
                if (index == productos.length) {
                  return isLoading
                      ? const Padding(
                          padding: EdgeInsets.all(16),
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : const SizedBox();
                }

                return RepaintBoundary(
                  child: ProductItem(
                    key: ValueKey(productos[index]),
                    nombre: productos[index],
                  ),
                );
              },
            ),
          ),
        ],
      ),

      // 🔹 Botón para cargar más productos
      floatingActionButton: FloatingActionButton(
        onPressed: cargarMasProductos,
        child: const Icon(Icons.add),
      ),
    );
  }
}

// 🔹 Widget independiente optimizado
class ProductItem extends StatelessWidget {
  final String nombre;

  const ProductItem({
    super.key,
    required this.nombre,
  });

  @override
  Widget build(BuildContext context) {
    print("Render $nombre");

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.green.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        nombre,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}