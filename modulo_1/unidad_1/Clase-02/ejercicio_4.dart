//Dada la siguiente lista de números: 
//List<int> numbers = [10, 53, 28, 11, 19, 33, 99, 101];
//Escribe una línea de código que filtre la lista y cree una nueva lista que contenga solo los números mayores a 22.
//Imprime la nueva lista.

void main() {
  List<int> numbers = [10, 53, 28, 11, 19, 33, 99, 101];
  List<int> filteredNumbers = numbers.where((n) => n > 22).toList();
  print(filteredNumbers);
}
