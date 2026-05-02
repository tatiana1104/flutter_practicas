import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Lenta',
      debugShowCheckedModeBanner: false,
      home: const AppLenta(),
    );
  }
}

class AppLenta extends StatefulWidget{
  const AppLenta({super.key});

  @override
  State<AppLenta> createState() => _AppLentaState();
}

class _AppLentaState extends State<AppLenta> {
  int contador = 0;
  @override
  Widget build(BuildContext context) {
    print('REBUIL GENERAL');

    return Scaffold(
      appBar: AppBar(
        title: const Text('App Lenta'),
      ),
      body: Column(
        children: [
          Text('Contador: $contador'),
          Expanded(
            child: ListView.builder(
              itemCount: 1000,
              itemBuilder: (context, index) {
                return RepaintBoundary(
                  child: ItemWidget(
                    key: ValueKey(index),
                    index: index,
                  ),
                );
              },
            )
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            contador++;
          });
        },
      ),
    );
  }
}

class ItemWidget extends StatelessWidget {
  final int index;

  const ItemWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    print('render item $index');
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.green.shade100,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Text(
        'Item $index',
        style: const TextStyle(fontSize: 16.0),
      ),
    );
    
  }
}
