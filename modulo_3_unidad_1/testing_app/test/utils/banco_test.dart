import 'package:flutter_test/flutter_test.dart';
import 'package:testing_app/utils/banco.dart';

void main() {
  final banco = Banco();
  test('Banco: Consultar saldo inicial', () {
    
    expect(banco.consultarSaldo(), 1000);
  });

  test('Banco: Depositar dinero', () {
    
    banco.depositar(500);
    expect(banco.consultarSaldo(), 1500);
  });

  test('Banco: Retirar dinero', () {
    
    banco.retirar(200);
    expect(banco.consultarSaldo(), 800);
  });

  test('Banco: Retirar monto mayor al saldo', () {
    
    banco.retirar(1200);
    expect(banco.consultarSaldo(), 1000); // El saldo no debería cambiar
  });


}