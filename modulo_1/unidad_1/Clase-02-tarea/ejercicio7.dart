class Estudiante {
  String nombre;
  int edad;
  String carrera;
  Estudiante() : nombre = 'Sin nombre', edad = 0, carrera = 'Sin carrera';
  void presentarse() {
    print('Hola, soy $nombre, tengo $edad años y estudio $carrera.');
  }
}
void main() {
  Estudiante estudiante = Estudiante();
  estudiante.nombre = 'Juan';
  estudiante.edad = 20;
  estudiante.carrera = 'Ingeniería';
  estudiante.presentarse();
}