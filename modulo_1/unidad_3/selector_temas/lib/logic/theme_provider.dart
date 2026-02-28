// ============================================
// ARCHIVO: logica_provider.dart
// Contiene: la clase TemaProvider + la pantalla que lo usa
// Dependencia: provider (paquete)
// ============================================

import 'package:flutter/material.dart'; // Importa los widgets básicos de Flutter
import 'package:provider/provider.dart'; // Importa provider para la gestión de estado
import 'package:selector_temas/theme.dart'; // Importa los temas definidos en el archivo theme.dart

// ---- LOGICA: ChangeNotifier ----

// ChangeNotifier es una clase de Flutter que puede avisar
// a sus oyentes cuando algo cambia internamente
class TemaProvider extends ChangeNotifier {
  ThemeData _tema = temaClaro; // Tema actual, empieza en claro
  String _nombre = 'Claro'; // Nombre actual

  ThemeData get tema => _tema; // Getter: los widgets leen el tema desde aquí
  String get nombre => _nombre; // Getter: los widgets leen el nombre desde aquí

  // Método que cambia el tema y avisa a todos los widgets suscritos
  void cambiar(ThemeData nuevo, String nuevoNombre) {
    _tema = nuevo; // Guarda el nuevo tema
    _nombre = nuevoNombre; // Guarda el nuevo nombre
    notifyListeners(); // Avisa a TODOS los widgets que usan watch
  }
}

// ---- PANTALLA: usa Provider ----

// Esta pantalla se envuelve en su propio ChangeNotifierProvider
// para que el tema solo afecte a este sub-árbol de widgets
class PantallaProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ChangeNotifierProvider crea e inyecta el TemaProvider
    // Solo los widgets dentro de este builder pueden acceder a él
    return ChangeNotifierProvider(
      create: (_) => TemaProvider(), // Crea una instancia nueva
      child: _ContenidoProvider(), // Widget hijo que lo consume
    );
  }
}

// Widget privado que consume el TemaProvider
class _ContenidoProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // context.watch suscribe este widget al TemaProvider
    // Cuando cambiar() llame notifyListeners(), este build se ejecuta de nuevo
    final tema = context.watch<TemaProvider>();

    // MaterialApp local con su propio tema
    return MaterialApp(
      theme: tema.tema, // Aplica el tema actual
      home: Scaffold(
        appBar: AppBar(title: Text('Provider - ${tema.nombre}')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Centra verticalmente
            children: [
              // Muestra el tema actual
              Text('Tema: ${tema.nombre}', style: TextStyle(fontSize: 22)),
              SizedBox(height: 30), // Espacio

              // Botón modo claro
              ElevatedButton(
                onPressed: () => tema.cambiar(temaClaro, 'Claro'),
                child: Text('Modo Claro'),
              ),
              SizedBox(height: 10),

              // Botón modo oscuro
              ElevatedButton(
                onPressed: () => tema.cambiar(temaOscuro, 'Oscuro'),
                child: Text('Modo Oscuro'),
              ),
              SizedBox(height: 10),

              // Botón modo devSenior
              ElevatedButton(
                onPressed: () => tema.cambiar(temaDevSenior, 'devSenior'),
                child: Text('Modo devSenior'),
              ),
              SizedBox(height: 40),

              // Botón para volver al menú principal
              OutlinedButton(
                onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
                child: Text('Volver al menú'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
