import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/car_view_model.dart';

class CartScreen extends StatelessWidget { //Pantalla del carrito
  const CartScreen({super.key}); //constructor

  @override
  Widget build(BuildContext context) { //Pantalla del carrito
    //usamos consumer para envolver todo el body y reaccionar a cualquier cambio
    return Scaffold( 
      appBar: AppBar(
        title: const Text('Carrito de Compras'), //Titulo de la pantalla
      ),
      body: Consumer<CarViewModel>( //Escuchar cambios en el ViewModel
        builder: (context, cart, child) {
          //Carrito vacio
          if(cart.items.isEmpty) {
            return const Center( //Mensaje centrado
              child: Text('Carrito Vacio'), //Mensaje de carrito vacio
            );
          }

          //lista reactiva de productos en el carrito
          return Column(
            children: [
              Expanded(
                child: ListView.builder( //Lista de productos en el carrito
                  itemCount: cart.items.length, //Cantidad de productos en el carrito
                  itemBuilder: (context, index) {
                    final item = cart.items[index]; //Obtener el producto actual
                    return ListTile( //Item de la lista
                      title: Text(item.name), //Nombre del producto
                      subtitle: Text('\$${item.price.toStringAsFixed(2)}'), //Precio del producto
                      trailing: IconButton( //Boton para eliminar del carrito
                        icon: const Icon(Icons.remove_circle, color: Colors.red), //Icono de eliminar
                        onPressed: () { //Al presionar el boton
                          //al eliminar un producto detecta el notifyListeners
                          //reconstruye esta lista automaticamente
                          cart.removeProduct(item); //Eliminar el producto del carrito
                        },
                      ),
                    );
                  },
                ),
              ),
              //totalizar el precio de los productos en el carrito
              Container( //Precio total
                padding: const EdgeInsets.all(20.0),
                color: Colors.grey, //Fondo gris
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, //Separar los elementos
                  children: [
                    const Text(
                      'Total:',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      '\$${cart.totalPrice}',
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}