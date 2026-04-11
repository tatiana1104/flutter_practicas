# 🚀 Flutter - Dio Profesional Demo

Proyecto de ejemplo en Flutter que demuestra el uso avanzado de Dio para el consumo de APIs REST.

Este proyecto incluye configuración profesional de red con:

- ✅ Configuración global con BaseOptions  
- ✅ Interceptors personalizados  
- ✅ Logging avanzado con pretty_dio_logger  
- ✅ Retry automático para errores 408 y 500  
- ✅ Cancelación de peticiones con CancelToken  
- ✅ Manejo centralizado de errores  
- ✅ Interfaz simple para pruebas  

---

# 📦 Dependencias

Agrega las siguientes dependencias en tu `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  dio: ^5.4.0
  pretty_dio_logger: ^1.3.1
```

Luego ejecuta:
```bash
flutter pub get
```

---
# 🏗️ Estructura del Proyecto
```
lib/
│
├── main.dart
└── services/
    └── api_service.dart
```

---
# 🔧 api_service.dart

Contiene la clase ApiService, que encapsula toda la lógica de red.

🔹 Configuración Global

Se configuran:
 * baseUrl
 * connectTimeout
 * receiveTimeout
 * Headers por defecto

```dart
BaseOptions(
  baseUrl: 'https://jsonplaceholder.typicode.com',
  connectTimeout: const Duration(seconds: 5),
  receiveTimeout: const Duration(seconds: 3),
  headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  },
);
```

🔹 Logging con PrettyDioLogger

Se agrega un interceptor para visualizar en consola:

* Request headers
* Request body
* Response body
* Errores

Ideal para desarrollo y debugging.

🔹 Interceptor Personalizado

Incluye:

✅ Inyección automática de token

```dart
options.headers['Authorization'] = 'Bearer MI_TOKEN_SECRETO';
```

✅ Retry automático

Si el servidor responde con:

* 408 (Request Timeout)
* 500 (Internal Server Error)

El sistema:

1. Espera 2 segundos
2. Reintenta automáticamente la petición

🔹 Cancelación de Peticiones
```dart
_cancelToken.cancel("Petición cancelada por el usuario");
```
---
# 🎮 main.dart

Interfaz simple con tres botones para probar funcionalidades:

|Botón|	Funcionalidad|
|-----|--------------|
|1️⃣ Petición Normal	| Obtiene lista de posts |
|2️⃣ Forzar Error 500	| Prueba el retry automático |
|3️⃣ Cancelar Petición	| Cancela una request activa |

---

# 🌐 API Utilizada

API principal:
https://jsonplaceholder.typicode.com

Endpoint usado:
GET /posts

Simulación de error 500:
https://httpstat.us/500

---

# 🧪 Cómo Ejecutar el Proyecto

```bash
flutter pub get
flutter run
```

Luego presiona los botones y revisa la consola para ver:
* Logs
* Retry automático
* Cancelaciones
* Manejo de errores

---

# 🧠 Conceptos Demostrados

* Uso profesional de Dio
* Configuración avanzada de red
* Uso de interceptors
* Retry manual con fetch
* Cancelación controlada de requests
* Centralización de errores
* Buenas prácticas en servicios HTTP

---

# 📚 Requisitos

* Flutter 3.x o superior
* Dart con Null Safety
* Dio 5.x

---
# 📄 Licencia

Proyecto de uso educativo y demostrativo.