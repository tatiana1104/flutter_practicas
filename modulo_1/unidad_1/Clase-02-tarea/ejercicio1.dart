void main() {
  List<String> frutas = ['Manzana', 'Banana', 'Naranja', 'Fresa', 'Uva'];
  print(frutas);
  print(frutas[1]);
  frutas.add('Kiwi');
  print(frutas);
  frutas.removeAt(0);
  print(frutas);
}