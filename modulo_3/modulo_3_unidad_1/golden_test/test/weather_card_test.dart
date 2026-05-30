import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  group('Golden Tests de WeatherCard', () {
    
    testGoldens('Debe renderizarse correctamente en diferentes estados', (tester) async {
      // 1. Cargar fuentes para evitar los cuadros negros (Ahem)
      await loadAppFonts();

      // 2. Construir el escenario (puedes probar varios a la vez)
      final builder = GoldenBuilder.grid(columns: 2, widthToHeightRatio: 1)
        ..addScenario('Soleado', WeatherCard(temp: 25, condition: 'Sunny'))
        ..addScenario('Lluvioso', WeatherCard(temp: 18, condition: 'Rainy'));

      // 3. Renderizar el builder
      await tester.pumpWidgetBuilder(builder.build());

      // 4. Comparar (esto creará el archivo .png)
      await screenMatchesGolden(tester, 'weather_card_multi_state');
    });
  });
}