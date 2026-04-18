class UserService {
  final String _email = "test@mail.com";
  final String _password = "123456";

//metodo para validar el login
  bool login(String email, String password) {
    if (email == _email && password == _password) {
      return true;
    } else {
      return false;
    }
  }
}

class Task{
  String titulo; //titulo de la tarea
  bool completo; //indica si la tarea esta completa o no

  Task(this.titulo, this.completo);//constructor de la clase Task
}

class TaskService {
  List<Task> _tasks = []; //lista de tareas

  void agregarTask(String titulo) {
    _tasks.add(Task(titulo, false)); //agrega una nueva tarea a la lista
  }

  void eliminarTask(String titulo) {
    _tasks.removeWhere((task) => task.titulo == titulo); //elimina una tarea de la lista
  }

  void completoTask(String titulo) {
    for (var task in _tasks) {
      if (task.titulo == titulo) {
        task.completo = true; //marca una tarea como completa
        break;
      }
    }
  }

  List<Task> obtenerTasks() {
    return _tasks; //devuelve la lista de tareas
  }

  List<Task> obtenerTasksCompletas() {
    return _tasks.where((task) => task.completo).toList(); //devuelve la lista de tareas completas
  }

  List<Task> obtenerTasksIncompletas() {
    return _tasks.where((task) => !task.completo).toList(); //devuelve la lista de tareas incompletas
  }
} 