<div align="center">

# 🛒 App Ecommerce - Flutter

[![Flutter](https://img.shields.io/badge/Flutter-3.9.2-02569B?style=for-the-badge&logo=flutter)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.9.2-0175C2?style=for-the-badge&logo=dart)](https://dart.dev)
[![License](https://img.shields.io/badge/Licencia-MIT-green?style=for-the-badge)](LICENSE)
[![Estado](https://img.shields.io/badge/Estado-Activo-blue?style=for-the-badge)]()
[![Plataformas](https://img.shields.io/badge/Plataformas-iOS%20%7C%20Android%20%7C%20Web%20%7C%20Desktop-purple?style=for-the-badge)]()

---

### ✨ Aplicación de comercio electrónico desarrollada en Flutter con navegación personalizada y transiciones animadas.

</div>

---

## 📱 Acerca del Proyecto

Esta es una aplicación de comercio electrónico completa desarrollada en **Flutter** que simula una tienda en línea funcional. La app incluye un sistema de navegación personalizado con transiciones animadas suaves entre pantallas, proporcionando una experiencia de usuario fluida y moderna.

### 🎯 Objetivo

Demo académica para demostrar las capacidades de Flutter en el desarrollo de aplicaciones móviles con interfaces profesionales y navegación avanzada.

---

## 🚀 Características Principales

| Característica | Descripción |
|----------------|-------------|
| 🔄 | Pantalla de bienvenida (Splash) con transición fluida |
| 🔐 | Sistema de autenticación con formulario de inicio de sesión |
| 🏠 | Página principal con banner promocional y accesos rápidos |
| 📂 | Catálogo de productos organizado por categorías |
| 🔍 | Vista detallada de productos con información completa |
| 🛒 | Carrito de compras con gestión de items |
| 💳 | Proceso de checkout completo con forma de envío y pago |
| 🎬 | Transiciones animadas personalizadas (fade, slide, scale, slideUp) |

---

## 🗂️ Estructura del Proyecto

```
app_ecommerce/
├── lib/
│   ├── main.dart                      # Punto de entrada de la aplicación
│   ├── routes/
│   │   └── custom_routes.dart         # Rutas personalizadas con transiciones
│   └── screens/
│       ├── splash_screen.dart         # Pantalla de bienvenida
│       ├── login_screen.dart          # Pantalla de inicio de sesión
│       ├── home_screen.dart           # Pantalla principal
│       ├── categories_screen.dart     # Grid de categorías
│       ├── products_screen.dart       # Lista de productos
│       ├── product_detail_screen.dart # Detalle del producto
│       ├── cart_screen.dart           # Carrito de compras
│       └── checkout_screen.dart       # Proceso de compra
├── android/                           # Configuración Android
├── ios/                              # Configuración iOS
├── web/                              # Configuración Web
├── linux/                            # Configuración Linux
├── macos/                            # Configuración macOS
└── windows/                          # Configuración Windows
```

---

## 📱 Pantallas de la Aplicación

| Pantalla | Descripción | Transición |
|----------|-------------|------------|
| 🔰 SplashScreen | Pantalla de bienvenida con logo y botón de ingreso | Fade |
| 🔑 LoginScreen | Formulario de inicio de sesión con email y contraseña | Slide |
| 🏠 HomeScreen | Página principal con banner promocional y accesos rápidos | Slide + PushReplacement |
| 📂 CategoriesScreen | Grid de categorías de productos | Slide |
| 📦 ProductsScreen | Lista de productos filtrados por categoría | Slide |
| 🔎 ProductDetailScreen | Información detallada del producto seleccionado | Slide |
| 🛒 CartScreen | Resumen del carrito con lista de productos y total | Slide |
| 💳 CheckoutScreen | Formulario de envío, método de pago y confirmación | SlideUp + PushAndRemoveUntil |

---

## 🧭 Navegación y Transiciones

La aplicación utiliza un sistema de rutas personalizadas con **4 tipos de transiciones animadas**:

```dart
import 'package:app_ecommerce/routes/custom_routes.dart';

// 📝 Ejemplos de uso de las transiciones

// ✨ Desvanecimiento (fade)
CustomRoutes.fade(Widget page)

// ↔️ Deslizamiento horizontal (slide)
CustomRoutes.slide(Widget page)

// 🔍 Escala (scale)
CustomRoutes.scale(Widget page)

// ↕️ Deslizamiento vertical (slideUp)
CustomRoutes.slideUp(Widget page)
```

### 🔄 Flujo de Navegación

```
┌─────────────────────┐
│    SplashScreen     │
│   (Pantalla Inicio)  │
└──────────┬──────────┘
           │ ✨ fade
           ▼
┌─────────────────────┐
│    LoginScreen      │
│  (Inicio Sesión)    │
└──────────┬──────────┘
           │ ↔️ slide + pushReplacement
           ▼
┌─────────────────────┐
│    HomeScreen       │
│  (Página Principal)│
└──────────┬──────────┘
           │
     ┌─────┼─────┐
     │     │     │
     │     │     │
     ▼     ▼     ▼
┌───────┐ ┌─────┐ ┌─────┐
│ Cat.  │ │Prod.│ │Cart.│
└───┬───┘ └──┬──┘ └──┬──┘
    │        │       │
    │        │       │
    ▼        ▼       ▼
┌─────────────────────┐
│   CheckoutScreen    │
│   (Final Compra)    │
└─────────────────────┘
```

### 📌 Métodos de Navegación Flutter

| Método | Función | Uso en el Proyecto |
|--------|---------|-------------------|
| `Navigator.push()` | Agregar ruta al stack | Navegación hacia adelante |
| `Navigator.pop()` | Eliminar ruta del stack | Regresar a pantalla anterior |
| `Navigator.pushReplacement()` | Reemplazar ruta actual | Después del login |
| `Navigator.pushAndRemoveUntil()` | Limpiar stack de rutas | Ir a checkout desde cualquier punto |

---

## 🎨 Paleta de Colores

| Color | Código Hex | Uso |
|-------|------------|-----|
| 🟣 Púrpura Principal | `#6C63FF` | Color primario, botones, íconos principales |
| 🟣 Púrpura Oscuro | `#4834DF` | Gradientes, acentos oscuros |
| 🔴 Rosa Acento | `#FF6584` | Color secundario, acentos, alertas |

---

## 🛠️ Tecnologías Utilizadas

### Frameworks y Lenguajes
![Flutter](https://img.shields.io/badge/Flutter-02569B?style=flat-square&logo=flutter)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=flat-square&logo=dart)

### Diseño
![Material Design](https://img.shields.io/badge/Material%20Design-3-4DB6AC?style=flat-square)

### Conceptos Implementados
- 📱 **Flutter Widgets**: MaterialApp, Scaffold, AppBar, Container, Card
- 📋 **Lists**: ListView.builder, GridView.builder
- 🎯 **Forms**: TextField, ElevatedButton
- 🔄 **Animaciones**: PageRouteBuilder, CustomRoutes

---

## 📦 Instalación

### 1. Clonar el repositorio
```bash
git clone <url-del-repositorio>
cd app_ecommerce
```

### 2. Instalar dependencias
```bash
flutter pub get
```

### 3. Ejecutar la aplicación
```bash
flutter run
```

### 🖥️ Opciones de Ejecución

| Plataforma | Comando |
|------------|---------|
| Android | `flutter run -d android` |
| iOS | `flutter run -d ios` |
| Web | `flutter run -d chrome` |
| Windows | `flutter run -d windows` |
| macOS | `flutter run -d macos` |
| Linux | `flutter run -d linux` |

---

## 📋 Requisitos

| Requisito | Versión Mínima |
|-----------|----------------|
| 🟣 Flutter SDK | >= 3.0.0 |
| 🟣 Dart SDK | >= 3.0.0 |
| 🔧 IDE | VS Code, Android Studio o IntelliJ |

---

## 👨‍💻 Autor

<div align="center">

### 🙋‍♀️ **Juddy Tatiana Vargas Santofimio**
*Ingeniera de Sistemas*

---

🏢 **Dev Code Mobile Senior**

📅 *Proyecto desarrollado como actividad académica - Enero 2026*

---

¡Gracias por visitar este proyecto! ⭐

</div>

