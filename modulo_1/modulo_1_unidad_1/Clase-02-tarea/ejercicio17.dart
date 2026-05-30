class Producto {
  final String nombre;
  final double precio;
  const Producto({required this.nombre, required this.precio});
}
class CarritoDeCompras {
  List<Producto> _productos = [];
  void agregarProducto(String nombre, double precio) {
    _productos.add(Producto(nombre: nombre, precio: precio));
  }
  double calcularTotal() {
    return _productos.fold(0.0, (total, producto) => total + producto.precio);
  }
  List<Producto> get productos => _productos;
}
void main() {
  CarritoDeCompras carrito = CarritoDeCompras();
  carrito.agregarProducto('Laptop', 1000.0);
  carrito.agregarProducto('Mouse', 50.0);
  print(carrito.calcularTotal());
}