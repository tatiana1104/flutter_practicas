import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:login_test_app/main.dart';

void main() {
  testWidgets('Login correcto y navegación', (WidgetTester tester) async {
    
    
    //cargar el App virtual
    await tester.pumpWidget(MyApp());

    //escribir los campos
    await tester.enterText(find.byKey(Key("txtUser")), "admin");
    await tester.enterText(find.byKey(Key("txtPass")), "1234");

    //simular el click en el botón
    await tester.tap(find.byKey(Key("btnLogin")));

    //esperar a que se complete la navegación
    await tester.pumpAndSettle();

    expect(
      find.text("Bienvenido Admin"),
      findsOneWidget,
    );

  });
}
