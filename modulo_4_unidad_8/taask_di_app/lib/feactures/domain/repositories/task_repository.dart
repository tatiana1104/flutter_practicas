// Esta es una interfaz de repositorio que define las operaciones que se pueden realizar sobre las tareas en la capa de dominio de la aplicación.
// Contiene métodos para obtener la lista de tareas, agregar una nueva tarea y eliminar una tarea existente. La implementación concreta de esta interfaz se encargará de manejar la persistencia de las tareas, ya sea en memoria, en una base de datos local o en un servicio remoto.

import '../entites/task.dart';

abstract class TaskRepository {
  List<Task> getTasks();

  void addTask(String title);
  void deleteTask(int index);
  
}
