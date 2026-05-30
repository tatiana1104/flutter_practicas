# voice_traslator

[![Flutter](https://img.shields.io/badge/Flutter-3.0-blue?logo=flutter)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.0-blue?logo=dart)](https://dart.dev)
[![Status](https://img.shields.io/badge/estado-incompleto-orange)](#)

## Descripción

`voice_traslator` es una aplicación móvil desarrollada con Flutter que transforma voz en texto y luego traduce ese texto a otro idioma. El proyecto está diseñado de forma sencilla y clara, con características útiles para aprender y extender la funcionalidad.

## Funcionalidades principales

- Reconocimiento de voz en tiempo real.
- Selección del idioma de origen (`Español`, `English`, `Français`).
- Selección del idioma de destino para la traducción.
- Traducción del texto ingresado y presentación del resultado en pantalla.
- Reproducción del texto traducido mediante síntesis de voz.
- Historial de traducciones almacenado en memoria durante la sesión.
- Cambios de tema claro/oscuro mediante un botón en la barra superior.

## Dependencias utilizadas

El proyecto utiliza las siguientes dependencias principales:

- `speech_to_text`: reconoce voz y convierte el audio a texto.
- `flutter_tts`: sintetiza voz a partir de texto traducido.
- `translator`: realiza la traducción entre idiomas.

También se utilizan dependencias estándar de Flutter:

- `flutter`
- `cupertino_icons`

## Archivos clave

- `lib/main.dart`: implementación principal de la aplicación, UI y lógica.
- `pubspec.yaml`: configuración de dependencias y metadatos del proyecto.
- `android/app/src/main/AndroidManifest.xml`: permisos requeridos por Android, incluyendo `RECORD_AUDIO`.

## Configuración y ejecución

1. Abre una terminal en `voice_traslator`.
2. Ejecuta:

```bash
flutter pub get
flutter run
```

3. Si usas Android, habilita el permiso de grabación de audio cuando el dispositivo lo solicite.

## Uso de la aplicación

1. Selecciona el idioma de origen.
2. Selecciona el idioma de destino.
3. Presiona `Escuchar` y habla claramente.
4. Presiona `Traducir a ...` para traducir el texto reconocido.
5. Presiona `Escuchar Traducción` para reproducir la traducción.
6. Consulta el historial de traducciones en la parte inferior.

## Buenas prácticas

- Selecciona el idioma correcto antes de comenzar a grabar.
- Habla con claridad y a un volumen moderado.
- El historial se conserva en memoria únicamente durante la ejecución; al cerrar la app se borra.

## Estado del proyecto

Esta aplicación es una implementación básica con enfoque educativo. Es ideal para desarrolladores junior que quieran aprender a integrar voz, traducción y síntesis de audio en Flutter.

## Créditos

Proyecto realizado para práctica de Flutter con foco en reconocimiento de voz y traducción.
