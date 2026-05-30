//Crear una lista con 10 estudiantes, donde se genere una nueva lista con los mayores de 15 años
void main() {
  List<Map<String, dynamic>> estudiantes = [
    {'nombre': 'Ana', 'edad': 14},
    {'nombre': 'Luis', 'edad': 16},
    {'nombre': 'María', 'edad': 17},
    {'nombre': 'Pedro', 'edad': 13},
    {'nombre': 'Sofía', 'edad': 15},
    {'nombre': 'Carlos', 'edad': 18},
    {'nombre': 'Lucía', 'edad': 19},
    {'nombre': 'Miguel', 'edad': 12},
    {'nombre': 'Elena', 'edad': 20},
    {'nombre': 'Jorge', 'edad': 14},
  ];

  // Filtrar estudiantes mayores de 15 años
  List<Map<String, dynamic>> mayoresDe15 =
      estudiantes.where((e) => e['edad'] > 15).toList();

  // Imprimir resultados
  print('Estudiantes mayores de 15 años:');
  for (var e in mayoresDe15) {
    print('Nombre: ${e['nombre']}, Edad: ${e['edad']}');
  }
}
