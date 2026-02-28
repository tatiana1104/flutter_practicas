import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; //Importar provider para usar el viewModel
import 'viewmodels/car_view_model.dart';
import 'views/catalog_screen.dart';

void main() {
  runApp( 

    //inyectamos el viewModel antes que arranque la parte visual
    ChangeNotifierProvider( 
      create: (context) => CarViewModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {

  const MyApp({super.key}); //constructor
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //Quitar banner debug
      title: 'Shop', //Titulo de la aplicacion
      theme: ThemeData( //Tema de la aplicacion
        primarySwatch: Colors.green,
      ),
      home: CatalogScreen(),
    );
  }
}