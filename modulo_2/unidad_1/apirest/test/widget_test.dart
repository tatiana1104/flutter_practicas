// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:apirest/main.dart';
import 'package:apirest/screens/create_product_screen.dart';
import 'package:apirest/services/api_service.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([ApiService])
void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });

  testWidgets('Crear producto test', (WidgetTester tester) async {
    final mockApiService = MockApiService();

    // Configurar el mock para simular la creación de un producto
    when(mockApiService.createProduct(any)).thenAnswer((_) async => Product(
          id: 1,
          title: 'Producto de prueba',
          price: 10.0,
          description: 'Descripción de prueba',
          image: 'https://via.placeholder.com/150',
        ));

    // Construir la pantalla de creación de productos
    await tester.pumpWidget(MaterialApp(
      home: CreateProductScreen(),
    ));

    // Llenar el formulario
    await tester.enterText(find.byKey(Key('nameField')), 'Producto de prueba');
    await tester.enterText(find.byKey(Key('priceField')), '10.0');
    await tester.enterText(find.byKey(Key('descriptionField')), 'Descripción de prueba');

    // Enviar el formulario
    await tester.tap(find.byKey(Key('submitButton')));
    await tester.pump();

    // Verificar que se llamó al método createProduct
    verify(mockApiService.createProduct(any)).called(1);

    // Verificar que se muestra un mensaje de éxito
    expect(find.text('Producto creado: Producto de prueba'), findsOneWidget);
  });
}
