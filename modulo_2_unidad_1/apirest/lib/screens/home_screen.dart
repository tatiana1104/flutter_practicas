import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/product.dart';
import 'create_product_screen.dart';

class HomeScreen extends StatelessWidget {
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('catalog Products'),
      ),
      body: FutureBuilder<List<Product>>( //FutureBuilder para manejar la carga de datos asincrona
        future: apiService.fetchProducts(), //llamamos al método para obtener los productos
        builder: (context, snapshot) { //snapshot contiene el estado de la petición y los datos

          //caso 1 - Cargando datos
          if (snapshot.connectionState == ConnectionState.waiting) { //mientras esperamos la respuesta de la API
            return Center(child: CircularProgressIndicator()); //mostramos un indicador de carga mientras esperamos la respuesta

          } 
          //caso 2 - Error - sin internet / error del servicio / etc
          else if (snapshot.hasError) { //si ocurre un error durante la petición
            return Center(child: Text('Ocurrio un error: ${snapshot.error}')); //mostramos el mensaje de error si la petición falla
            
          } 

          //caso 3 - Datos cargados correctamente
          else if (snapshot.hasData) { //si la petición es exitosa y hay datos disponibles
            final products = snapshot.data!; //obtenemos la lista de productos del snapshot
            return ListView.builder( //usamos ListView.builder para mostrar la lista de productos
              itemCount: products.length, //el número de elementos en la lista es igual al número de productos
              itemBuilder: (context, index) { //construimos cada elemento de la lista
                final prod = products[index]; //obtenemos el producto actual de la lista
                return Card( //usamos un widget Card para mostrar cada producto de forma atractiva
                  margin: EdgeInsets.all(8), //margen para cada tarjeta
                  child: ListTile( //usamos ListTile para mostrar la información del producto de forma estructurada
                  leading: Image.network(prod.image, width: 60, fit: BoxFit.cover,), //mostramos la imagen del producto usando Image.network
                  title: Text(prod.title, maxLines: 1, overflow: TextOverflow.ellipsis,), //mostramos el título del producto, limitando a una línea y usando ellipsis para indicar texto truncado
                  subtitle: Text('\$${prod.price}', style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),), //mostramos el precio del producto formateado a 2 decimales
                  trailing: const Icon(Icons.arrow_forward_ios) //mostramos un icono de flecha para indicar que se puede hacer clic en el producto para ver más detalles (en una futura implementación
                  ),
                );
              },
            );
          }

          //caso 4 - Sin datos
          return const Center(child: Text('No hay productos disponibles')); //mostramos un mensaje si la lista de productos esta vacia 
        },
      ),
      floatingActionButton: FloatingActionButton( //botón flotante para crear un nuevo producto
        onPressed: () { //al hacer clic en el botón, navegamos a la pantalla de creación de productos
          Navigator.push( //navegamos a la pantalla de creación de productos usando Navigator.push
            context, //contexto actual para la navegación
            MaterialPageRoute(builder: (context) => CreateProductScreen()), //construimos la ruta a la pantalla de creación de productos
          );
        },
        child: Icon(Icons.add), //icono de suma para indicar la acción de agregar un nuevo producto
        tooltip: 'Crear Producto', //tooltip para mostrar al usuario la función del botón
      ),
    );
  }
}