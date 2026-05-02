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
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(1000, (index) {
                  print('Render item $index');
                  return Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(10),
                    child: Text('Item $index'),
                  );
                }),
              ),
            ),
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
