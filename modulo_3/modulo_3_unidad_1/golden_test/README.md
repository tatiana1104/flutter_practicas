# 📱 golden_test

> 🧪 Proyecto de demostración para aprender **Golden Tests** en Flutter

![Flutter](https://img.shields.io/badge/Flutter-3.11.1-blue)
![Dart](https://img.shields.io/badge/Dart-3.11.1-blue)
![License](https://img.shields.io/badge/License-MIT-green)

---

## 📖 ¿Qué es un Golden Test?

Los **Golden Tests** (también conocidos como *snapshot tests* o *visual regression tests*) son una técnica de pruebas automatizadas que capturan una imagen de referencia del estado visual de un widget o pantalla, y la comparan con capturas subsecuentes para detectar cambios no deseados en la interfaz de usuario.

### 🎯 Características principales:

| Característica | Descripción |
|----------------|-------------|
| 📸 **Captura visual** | Guarda una imagen de referencia (golden) del widget |
| 🔍 **Comparación** | Compara pixel a pixel las capturas actuales vs. las de referencia |
| ✅ **Detección de cambios** | Avisa si la UI ha cambiado inesperadamente |
| 🎨 **Regresión visual** | Previene errores de diseño en aplicaciones UI |

### 💡 ¿Cuándo usar Golden Tests?

- ✅ Cuando necesitas verificar que un widget se renderice correctamente
- ✅ Para detectar cambios inesperados en la interfaz
- ✅ Para hacer pruebas de temas y estilos visuales
- ✅ En widgets complejos con muchos estados (activo, inactivo, loading, error, etc.)

---

## 📂 Estructura del Proyecto

```
golden_test/
├── 📂 lib/
│   └── main.dart              # Punto de entrada de la app
├── 📂 test/
│   ├── weather_card_test.dart # Ejemplo de golden test
│   └── widget_test.dart     # Tests unitarios básicos
├── 📂 android/              # Configuración Android
├── 📂 ios/                  # Configuración iOS
├── 📂 linux/                # Configuración Linux
├── 📂 macos/                # Configuración macOS
├── 📂 web/                  # Configuración Web
├── 📂 windows/              # Configuración Windows
├── pubspec.yaml             # Dependencias del proyecto
└── README.md                # Este archivo
```

---

## 🛠️ Instalación y Configuración

### 1. 📥 Requisitos previos

- Flutter SDK 3.11.1 o superior
- Dart SDK 3.11.1 o superior
- Un editor de código (VS Code, Android Studio, etc.)

### 2. 📦 Instalar dependencias

```bash
flutter pub get
```

### 3. ▶️ Ejecutar la app

```bash
flutter run
```

---

## 🧪 Ejecutar los Golden Tests

### Ejecutar todos los tests

```bash
flutter test
```

### Ejecutar un test específico

```bash
flutter test test/weather_card_test.dart
```

### 📌 Ejecutar golden tests con goldens (regenerar imágenes de referencia)

```bash
flutter test --update-goldens
```

> ⚠️ **Importante**: Usa `--update-goldens` solo cuando los cambios visuales sean intencionales. Esto regenerará los archivos `.png` de referencia.

---

## 📦 Dependencias Principales

### Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
```

### Dev Dependencies

```yaml
dev_dependencies:
  flutter_test:
    sdk: flutter
  golden_toolkit: ^0.15.0      # 📸 Librería para golden tests
  flutter_lints: ^6.0.0
```

### 🖼️ Acerca de golden_toolkit

La librería `golden_toolkit` proporciona herramientas para crear y comparar golden tests en Flutter:

| Función | Descripción |
|---------|-------------|
| `testGoldens()` | Define un grupo de pruebas golden |
| `GoldenBuilder` | Constructor de escenarios visuales |
| `screenMatchesGolden()` | Compara la captura actual con la golden |
| `loadAppFonts()` | Carga fuentes para evitar errores de rendering |

---

## 💻 Código de Ejemplo

### Ejemplo de WeatherCard Golden Test

```dart
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
```

---

## 🔧 Mejores Prácticas

1. 📸 **Mantén las imágenes golden en control de versiones** - Git las rastreará
2. 🔄 **Actualiza goldens intencionalmente** - No uses `--update-goldens` por laziness
3. 🎭 **Prueba múltiples estados** - Usa `GoldenBuilder` para varios escenarios
4. 📏 **Usa dimensiones consistentes** - Define tamaños de prueba claros
5. 🚫 **Evita dependencias externas** - No cargues imágenes de red en golden tests

---

## 🤝 Contribución

¡Las contribuciones son bienvenidas! Si deseas mejorar este proyecto:

1. 🍴 Haz un fork del repositorio
2. 🌿 Crea una rama (`git checkout -b feature/nueva-caracteristica`)
3. 📝 commit tus cambios (`git commit -am 'Agregar nueva característica'`)
4. 🚀 Push a la rama (`git push origin feature/nueva-caracteristica`)
5. 🎉 Abre un Pull Request

---

## 📝 Licencia

Este proyecto está bajo la Licencia MIT - consulta el archivo [LICENSE](LICENSE) para más detalles.

---

## 🙋‍♀️ Próximos Pasos

Para profundizar en golden tests, considera:

- 📚 [Aprende más sobre golden_toolkit](https://pub.dev/packages/golden_toolkit)
- 🎨 [Explora más ejemplos de widget tests](https://flutter.dev/docs/testing/widgets)
- 🔧 [Configura CI/CD para golden tests](https://flutter.dev/docs/testing/continuous-delivery)
- 🎯 [Practica con más estados y temas](https://flutter.dev/docs/cookbook/testing/widget-test-introduction)


