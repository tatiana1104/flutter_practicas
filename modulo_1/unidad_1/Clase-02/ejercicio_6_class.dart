//Crear una clase de productos: 
//Nombre
//Descripción
//Precio
//Stock 
//Aplique descuento sobre el precio de venta
//Disga si tiene stock o si es > 0

class Producto {
  String nombre = '';
  String descripcion = '';
  double precio = 0.0;
  int stock = 0;

  void aplicarDescuento(double porcentaje) {
    precio = precio - (precio * porcentaje / 100);
    print('Precio con descuento: $precio');
  }

  bool verificarStock() {
    return stock > 10;
  }

  void mostrarInfo() {
    print('Nombre: $nombre');
    print('Descripción: $descripcion');
    print('Precio: $precio');
    print('Stock: $stock');
  }
}

void main() {
  Producto producto1 = Producto();

  producto1.nombre = 'Laptop';
  producto1.descripcion = 'Portátil 15 pulgadas';
  producto1.precio = 1200.0;
  producto1.stock = 5;

  producto1.mostrarInfo();
  producto1.aplicarDescuento(10); // 10% de descuento
  producto1.verificarStock();
}
