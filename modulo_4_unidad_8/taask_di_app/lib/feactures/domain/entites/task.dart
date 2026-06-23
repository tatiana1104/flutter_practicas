// Esta es una clase de entidad simple que representa una Tarea en la capa de dominio de la aplicación.
// Contiene un único campo 'title' que almacena el título de la tarea. La clase es inmutable y se utiliza para encapsular la información de una tarea dentro del dominio de la aplicación.

class Task {
  final String title;

  const Task({
    required this.title,
  });

}