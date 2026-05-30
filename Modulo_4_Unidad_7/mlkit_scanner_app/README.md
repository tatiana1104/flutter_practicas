# ML Kit Scanner App

Aplicación Flutter que utiliza **Google ML Kit** para realizar:
- **OCR (Reconocimiento de texto)**
- **Escaneo de códigos QR / Barcodes**
- **Detección de rostros**

[![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?style=flat&logo=flutter)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?style=flat&logo=dart)](https://dart.dev/)
[![ML Kit](https://img.shields.io/badge/Google%20ML%20Kit-Vision-4285F4?style=flat)](https://developers.google.com/ml-kit)
[![MIT License](https://img.shields.io/badge/License-MIT-green?style=flat)](LICENSE)

## ¿Cómo funciona?
1. En la pantalla inicial (**HomePage**) se muestran tres opciones:
   - **OCR - Reconocimiento de texto** → `lib/screens/ocr_page.dart`
   - **QR - Escaneo de códigos QR** → `lib/screens/qr_page.dart`
   - **Rostro - Detección de rostros** → `lib/screens/face_page.dart`
2. En cada pantalla se usa `image_picker` para seleccionar una imagen desde la **cámara**.
3. La imagen se procesa con el detector/recognizer correspondiente de ML Kit y se muestra el resultado.

## Pantallas principales
- **`lib/screens/home_page.dart`**
  - Menú principal con navegación.
- **`lib/screens/ocr_page.dart`**
  - Reconoce texto usando `TextRecognizer`.
- **`lib/screens/qr_page.dart`**
  - Detecta barcodes/QR usando `BarcodeScanner` y muestra `rawValue`.
- **`lib/screens/face_page.dart`**
  - Detecta rostros con `FaceDetector`.

## Requisitos
- Flutter SDK
- Permiso de **cámara** (requerido por `image_picker`).

## Ejecutar el proyecto
```bash
flutter pub get
flutter run
```

## Dependencias principales
Este proyecto ya incluye las dependencias en `pubspec.yaml`:
- `google_mlkit_text_recognition`
- `google_mlkit_barcode_scanning`
- `google_mlkit_face_detection`
- `image_picker`


