void main() {
  Map<String, dynamic> vehiculo = {};
  vehiculo['marca'] = 'Toyota';
  vehiculo['modelo'] = 'Corolla';
  vehiculo['anio'] = 2020;
  vehiculo['esElectrico'] = false;
  print(vehiculo['modelo']);
  vehiculo['anio'] = 2022;
  vehiculo['color'] = 'Rojo';
  print(vehiculo);
}