<!-- Logo y Título del Proyecto -->
<div align="center">
  <h1>📱 Ejercicio 1 - Flutter</h1>
  <p>Aplicación de demostración de detalle de producto con cambio de tema</p>
</div>

<!-- Badges -->
<div align="center">

  <!-- Flutter -->
  <img src="https://img.shields.io/badge/Flutter-3.9.x-blue?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter Version"/>
  
  <!-- Dart -->
  <img src="https://img.shields.io/badge/Dart-3.9.x-blue?style=for-the-badge&logo=dart&logoColor=white" alt="Dart Version"/>
  
  <!-- Plataforma -->
  <img src="https://img.shields.io/badge/Platform-Android%20%26%20iOS-green?style=for-the-badge&logo=android&logoColor=white" alt="Platform"/>
  
  <!-- Licencia -->
  <img src="https://img.shields.io/badge/License-MIT-yellow?style=for-the-badge" alt="License"/>
  
  <!-- Estado del Proyecto -->
  <img src="https://img.shields.io/badge/Status-Activo-brightgreen?style=for-the-badge" alt="Status"/>

</div>

---

## 📋 Descripción del Proyecto

Este es un proyecto de práctica de Flutter desarrollado como parte de la **Unidad 1, Módulo 2** del curso de desarrollo móvil. La aplicación demuestra la creación de una pantalla de detalle de producto con las siguientes características:

- 🎨 **Interfaz de usuario** moderna con Material Design 3
- 🌓 **Cambio de tema** entre modo claro y oscuro
- 📦 **Visualización de productos** con imagen, nombre, precio y descripción
- 🛒 **Botón de acción** para añadir al carrito

---

## 🚀 Características Principales

| Característica | Descripción |
|----------------|-------------|
| 📱 **Diseño Responsivo** | Adaptable a diferentes tamaños de pantalla |
| 🎭 **Temas Dinámicos** | Soporte para modo claro y oscuro |
| 🖼️ **Gestión de Assets** | Carga de imágenes desde la carpeta assets |
| 🎯 **Material Design 3** | UI moderna con las últimas directrices de Material |

---

## 🛠️ Tecnologías Utilizadas

<div align="center">

| Tecnología | Versión |
|------------|---------|
| <img src="https://img.shields.io/badge/Flutter-3.9.x-blue?style=flat&logo=flutter"/> | SDK ^3.9.2 |
| <img src="https://img.shields.io/badge/Dart-3.9.x-blue?style=flat&logo=dart"/> | SDK ^3.9.2 |
| <img src="https://img.shields.io/badge/Material%20Design-3-green?style=flat"/> | ✅ Enabled |

</div>

---

## 📦 Dependencias

El proyecto utiliza las siguientes dependencias:

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
```

---

## ⚙️ Instalación

### Prerrequisitos

- 🐱 **Flutter SDK** 3.9.x o superior
- 💻 **Dart SDK** 3.9.x o superior
- 📱 **Android Studio** / **VS Code** (con extensiones de Flutter)

### Pasos de Instalación

1. **Clona el repositorio:**
   
```bash
   git clone <url-del-repositorio>
   cd Unidad_1/modulo_2/ejercicio_1
   
```

2. **Instala las dependencias:**
   
```bash
   flutter pub get
   
```

3. **Ejecuta el proyecto:**
   
```bash
   flutter run
   
```

---

## 📱 Uso de la Aplicación

### Pantalla Principal

La aplicación abre directamente en la **pantalla de detalle del producto** que incluye:

1. **AppBar** con título y switch de cambio de tema
2. **Imagen del producto** mostrada en un contenedor redondeado
3. **Nombre del producto**: Zapatilla GEL-ROCKET 12
4. **Precio**: $99.990
5. **Descripción** detallada del producto
6. **Botón** "Añadir al Carrito"

### Cambiar Tema

- Usa el **switch** en la esquina superior derecha de la AppBar
- Alterna entre **modo claro** 🌞 y **modo oscuro** 🌙

---

## 📂 Estructura del Proyecto

```
ejercicio_1/
├── lib/
│   ├── main.dart              # Punto de entrada de la app
│   └── screens/
│       └── product.dart       # Pantalla de detalle del producto
├── assets/
│   └── product.jpg           # Imagen del producto
├── pubspec.yaml              # Configuración del proyecto
└── README.md                 # Este archivo
```

---

## 📸 Vista Previa

| Modo Claro | Modo Oscuro |
|------------|-------------|
| Fondo blanco con acentos azules | Fondo oscuro con acentos azules |

---

## 🤝 Contribución

¡Las contribuciones son bienvenidas! Si deseas mejorar este proyecto:

1. Haz un **fork** del repositorio
2. Crea una rama para tu característica (`git checkout -b feature/nueva-caracteristica`)
3. Realiza tus **commits** (`git commit -m 'Agregar nueva característica'`)
4. **Push** a la rama (`git push origin feature/nueva-caracteristica`)
5. Abre un **Pull Request**

---

## 📄 Licencia

Este proyecto está bajo la **Licencia MIT** - consulta el archivo [LICENSE](LICENSE) para más detalles.

---

## 👤 Autor

Juddy Tatiana Vargas Santofimio
- Curso: Flutter Prácticas - Unidad 1, Módulo 2
