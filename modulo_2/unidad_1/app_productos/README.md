# 📱 app_productos

> Aplicación Flutter para gestión de productos con autenticación 🔐

## 📖 Descripción

Esta es una aplicación móvil desarrollada en Flutter para la gestión de productos. Permite a los usuarios autenticarse mediante registro e inicio de sesión, y gestionar una lista de productos (crear, leer, actualizar y eliminar).

## ✨ Características

- 🔐 **Autenticación de usuarios**: Registro e inicio de sesión con JWT
- 📦 **Gestión de productos**: CRUD completo (Crear, Leer, Actualizar, Eliminar)
- 🎨 **Interfaz moderna**: Diseño Material Design 3
- 🌐 **Conexión API REST**: Integración con backend externo

## 📁 Estructura del proyecto

```
lib/
├── main.dart              # 📌 Punto de entrada de la aplicación
├── models/
│   ├── user.dart          # 👤 Modelo de usuario
│   └── product.dart       # 📦 Modelo de producto
├── screens/
│   ├── login_screen.dart  # 🔑 Pantalla de inicio de sesión
│   └── register_screen.dart # 📝 Pantalla de registro
├── services/
│   └── api_services.dart  # 🌐 Servicio de conexión a la API
└── widgets/
    └── (widgets adicionales) # 🧩 Componentes UI
```

## 🔌 API Endpoints

La aplicación se conecta a la API en `https://api.fgoga.com`:

| Método | Endpoint | Descripción |
|--------|----------|-------------|
| ➕ POST | `/api/register` | Registrar nuevo usuario |
| 🔓 POST | `/api/login` | Iniciar sesión |
| 📋 GET | `/api/products` | Listar productos |
| ➕ POST | `/api/products` | Crear producto |
| 🔍 GET | `/api/products/{id}` | Obtener producto |
| ✏️ PUT | `/api/products/{id}` | Actualizar producto |
| 🗑️ DELETE | `/api/products/{id}` | Eliminar producto |

## 🛠️ Requisitos

- Flutter SDK 3.x
- Dependencias:
  - `http` - Para peticiones HTTP
  - `provider` - Gestión de estado
  - `shared_preferences` - Almacenamiento local

## 📥 Instalación

1. 📥 Clonar el repositorio
2. 📦 Ejecutar `flutter pub get` para instalar dependencias
3. ▶️ Ejecutar `flutter run` para iniciar la aplicación

## 💡 Uso

1. **📝 Registro**: El usuario se registra con nombre, email y contraseña
2. **🔑 Login**: Inicia sesión con email y contraseña
3. **📦 Productos**: Puede crear, ver, editar y eliminar productos

## 🚀 Getting Started

Este proyecto es un punto de partida para una aplicación Flutter.

Recursos para comenzar:

- 📚 [Lab: Escribe tu primera app Flutter](https://docs.flutter.dev/get-started/codelab)
- 🍳 [Cookbook: Ejemplos útiles de Flutter](https://docs.flutter.dev/cookbook)

Para ayuda con el desarrollo Flutter, consulta la
[documentación online](https://docs.flutter.dev/), que ofrece tutoriales,
muestras, guía para desarrollo móvil y referencia completa de API.

---

⭐️ Hecho con Flutter


email: juddy@example.com
pass: 12345678
