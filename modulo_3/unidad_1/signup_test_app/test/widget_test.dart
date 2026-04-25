import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:signup_test_app/main.dart';


void main() {
  testWidgets('Login correcto y navegación', (WidgetTester tester) async {
       
    //cargar el App virtual
    await tester.pumpWidget(MyApp());

    //Ingresar datos en los campos de texto
    await tester.enterText(find.byKey(Key("txtName")), "Santiago");
    await tester.enterText(find.byKey(Key("txtEmail")), "santi@email.com");

    await tester.enterText(find.byKey(Key("txtAge")), "30");

    //Hacer click en el botón de guardar
    await tester.tap(find.byKey(Key("btnSignUp")));

    //Actualizar la pantalla
    await tester.pumpAndSettle();

    //ini

  });
}

