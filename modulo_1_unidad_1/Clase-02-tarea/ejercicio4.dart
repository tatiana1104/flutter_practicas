void main() {
  List<int> numeros = [1, 5, 8, 12, 15, 22, 30];
  print(numeros);
  List<int> dobles = numeros.map((n) => n * 2).toList();
  print(dobles);
}