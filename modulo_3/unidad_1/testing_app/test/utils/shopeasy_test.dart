import 'package:flutter_test/flutter_test.dart';
import 'package:testing_app/utils/shopeasy.dart';

void main() {

  // ------- Pruebas para el servicio de usuario -------
  final servicioUsuario = ServicioUsuario();
  
  test('Login exitoso', () {
    final resultado = servicioUsuario.login("user@mail.com", "123456");
    expect(resultado, true);
  });

  
  test('Login fallido', () {
    final resultado = servicioUsuario.login("user@mail.com", "wrongpassword");
    expect(resultado, false);
  });

  // ------- Pruebas para el carrito de compras -------
  final carrito = Carrito();

  test('Agregar producto al carrito', () {
    final producto = Producto("Producto A", 50.0);
    carrito.agregarProducto(producto);
    expect(carrito.obtenerProductos(), contains(producto));
  });

  test('Eliminar producto del carrito', () {
    final producto = Producto("Producto B", 30.0);
    carrito.agregarProducto(producto);
    carrito.eliminarProducto(producto);
    expect(carrito.obtenerProductos(), isNot(contains(producto)));
  });

  test('Calcular total del carrito con descuento', () {
    final producto1 = Producto("Producto C", 80.0);
    carrito.agregarProducto(producto1);
    
    final total = carrito.calcularTotal();
    
    // El total sin descuento sería 130, con un descuento del 10% sería 117, y con IVA del 19% sería 139.23
    expect(total, closeTo(139.23, 0.01)); // Verificar que el total calculado esté cerca de 139.23 con una tolerancia de 0.01
  });



}