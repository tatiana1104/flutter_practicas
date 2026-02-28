class Producto{
  String nombre;
  double precio;
  int stock;

  Producto({required this.nombre, required this.precio, this.stock = 0});

  void aplicarDescuento(double porcentaje) {
    precio = precio - (precio * porcentaje / 100);
    print('Precio con descuento: $precio');
  }

  bool verificarStock() {
    return stock > 0;
  }

}

void main(){
    var productosAseo = Producto(
      nombre: 'Jabon para el cuerpo', 
      precio: 20,
      stock: 10);

      var productosAseo2 = Producto(
      nombre: 'Crema dental', 
      precio: 5,
      stock: 2);

      print('Nombre: ${productosAseo.nombre}' );
      print('Precio: ${productosAseo.precio}' );
      print('Stock: ${productosAseo.stock}' );
      productosAseo.aplicarDescuento(10); // 10% de descuento
      print(productosAseo.verificarStock());
      
      print('');

      print('Nombre: ${productosAseo2.nombre}' );
      print('Precio: ${productosAseo2.precio}' );
      print('Stock: ${productosAseo2.stock}' );
      productosAseo2.aplicarDescuento(15); // 10% de descuento
      print(productosAseo2.verificarStock());

  }