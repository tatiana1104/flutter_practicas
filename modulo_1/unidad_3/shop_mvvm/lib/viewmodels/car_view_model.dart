import 'package:flutter/material.dart';
import '../models/product.dart';


//Extendemos de ChangeNotifier para usar todo lo requerido de Notificacion
class CarViewModel extends ChangeNotifier {

  //Propiedad privada {Encapsulamiento}
  final List<Product> _items = [];

  //Getters - para leer sin romper la seguridad de  la aplicacion
  List<Product> get items => _items;

  //contador de productos en el carrito
  int get count => _items.length;

  //precio total de los productos en el carrito
  double get totalPrice {
    return _items.fold(0.0, (sum, item) => sum + item.price); 
  }

  //Metodo para modificar el estado 
  void addProduct(Product item) {
    _items.add(item); //Agregamos el producto a la lista
    //avisar UI - Grafica que hay cambios
    notifyListeners();
  }

  //Metodo para eliminar un producto del carrito
  void removeProduct(Product item) {
    _items.remove(item); //Eliminamos el producto de la lista
    //avisar UI - Grafica que hay cambios
    notifyListeners();
  }

}