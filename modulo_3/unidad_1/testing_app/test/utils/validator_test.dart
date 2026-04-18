import 'package:flutter_test/flutter_test.dart';
import 'package:testing_app/utils/validator.dart';

void main(){
  final validator = Validator();

  test('Email válido', () {
    expect(validator.emailValido('test@gmail.com'), true);
  });

  test('Password válido', () {
    expect (validator.passwordValiido('123'), false);
  });

  test('Password válido', () {
    expect (validator.passwordValiido('abc123'), true);
  });
}