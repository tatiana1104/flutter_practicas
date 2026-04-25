import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formulario_test_app/main.dart';

void main() {

  testWidgets('Formulario vacío muestra error',
      (WidgetTester tester) async {

    await tester.pumpWidget(MyApp());

    await tester.tap(
      find.byKey(Key("btnGuardar")),
    );

    await tester.pump();

    expect(
      find.text("Todos los campos son obligatorios"),
      findsOneWidget,
    );
  });

  testWidgets('Formulario correcto guarda usuario',
      (WidgetTester tester) async {

    await tester.pumpWidget(MyApp());

    await tester.enterText(
      find.byKey(Key("txtNombre")),
      "Fernando",
    );

    await tester.enterText(
      find.byKey(Key("txtCorreo")),
      "fernando@gmail.com",
    );

    await tester.enterText(
      find.byKey(Key("txtEdad")),
      "30",
    );

    await tester.tap(
      find.byKey(Key("btnGuardar")),
    );

    await tester.pump();

    expect(
      find.text("Usuario registrado correctamente"),
      findsOneWidget,
    );
  });

}