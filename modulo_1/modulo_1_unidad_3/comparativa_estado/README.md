# 📊 Comparativa de Estado en Flutter

> Un proyecto que compara diferentes enfoques de gestión de estado en Flutter

---

## 🎯 Acerca del Proyecto

Este proyecto es una aplicación Flutter que **compara diferentes enfoques de gestión de estado** en Flutter.

El objetivo es demostrar y analizar las tres herramientas más populares:

| Tecnología | Paquete | Implementación |
|------------|---------|----------------|
| 🟢 **Provider** | `provider: ^6.1.5+1` | `ChangeNotifier` |
| 🔵 **Flutter Bloc** | `flutter_bloc: ^9.1.1` | `Cubit<int>` |
| 🟣 **Riverpod** | `flutter_riverpod: ^3.2.1` | `StateProvider<int>` |

---

## 📁 Estructura del Proyecto

```
📂 lib/
├── 📄 main.dart                      # 📌 Punto de entrada de la aplicación
└── 📂 logic/
    ├── 📄 counter_provider.dart      # 🟢 Implementación con Provider
    │   └── CounterProvider          # Clase que extiende ChangeNotifier
    ├── 📄 counter_cubit.dart         # 🔵 Implementación con Flutter Bloc
    │   └── CounterCubit             # Clase que extiende Cubit<int>
    └── 📄 counter_riverpod.dart     # 🟣 Implementación con Riverpod
        └── counterRiverpodProvider  # StateProvider<int>
```

---

## 💻 Código Fuente

### 🟢 Provider - `counter_provider.dart`

```
dart
class CounterProvider extends ChangeNotifier {
  int count = 0;
  void increment() {
    count++;
    notifyListeners();
  }
}
```

**Características:**
- ✅ Utiliza `ChangeNotifier` para notificar cambios
- ✅ Método `notifyListeners()` actualiza la UI
- ✅ Simple y fácil de entender

---

### 🔵 Flutter Bloc - `counter_cubit.dart`

```
dart
class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);
  void increment() => emit(state + 1);
}
```

**Características:**
- ✅ Extiende `Cubit<int>` con estado inicial 0
- ✅ Método `emit()` para actualizar el estado
- ✅ Arquitectura basada en el patrón BLoC

---

### 🟣 Riverpod - `counter_riverpod.dart`

```
dart
final counterRiverpodProvider = StateProvider<int>((ref) => 0);
```

**Características:**
- ✅ `StateProvider` para estado simple
- ✅ No depende del árbol de widgets
- ✅ Mejora reactiva de Provider

---

## 📦 Dependencias

```
yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  provider: ^6.1.5+1
  flutter_bloc: ^9.1.1
  flutter_riverpod: ^3.2.1
```

---

## 🚀 Cómo Ejecutar

1. ✅ Asegúrate de tener Flutter instalado
2. ✅ Clona el repositorio
3. ✅ Ejecuta los siguientes comandos:

```
bash
flutter pub get
flutter run
```

---

## 📊 Comparación de Enfoques

| Característica | Provider | Flutter Bloc | Riverpod |
|----------------|----------|--------------|----------|
| **Curva de aprendizaje** | 🟢 Baja | 🔴 Alta | 🟡 Media |
| ** boilerplate** | 🟢 Poco | 🔴 Mucho | 🟡 Poco |
| **Testing** | 🟡 Regular | 🟢 Excelente | 🟢 Excelente |
| **Performance** | 🟢 Buena | 🟢 Buena | 🟢 Muy buena |
| **Estado global** | ✅ Sí | ✅ Sí | ✅ Sí |

---

## 📚 Recursos

| Recurso | Enlace |
|---------|--------|
| 🖥️ [Documentación oficial de Flutter](https://flutter.dev/) | https://flutter.dev/ |
| 📦 [Provider en Flutter](https://pub.dev/packages/provider) | https://pub.dev/packages/provider |
| 📦 [Flutter Bloc](https://pub.dev/packages/flutter_bloc) | https://pub.dev/packages/flutter_bloc |
| 📦 [Riverpod](https://pub.dev/packages/flutter_riverpod) | https://pub.dev/packages/flutter_riverpod |

---

## 📋 Licencia

Este proyecto está disponible bajo la licencia MIT.

---

## 👤 Autor

Juddy tatiana Vargas Santofimio  
Mobile Senior   
Dev Senior Code
