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
  Map<String, dynamic> tareaMap = {'id': 1, 'descripcion': 'Comprar leche', 'completada': false};
  Tarea tarea = Tarea.fromMap(tareaMap);
}