# 📱 Fit Life - Validación de Registro

![Flutter](https://img.shields.io/badge/Flutter-3.x-blue?style=flat-square&logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.x-blue?style=flat-square&logo=dart)
![License](https://img.shields.io/badge/Licencia-MIT-green?style=flat-square)
![Versión](https://img.shields.io/badge/Versión-1.0.0-orange?style=flat-square)
![Platform](https://img.shields.io/badge/Platform-Android%20%26%20iOS-purple?style=flat-square)

> Aplicación Flutter de demostración para validación de formularios de registro de usuarios.

## 📋 Descripción

**Fit Life** es una aplicación de práctica desarrollada en Flutter que demuestra la implementación de validaciones de formularios en el registro de usuarios. El proyecto sirve como ejemplo educativo para aprender a crear formularios robustos con validaciones en Flutter.

Esta aplicación forma parte del módulo de prácticas de Flutter, específicamente en la unidad de validación de formularios.

## ✨ Características

| Característica | Descripción |
|----------------|-------------|
| 🔤 **Validación de Nombre** | Verifica que el nombre no esté vacío y tenga un formato válido |
| 🎂 **Validación de Edad** | Asegura que la edad sea un número válido y esté en un rango apropiado |
| 📧 **Validación de Email** | Confirma que el correo electrónico tenga un formato correcto |
| 🔒 **Validación de Contraseña** | Verifica requisitos de seguridad (mínimo 8 caracteres) |
| ✅ **Confirmación de Contraseña** | Asegura que ambas contraseñas coincidan |
| 👁️ **Mostrar/Ocultar Contraseña** | Opción para visualizar la contraseña escrita |
| 🎨 **UI Moderna** | Interfaz de usuario atractiva con Material Design 3 |

## 📂 Estructura del Proyecto

```
lib/
├── main.dart                    # Punto de entrada de la aplicación
├── screens/
│   ├── register_screen.dart     # Pantalla de registro de usuarios
│   └── welcome_screen.dart      # Pantalla de bienvenida
└── utils/
    └── validators.dart          # Funciones de validación
```

## 🚀 Instalación

### Prerrequisitos

- Flutter SDK 3.x o superior
- Dart SDK 3.x o superior
- Android Studio o VS Code con extensión de Flutter

### Pasos de Instalación

1. **Clonar el repositorio:**
   
```bash
   git clone https://github.com/tatiana1104/flutter_practicas.git
   cd modulo_1/unidad_2/login_validation   
```

2. **Instalar dependencias:**
   
```bash
   flutter pub get   
```

3. **Ejecutar la aplicación:**
   
```bash
   flutter run   
```

## 📱 Uso de la Aplicación

1. **Iniciar la aplicación** - La pantalla de registro se mostrará automáticamente
2. **Completar el formulario** - Ingresa los datos en cada campo:
   - Nombre completo
   - Edad
   - Correo electrónico
   - Contraseña
   - Confirmar contraseña
3. **Validación automática** - Los campos se validan al presionar el botón
4. **Registro exitoso** - Si todo es válido, accederás a la pantalla de bienvenida

## 🛠️ Tecnologías Utilizadas

| Tecnología | Propósito |
|------------|-----------|
| **Flutter** | Framework de desarrollo móvil |
| **Dart** | Lenguaje de programación |
| **Material Design 3** | Sistema de diseño UI |

## 📝 Validaciones Implementadas

```
✓ Nombre: No vacío, solo letras y espacios
✓ Edad: Número positivo entre 1 y 120 años
✓ Email: Formato válido de correo electrónico
✓ Contraseña: Mínimo 8 caracteres
✓ Confirmación: Debe coincidir con la contraseña
```

## 📸 Capturas de Pantalla

| Pantalla de Registro | Pantalla de Bienvenida |
|---------------------|----------------------|
| 📝 *Próximamente*   | 🎉 *Próximamente*   |

## 🤝 Contribuciones

¡Las contribuciones son bienvenidas! Si deseas mejorar este proyecto:

1. Fork del repositorio
2. Crear una rama (`git checkout -b feature/nueva-caracteristica`)
3. Commit de los cambios (`git commit -m 'Agregar nueva característica'`)
4. Push a la rama (`git push origin feature/nueva-caracteristica`)
5. Abrir un Pull Request

## 📄 Licencia

Este proyecto está bajo la Licencia MIT - consulta el archivo [LICENSE](LICENSE) para más detalles.

---

<div align="center">

⭐️ Si te gusta este proyecto, no olvides给它 una estrella!

**Desarrollado con ❤️ usando Flutter**

</div>
