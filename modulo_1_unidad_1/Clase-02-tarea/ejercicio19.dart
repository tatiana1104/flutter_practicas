class Producto {
  final String nombre;
  final double precio;
  final int stock;
  Producto({required this.nombre, required this.precio, required this.stock});
  Producto.fromMap(Map<String, dynamic> map)
      : nombre = map['nombre'],
        precio = map['precio'],
        stock = map['stock'];
}
List<String> obtenerNombresProductosCarosEnStock(List<Map<String, dynamic>> inventario) {
  return inventario
      .map((map) => Producto.fromMap(map))
      .where((producto) => producto.stock > 0)
      .where((producto) => producto.precio > 100.0)
      .map((producto) => producto.nombre)
      .toList();
}
void main() {
  var jsonInventario = [
    {'nombre': 'Laptop', 'precio': 1500.0, 'stock': 10},
    {'nombre': 'Mouse', 'precio': 45.0, 'stock': 0},
    {'nombre': 'Teclado', 'precio': 120.0, 'stock': 50},
    {'nombre': 'Monitor', 'precio': 350.0, 'stock': 5},
  ];
  List<String> nombres = obtenerNombresProductosCarosEnStock(jsonInventario);
  print(nombres);
}