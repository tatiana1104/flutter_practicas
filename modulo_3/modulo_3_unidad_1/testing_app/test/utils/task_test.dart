import 'package:flutter_test/flutter_test.dart';
import 'package:testing_app/utils/task.dart';

void main() {

  //-------- UserService Tests --------
  final userService = UserService();

  //test para validar el login correcto
  test('Login correcto', (){ 
    expect(userService.login("test@mail.com", "123456"), true);
  });

  //test para validar correo
  test('Email incorrecto', (){
    expect(userService.login("pepito@mail.com", "123456"), false);
  });

  //test para validar contraseña
  test('Password incorrecto', (){
    expect(userService.login("test@mail.com", "654321"), false);
  });

  //-------- TaskService Tests --------
  final taskService = TaskService();

  test('Agregar tarea', (){
    taskService.agregarTask("Tarea 1");
    expect(taskService.obtenerTasks().length, 1);
    expect(taskService.obtenerTasks()[0].titulo, "Tarea 1");
    expect(taskService.obtenerTasks()[0].completo, false);
  });

  test('Completar tarea', (){
    taskService.completoTask("Tarea 1");
    expect(taskService.obtenerTasks()[0].completo, true);
  });

  test('Eliminar tarea', (){
    taskService.eliminarTask("Tarea 1");
    expect(taskService.obtenerTasks().length, 0);
  });

  test('Obtener tareas incompletas', (){
    taskService.agregarTask("Tarea 2");
    taskService.agregarTask("Tarea 3");
    taskService.completoTask("Tarea 2");

    expect(taskService.obtenerTasksIncompletas().length, 1);
    expect(taskService.obtenerTasksIncompletas()[0].titulo, "Tarea 3");
  });


}
