//Crear un mapa con 20 empleados  con salarios en dolares, que filtre los empleados que ganen mas 300 dolares 
//y genere una lista donde muestre el nombre, apellidos, cargo y salario

void main() {
  // Map con 20 empleados
  Map<int, Map<String, dynamic>> empleados = {
    1: {'nombre': 'Juan', 'apellidos': 'Pérez García', 'cargo': 'Desarrollador Senior', 'salario': 450.0},
    2: {'nombre': 'María', 'apellidos': 'González López', 'cargo': 'Diseñadora UX', 'salario': 380.0},
    3: {'nombre': 'Carlos', 'apellidos': 'Rodríguez Sánchez', 'cargo': 'Gerente de Proyectos', 'salario': 550.0},
    4: {'nombre': 'Ana', 'apellidos': 'Martínez Ruiz', 'cargo': 'Asistente Administrativo', 'salario': 250.0},
    5: {'nombre': 'Luis', 'apellidos': 'Hernández Torres', 'cargo': 'Desarrollador Junior', 'salario': 280.0},
    6: {'nombre': 'Carmen', 'apellidos': 'Jiménez Moreno', 'cargo': 'Analista de Datos', 'salario': 420.0},
    7: {'nombre': 'Pedro', 'apellidos': 'Díaz Romero', 'cargo': 'Contador', 'salario': 350.0},
    8: {'nombre': 'Laura', 'apellidos': 'Álvarez Castro', 'cargo': 'Recepcionista', 'salario': 220.0},
    9: {'nombre': 'Miguel', 'apellidos': 'Ramírez Ortiz', 'cargo': 'Arquitecto de Software', 'salario': 600.0},
    10: {'nombre': 'Isabel', 'apellidos': 'Torres Navarro', 'cargo': 'Marketing Manager', 'salario': 480.0},
    11: {'nombre': 'Jorge', 'apellidos': 'Vargas Medina', 'cargo': 'Técnico de Soporte', 'salario': 290.0},
    12: {'nombre': 'Sofía', 'apellidos': 'Ruiz Fernández', 'cargo': 'Product Owner', 'salario': 520.0},
    13: {'nombre': 'Roberto', 'apellidos': 'Castro Gil', 'cargo': 'Practicante', 'salario': 180.0},
    14: {'nombre': 'Elena', 'apellidos': 'Morales Vega', 'cargo': 'DevOps Engineer', 'salario': 470.0},
    15: {'nombre': 'Diego', 'apellidos': 'Ortiz Ramos', 'cargo': 'Vendedor', 'salario': 310.0},
    16: {'nombre': 'Patricia', 'apellidos': 'Gutiérrez Silva', 'cargo': 'Secretaria', 'salario': 240.0},
    17: {'nombre': 'Francisco', 'apellidos': 'Mendoza Reyes', 'cargo': 'QA Tester', 'salario': 340.0},
    18: {'nombre': 'Lucía', 'apellidos': 'Flores Herrera', 'cargo': 'HR Manager', 'salario': 410.0},
    19: {'nombre': 'Antonio', 'apellidos': 'Campos Cortés', 'cargo': 'Limpieza', 'salario': 200.0},
    20: {'nombre': 'Marta', 'apellidos': 'Peña Domínguez', 'cargo': 'Directora General', 'salario': 750.0},
  };

  // Lista para almacenar empleados que ganan más de $300
  List<Map<String, dynamic>> empleadosFiltrados = [];

  // Filtrar empleados con salario mayor a $300
  empleados.forEach((id, empleado) {
    if (empleado['salario'] > 300) {
      empleadosFiltrados.add(empleado);
    }
  });

  // Mostrar resultados
  print('=== EMPLEADOS QUE GANAN MÁS DE \$300 ===\n');
  
  for (var empleado in empleadosFiltrados) {
    print('Nombre: ${empleado['nombre']} ${empleado['apellidos']}');
    print('Cargo: ${empleado['cargo']}');
    print('Salario: \$${empleado['salario']}');
    print('---');
  }
  
  print('\nTotal de empleados filtrados: ${empleadosFiltrados.length}');
}
