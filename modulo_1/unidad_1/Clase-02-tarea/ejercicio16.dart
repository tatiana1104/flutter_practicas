class Producto {
  final String nombre;
  final double precio;
  const Producto({required this.nombre, required this.precio});
}
class CarritoDeCompras {
  List<Producto> _productos = [];
  void agregarProducto(Producto producto) {
    _productos.add(producto);
  }
  double calcularTotal() {
    double total = 0.0;
    for (Producto producto in _productos) {
      total += producto.precio;
    }
    return total;
  }
  List<Producto> get productos => _productos;
}
void main() {
  CarritoDeCompras carrito = CarritoDeCompras();
  carrito.agregarProducto(Producto(nombre: 'Laptop', precio: 1000.0));
  carrito.agregarProducto(Producto(nombre: 'Mouse', precio: 50.0));
  print(carrito.calcularTotal());
}