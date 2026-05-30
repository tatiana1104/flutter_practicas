# 📱 app_productos

![Flutter](https://img.shields.io/badge/Flutter-3.9.x-blue?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3.9.x-blue?style=for-the-badge&logo=dart&logoColor=white)
![Estado](https://img.shields.io/badge/Estado-Desarrollo-orange?style=for-the-badge)
![Licencia](https://img.shields.io/badge/Licencia-Privada-lightgrey?style=for-the-badge)

> Aplicación Flutter para la gestión de productos con autenticación y conexión a API REST.

## 📖 Descripción

`app_productos` es una app de práctica en Flutter que permite a los usuarios registrarse, iniciar sesión y gestionar productos mediante un backend REST. Incluye operaciones CRUD, manejo de sesión y una interfaz basada en Material Design.

## ✨ Funcionalidades principales

- 🔐 **Autenticación**: Registro e inicio de sesión de usuarios.
- 📦 **CRUD de productos**: Crear, listar, editar y eliminar productos.
- 🌐 **API REST**: Comunicación con un backend externo.
- 🎨 **UI moderna**: Diseño responsivo y agradable.

## 🔌 Endpoints usados

| Método | Endpoint | Descripción |
|--------|----------|-------------|
| POST | `/api/register` | Registrar usuario |
| POST | `/api/login` | Autenticar usuario |
| GET | `/api/products` | Listar productos |
| POST | `/api/products` | Crear producto |
| GET | `/api/products/{id}` | Ver detalle |
| PUT | `/api/products/{id}` | Actualizar producto |
| DELETE | `/api/products/{id}` | Eliminar producto |

## 🛠️ Dependencias y por qué se utilizan

- `http`: cliente HTTP para consumir la API REST.
- `provider`: manejo de estado para sesión y lista de productos.
- `shared_preferences`: almacenamiento local para token o preferencias.
- `cupertino_icons`: iconos estándar para Flutter.

## 📂 Estructura del proyecto

```
lib/
├── main.dart
├── models/
│   ├── user.dart
│   └── product.dart
├── screens/
│   ├── login_screen.dart
│   └── register_screen.dart
├── services/
│   └── api_services.dart
└── widgets/
    └── ...
```

## 🚀 Instalación

1. Abre una terminal en `modulo_2_unidad_1/app_productos`
2. Ejecuta:

```bash
flutter pub get
flutter run
```

## 💡 Uso

1. Registra un nuevo usuario.
2. Inicia sesión con email y contraseña.
3. Navega al listado de productos.
4. Crea, edita o elimina productos según sea necesario.

## 🎯 Objetivo

Este proyecto está diseñado para aprender a integrar una API REST con Flutter, practicar autenticación y aplicar un flujo completo de gestión de datos.

---

**Notas:**
- Asegúrate de que el backend `https://api.fgoga.com` esté disponible.
- Puedes extender la app con filtros, búsqueda o carga de imágenes de productos.
