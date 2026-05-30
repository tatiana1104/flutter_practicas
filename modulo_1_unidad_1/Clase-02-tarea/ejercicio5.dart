void main() {
  List<int> numeros = [1, 5, 8, 12, 15, 22, 30];
  print(numeros);
  List<int> pares = numeros.where((n) => n % 2 == 0).toList();
  print(pares);
  List<int> dobles = numeros.map((n) => n * 2).toList();
  print(dobles);
}