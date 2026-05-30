//POO

//definimos la clase
class Persona {
  //atributos
  String nombre ='';
  int edad = 0;
  String email = '';

  bool mayoredad() {
    return edad > 18;
  }
}

void main(){
  var usuario = Persona();
  usuario.nombre = 'Maria Perez';
  usuario.edad = 15;
  usuario.email = 'maria@correo.com';

  print(usuario.nombre);
  print(usuario.mayoredad());
}