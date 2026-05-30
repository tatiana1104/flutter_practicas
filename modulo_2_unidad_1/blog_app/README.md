# Blog App

![Flutter](https://img.shields.io/badge/Flutter-3.9.x-blue?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3.9.x-blue?style=for-the-badge&logo=dart&logoColor=white)
![API](https://img.shields.io/badge/REST-JSON-brightgreen?style=for-the-badge)
![Estado](https://img.shields.io/badge/Estado-Desarrollo-orange?style=for-the-badge)

## 📋 Descripción

Blog App es una aplicación Flutter que consume una API REST para mostrar publicaciones, detalles de posts, comentarios e información de usuarios.

## ✨ Características principales

- 📄 **Listado de publicaciones** con título, vista previa de contenido y autor.
- 🔍 **Detalle del post** con cuerpo completo y acceso a comentarios.
- 💬 **Comentarios asociados** por cada publicación.
- 👤 **Perfil de usuario** con datos de contacto y empresa.

## 🌐 Endpoints utilizados

- `GET /posts`
- `GET /posts/{id}`
- `GET /posts/{id}/comments`
- `GET /users/{id}`

## 🛠️ Dependencias y por qué se usan

- `http`: biblioteca oficial para realizar solicitudes HTTP y obtener datos JSON desde la API.
- `flutter`: framework principal para construir la app.
- `cupertino_icons`: íconos estándar para la interfaz.

## 🚀 Instalación

1. Clona el repositorio:
   ```bash
   git clone <URL_DEL_REPOSITORIO>
   ```
2. Navega al directorio del proyecto:
   ```bash
   cd modulo_2_unidad_1/blog_app
   ```
3. Instala las dependencias:
   ```bash
   flutter pub get
   ```

## ▶️ Ejecución

```bash
flutter run
```

## 📁 Estructura del proyecto

```
lib/
 ├── models/
 │    ├── post.dart
 │    ├── user.dart
 │    └── comment.dart
 ├── services/
 │    └── api_service.dart
 ├── screens/
 │    ├── post_list_screen.dart
 │    ├── post_detail_screen.dart
 │    └── user_profile_screen.dart
 ├── widgets/
 └── main.dart
```

## 🎯 Objetivo

Aprender a integrar APIs REST en Flutter y presentar datos remotos en una experiencia de usuario estructurada.

## 👤 Autor
Desarrollado por Juddy Tatiana Vargas.
