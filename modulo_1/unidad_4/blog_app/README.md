# Blog App

## Descripción
Blog App es una aplicación Flutter que consume una API para mostrar:
- Lista de publicaciones
- Detalles de cada publicación
- Comentarios asociados
- Información del autor

## Características
1. **Lista de publicaciones**:
   - Título
   - Parte del cuerpo
   - ID del usuario
2. **Detalles del post**:
   - Título completo
   - Cuerpo
   - Botón para ver comentarios
   - Información del autor
3. **Comentarios**:
   - Nombre
   - Email
   - Contenido del comentario
4. **Perfil del usuario**:
   - Nombre
   - Nombre de usuario
   - Email
   - Teléfono
   - Empresa
   - Dirección

## Endpoints utilizados
- `/posts`
- `/posts/{id}`
- `/posts/{id}/comments`
- `/users/{id}`

## Instalación
1. Clona este repositorio:
   ```bash
   git clone <URL_DEL_REPOSITORIO>
   ```
2. Navega al directorio del proyecto:
   ```bash
   cd blog_app
   ```
3. Instala las dependencias:
   ```bash
   flutter pub get
   ```

## Ejecución
1. Ejecuta la aplicación:
   ```bash
   flutter run
   ```
2. Selecciona un dispositivo o emulador para probar la aplicación.

## Estructura del proyecto
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

## Dependencias
- `http`: Para realizar solicitudes HTTP.

## Autor
Desarrollado por J. Tatiana Vargas.
