import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; //Importar provider para usar el viewModel
import '../models/product.dart';
import '../viewmodels/car_view_model.dart';
import '../views/cart_screen.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //simular algunos productos 
    final products = [
      Product(id: '1', name: 'Curso Flutter', price: 200.00),
      Product(id: '2', name: 'Curso de Python', price: 250.000),
      Product(id: '3', name: 'Curso de Java', price: 400.000),
      Product(id: '4', name: 'Curso de Base de Datos', price: 300.0000),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cursos de Programación'),
        actions: [ //Boton para ir al carrito
          IconButton( 
            icon: const Icon(Icons.shopping_cart), //Icono de carrito
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CartScreen())), // Navegar a la pantalla del carrito directamente
          ),

          // espacio se redibuja los cambios en el carrito
          Padding(
            padding: const EdgeInsets.only(right: 20.0, top: 15), //Espacio a la derecha
            child: Consumer<CarViewModel>( //Escuchar cambios en el ViewModel
              builder: (context, cart, child) { //Obtener el carrito
                return Text(
                  '${cart.count}', //Mostrar la cantidad de productos en el carrito
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                );
              },
            ),
          ),
        ],
      ),
      body: ListView.builder( //Lista de productos
        itemCount: products.length, //Cantidad de productos
        itemBuilder: (context, index) { //Construir cada item de la lista
          final product = products[index]; //Obtener el producto actual
          return ListTile( //Item de la lista
            title: Text(product.name), //Nombre del producto
            subtitle: Text('\$${product.price.toStringAsFixed(2)}'), //Precio del producto
            trailing: IconButton( //Boton para agregar al carrito
              icon: const Icon(Icons.add_circle), //Icono de agregar
              onPressed: () { //Al presionar el boton
                //accedemos al metodo sin escuchar cambios (false)
                context.read<CarViewModel>().addProduct(product); //Agregar el producto al carrito
                ScaffoldMessenger.of(context).showSnackBar( //Mostrar mensaje de confirmacion
                  const SnackBar(content: Text('Agregado'), duration: Duration(milliseconds: 500),), //Mensaje breve
                );
              },
            ),
          );
        },
      ),
    );
  }
}