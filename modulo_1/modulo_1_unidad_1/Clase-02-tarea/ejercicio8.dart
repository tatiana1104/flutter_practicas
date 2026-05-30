class Estudiante {
  String nombre;
  int edad;
  String carrera;
  Estudiante(this.nombre, this.edad, this.carrera);
  void presentarse() {
    print('Hola, soy $nombre, tengo $edad años y estudio $carrera.');
  }
}
void main() {
  Estudiante estudiante = Estudiante('Ana', 22, 'Medicina');
  estudiante.presentarse();
}