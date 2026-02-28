//Crear una clase de vehículo que me imprima 
//la marca, color y kilometraje

class Vehiculo {
  String marca = '';
  String color = '';
  double kilometraje = 0.0;

  void mostrarInfo() {
    print('Marca: $marca');
    print('Color: $color');
    print('Kilometraje: $kilometraje km');
  }
}

void main() {
  Vehiculo miVehiculo = Vehiculo();

  miVehiculo.marca = 'Toyota';
  miVehiculo.color = 'Rojo';
  miVehiculo.kilometraje = 15000.5;

  miVehiculo.mostrarInfo();
}
