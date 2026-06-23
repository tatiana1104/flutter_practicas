import 'package:injectable/injectable.dart';
import '../../domain/entites/task.dart';
import '../../domain/repositories/task_repository.dart';
import '../datasources/task_datasource.dart';

@LazySingleton(as: TaskRepository)
class TaskRepositoryImpl implements TaskRepository {
  final TaskDatasource datasource; // Dependency injection for the data source

  TaskRepositoryImpl(this.datasource); // Constructor to initialize the repository with the data source

  @override
  List<Task> getTasks() {
    return datasource.getTasks().map((title) => Task(title: title)).toList(); // Convierte la lista de títulos en una lista de objetos Task
  }

  @override
  void addTask(String title) {
    datasource.addTask(title); // Llama al método addTask del data source para agregar una nueva tarea
  }

  @override
  void deleteTask(int index) {
    datasource.deleteTask(index); // Llama al método deleteTask del data source para eliminar una tarea por índice
  }
}
