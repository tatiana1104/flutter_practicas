//Crear una lista de 20 nombres y realizar el filtro por un 
//nombre en especifico

void main(){
  List<String> nombres = [ 'Ana', 'Luis', 'Carlos', 'Maria', 'Pedro', 
  'Sofia', 'Andres', ' Lucia', 'Juan', 'Camila', 'Jose', 'Valentina',
  'Maria', 'Miguel', 'Johan', 'Keiny', 'Angie', 'Stella', 'Danny',
  'Wilmer'];

  String filtro = 'Maria';

  List<String> resultado = nombres.where((nombre) => 
  nombre  == filtro).toList();

  print(resultado);
}