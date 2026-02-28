class Estudiante {
  String nombre;
  int edad;
  String carrera;
  Estudiante({required this.nombre, this.edad = 18, required this.carrera});
  void presentarse() {
    print('Hola, soy $nombre, tengo $edad años y estudio $carrera.');
  }
}
void main() {
  Estudiante estudiante = Estudiante(nombre: 'Carlos', carrera: 'Informática');
  estudiante.presentarse();
}