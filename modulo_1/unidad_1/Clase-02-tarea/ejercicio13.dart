class Tarea {
  int id;
  String descripcion;
  bool completada;
  Tarea({required this.id, required this.descripcion, required this.completada});
  Tarea.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        descripcion = map['descripcion'],
        completada = map['completada'];
}
void main() {
  List<Map<String, dynamic>> tareasJson = [
    {'id': 1, 'descripcion': 'Comprar leche', 'completada': false},
    {'id': 2, 'descripcion': 'Hacer ejercicio', 'completada': true},
    {'id': 3, 'descripcion': 'Estudiar Dart', 'completada': false},
  ];
  List<Tarea> tareas = tareasJson.map((map) => Tarea.fromMap(map)).toList();
  List<Tarea> tareasPendientes = tareas.where((tarea) => !tarea.completada).toList();
  print(tareasPendientes.length);
}