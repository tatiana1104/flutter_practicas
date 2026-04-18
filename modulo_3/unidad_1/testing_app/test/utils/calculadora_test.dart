import 'package:flutter_test/flutter_test.dart';
import 'package:testing_app/utils/calculadora.dart';

void main(){
  test('Debe sumar correctamente', () {
    final calc = Calculadora();

    expect(calc.sumar(2,3),5);
  });
}