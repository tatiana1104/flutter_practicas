void main (){
  Map<String, dynamic> usuario = {
    'id' : 1,
    'nombre' : 'Pedro',
    'apellido' : 'Rojas',
    'edad' : 32,
    'estado' : true,
  } ;

  usuario ['edad'] = 33;
  
  print(usuario['edad']);

  usuario['email'] = 'pedro@correo.com';

  print(usuario);
}