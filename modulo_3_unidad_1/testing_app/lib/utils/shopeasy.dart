class ServicioUsuario {
  final String _email = "user@mail.com";
  final String _password = "123456";

//metodo para validar el login
  bool login(String email, String password) {
    if (email == _email && password == _password) {
      return true;
    } else {
      return false;
    }
  }
}

class Producto{
  String nombre;
  double precio;

  Producto(this.nombre, this.precio); //constructor para inicializar los atributos
}

class Carrito {
  List<Producto> productos = []; //lista para almacenar los productos agregados al carrito

  //metodo para agregar un producto al carrito
  void agregarProducto(Producto producto) {
    productos.add(producto);
  }

  //metodo para eliminar un producto del carrito
  void eliminarProducto(Producto producto) {
    productos.remove(producto);
  }

  //metodo para calcular el total del carrito
  double calcularTotal() {
    double total = 0; //variable para almacenar el total del carrito

    //calcular el total sumando el precio de cada producto
    for (var producto in productos) {
      total += producto.precio;
    }

    //aplicar un descuento del 10% si el total es mayor a 100
    if (total > 100) {
      total = total * 0.9; //se queda con el 90% del valor
    }

    //IVA 19%
    total = total * 1.19; //se queda con el 100% del valor + 19% del IVA

    return total;
  }

  //retorna la lista de productos en el carrito
  List<Producto> obtenerProductos() {
    return productos; 
  }
} 