import 'package:flutter/material.dart';

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
      body: SingleChildScrollView(
        child: Column(
          children: productos.map((producto) {
            return Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(5),
              color: Colors.blue.shade100,
              child: Text(producto),
            );
          }).toList(),
        ),
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