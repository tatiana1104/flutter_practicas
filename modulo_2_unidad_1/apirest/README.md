# 🛍️ API REST Flutter App

![Flutter](https://img.shields.io/badge/Flutter-3.9.x-blue?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3.9.x-blue?style=for-the-badge&logo=dart&logoColor=white)
![API](https://img.shields.io/badge/REST-JSON-brightgreen?style=for-the-badge)
![Estado](https://img.shields.io/badge/Estado-Lista%20de%20API-yellow?style=for-the-badge)

## 📋 Descripción

Este proyecto es una aplicación Flutter diseñada para consumir la [Fake Store API](https://fakestoreapi.com). Permite visualizar productos remotos, crear nuevos productos y presentar datos obtenidos desde una API REST.

## ✨ Características principales

- 📋 **Listado de productos** consumidos desde un servicio externo.
- ➕ **Creación de productos** remotos con envío de datos JSON.
- 📱 **UI simple y funcional** orientada a datos de API.
- 🔁 **Parseo de JSON** y presentación en pantalla.

## 🛠️ Por qué usar las dependencias principales

- `http`: biblioteca oficial de Dart para realizar solicitudes HTTP a APIs REST.
- `cupertino_icons`: conjunto de iconos para compatibilidad visual en Cupertino/Material.

## 🌐 API utilizada

Endpoints principales:

- **GET** `/products`: recupera el listado de productos.
- **POST** `/products`: crea un nuevo producto.

Base URL: `https://fakestoreapi.com`

## ⚙️ Requisitos previos

- Flutter SDK 3.9.x o superior
- Dart SDK 3.9.x o superior
- Conexión a Internet
- Dispositivo o emulador Android/iOS

## 🚀 Instalación y ejecución

1. Accede al proyecto:

```bash
cd modulo_2_unidad_1/apirest
```

2. Instala las dependencias:

```bash
flutter pub get
```

3. Ejecuta la aplicación:

```bash
flutter run
```

## 📂 Estructura del proyecto

- `lib/`: código de la aplicación.
  - `models/`: modelos de datos como `Product`.
  - `services/`: lógica de consumo de la API.
  - `screens/`: pantallas principales.
- `pubspec.yaml`: configuración de dependencias.

## 📄 Licencia

Proyecto creado para práctica de integración de APIs en Flutter.
