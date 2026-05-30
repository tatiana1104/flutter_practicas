import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_app/main.dart';

void main() {
  testWidgets('Ingrementa contador', (WidgetTester tester) async{
    //carga app
    await tester.pumpWidget(MyApp());

    //Validad que inicia en 0
    expect(find.text('0'), findsOneWidget);

    //presiones boton +
    await tester.tap(find.byIcon(Icons.add));

    //refrescar UI
    await tester.pump();

    //verificar valor 1
    expect(find.text('1'), findsOneWidget);

    //presiones boton -
    await tester.tap(find.byIcon(Icons.remove));

    //refrescar UI
    await tester.pump();

    //verificar valor 0
    expect(find.text('0'), findsOneWidget);

    //presiones boton reiniciar
    await tester.tap(find.byIcon(Icons.refresh));

    //refrescar UI
    await tester.pump();  

    //verificar valor 0
    expect(find.text('0'), findsOneWidget);

    

  });
}
