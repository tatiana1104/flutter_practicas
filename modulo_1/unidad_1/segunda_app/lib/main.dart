import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      //quitamos la cinta debug
      debugShowCheckedModeBanner: false,

      //aqui llamamos al nuevo widget que contendra el scaffold
      home: const MyHomePage(),
    );
    
  }
}

class MyHomePage extends StatelessWidget{
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: 
        Text("Dev senior code", style: TextStyle(fontSize: 24)),
        
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("boton presionado");
        },
        child: const Icon(Icons.add),  
      ),
    );
  }
}