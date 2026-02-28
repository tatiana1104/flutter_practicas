<div align="center">

# 🛍️ Shop MVVM

[![Flutter](https://img.shields.io/badge/Flutter-3.9.2-blue?style=for-the-badge&logo=flutter)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.9.2-blue?style=for-the-badge&logo=dart)](https://dart.dev)
[![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)](LICENSE)
[![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS%20%7C%20Web-bluegrey?style=for-the-badge)](https://flutter.dev)
[![State Management](https://img.shields.io/badge/State%20Management-Provider-purple?style=for-the-badge)](https://pub.dev/packages/provider)
[![Architecture](https://img.shields.io/badge/Architecture-MVVM-orange?style=for-the-badge)](https://docs.microsoft.com/es-es/xamarin/xamarin-forms/enterprise-application-patterns/mvvm)

---

### 🌟 ¡Demonstración del patrón MVVM en Flutter!

</div>

## 📖 Descripción

**Shop MVVM** es una aplicación Flutter diseñada para demostrar el uso del patrón de arquitectura **Model-View-ViewModel (MVVM)**. Este proyecto incluye una estructura modular que separa las responsabilidades de la lógica de negocio, la gestión de estado y la interfaz de usuario, siguiendo las mejores prácticas de desarrollo móvil.

> ✨ *Ideal para aprender arquitectura MVVM con Flutter y Provider*

## ✨ Características Principales

| Característica | Descripción |
|----------------|-------------|
| 🛒 **Catálogo de Productos** | Visualiza una lista completa de productos disponibles |
| 🛍️ **Carrito de Compras** | Agrega productos, gestiona cantidades y visualiza detalles |
| 🔄 **Gestión de Estado** | Implementado con el paquete `provider` |
| 🎨 **UI Moderna** | Interfaz de usuario limpia y amigable |
| 📱 **Multiplataforma** | Compatible con Android, iOS y Web |

## 🛠️ Tecnologías Utilizadas

<div align="center">

| Tecnología | Versión | Propósito |
|------------|---------|-----------|
| <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/flutter/flutter-original.svg" width="30"/> Flutter | ^3.9.2 | Framework principal |
| <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/dart/dart-original.svg" width="30"/> Dart | ^3.9.2 | Lenguaje de programación |
| <img src="https://img.shields.io/badge/Provider-6.1.5-blue" width="80"/> | ^6.1.5+1 | Gestión de estado |
| <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/android/android-original.svg" width="30"/> | - | Plataforma Android |
| <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/apple/apple-original.svg" width="30"/> | - | Plataforma iOS |

</div>

## 📱 Capturas de Pantalla

> 📌 *Próximamente: Agrega tus capturas de pantalla en la carpeta `assets/screenshots/`*

```bash
# Estructura recomendada para capturas de pantalla
assets/
└── screenshots/
    ├── catalog_screen.png
    ├── cart_screen.png
    └── product_detail.png
```

## 📂 Estructura del Proyecto

```
lib/
├── main.dart                    # 🚀 Punto de entrada de la aplicación
├── models/
│   └── product.dart             # 📦 Modelo de datos del producto
├── viewmodels/
│   └── car_view_model.dart     # 🧠 ViewModel del carrito de compras
└── views/
    ├── cart_screen.dart        # 🛒 Vista del carrito de compras
    └── catalog_screen.dart     # 📋 Vista del catálogo de productos
```

### 🔑 Conceptos Clave

- **Model (Modelo)**: Representa los datos y la lógica de negocio (`product.dart`)
- **View (Vista)**: La interfaz de usuario (`cart_screen.dart`, `catalog_screen.dart`)
- **ViewModel**: Gestiona el estado y la lógica de presentación (`car_view_model.dart`)

## ⚙️ Requisitos del Sistema

| Requisito | Versión Mínima |
|-----------|----------------|
| 🖥️ Flutter SDK | ^3.9.2 |
| 💾 Dart SDK | ^3.9.2 |
| 📱 Android SDK | API 21+ |
| 🍎 iOS | 12.0+ |

## 🚀 Instalación y Ejecución

### 1️⃣ Clonar el Repositorio

```bash
git clone https://github.com/tatiana1104/flutter_practicas.git
cd modulo_1/unidad_3/shop_mvvm
```

### 2️⃣ Navegar al Directorio

```bash
cd shop_mvvm
```

### 3️⃣ Instalar Dependencias

```bash
flutter pub get
```

### 4️⃣ Ejecutar la Aplicación

```bash
flutter run
```

### 🔧 Comandos Adicionales

| Comando | Descripción |
|---------|-------------|
| `flutter build apk` | Generar APK para Android |
| `flutter build ios` | Generar IPA para iOS |
| `flutter test` | Ejecutar pruebas |
| `flutter analyze` | Analizar código |

## 📦 Dependencias Principales

El proyecto utiliza las siguientes dependencias destacadas:

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  provider: ^6.1.5+1
```

### 📥 Agregar Provider

```bash
flutter pub add provider
```

## ✅ Pruebas

Ejecuta las pruebas de widgets:

```bash
flutter test
```

Para generar informe de cobertura:

```bash
flutter test --coverage
```

## 🤝 Contribuciones

¡Las contribuciones son bienvenidas! 🎉

1. **Fork** el repositorio
2. Crea una rama (`git checkout -b feature/nueva-caracteristica`)
3. **Commit** tus cambios (`git commit -m 'Agregar nueva característica'`)
4. **Push** a la rama (`git push origin feature/nueva-caracteristica`)
5. Abre un **Pull Request**

Por favor, lee nuestro [Código de Conducta](CODE_OF_CONDUCT.md) antes de contribuir.

## 📄 Licencia

Este proyecto está bajo la licencia **MIT**. Consulta el archivo [LICENSE](LICENSE) para más detalles.

<div align="center">

[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

</div>

## ✍️ Autor

**Juddy Tatiana Vargas Santofimio**  
Ingeniería de Sistemas

---

<div align="center">

⭐️ ¡Dale una estrella al proyecto si te fue útil!

Hecho con ❤️ usando Flutter

</div>
