//Crea una clase llamada estudiante.
//Añádele dos atributos: String nombre y int edad.
//Añádele un método void printProfile() que imprima en consola algo como: "Nombre: [name], Edad: [age]".
//En tu main, crea una instancia (un objeto) de Student, dale valores a sus atributos y llama al método printProfile().

class Estudiante {
  String nombre = '';
  int edad = 0;

  void printProfile() {
    print('Nombre: $nombre, Edad: $edad');
  }
}

void main() {
  Estudiante estudiante1 = Estudiante();
  estudiante1.nombre = 'Carlos';
  estudiante1.edad = 21;
  estudiante1.printProfile();
}
