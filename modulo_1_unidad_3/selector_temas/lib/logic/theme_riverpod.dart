// ============================================
// ARCHIVO: logica_riverpod.dart
// Contiene: el StateProvider + la pantalla que lo usa
// Dependencia: flutter_riverpod (paquete)
// ============================================

import 'package:flutter/material.dart'; // Importa los widgets básicos de Flutter
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Importa Riverpod para la gestión de estado
import 'package:flutter_riverpod/legacy.dart'; // Importa características legacy de Riverpod
import 'package:selector_temas/theme.dart'; // Importa los temas definidos en el archivo theme.dart

// ---- LOGICA: StateProvider ----

// StateProvider es la forma más simple de manejar estado en Riverpod
// Es una variable global que cualquier widget puede leer y modificar
// NO depende del árbol de widgets ni del BuildContext
final temaProvider = StateProvider<EstadoTema>(
  (ref) => EstadoTema(temaClaro, 'Claro'), // Valor inicial: tema claro
);

// ---- PANTALLA: usa Riverpod ----

// Esta pantalla se envuelve en su propio ProviderScope
// para que el estado sea independiente del resto de la app
class PantallaRiverpod extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ProviderScope es obligatorio en Riverpod
    // Almacena el estado de todos los providers dentro de él
    return ProviderScope(
      child: _ContenidoRiverpod(), // Widget hijo que consume el provider
    );
  }
}

// ConsumerWidget es la versión Riverpod de StatelessWidget
// La diferencia: el build recibe un WidgetRef para leer providers
class _ContenidoRiverpod extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.watch() observa el provider y reconstruye cuando cambie
    // No usa context, usa ref (independiente del árbol de widgets)
    final estado = ref.watch(temaProvider);

    // MaterialApp local con el tema del provider
    return MaterialApp(
      theme: estado.tema, // Tema actual del provider
      home: Scaffold(
        appBar: AppBar(title: Text('Riverpod - ${estado.nombre}')), // Barra superior con el nombre del tema
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Centra los widgets verticalmente
            children: [
              // Muestra el nombre del tema actual
              Text('Tema: ${estado.nombre}', style: TextStyle(fontSize: 22)),
              SizedBox(height: 30), // Espaciado entre widgets

              // Botón modo claro
              ElevatedButton(
                onPressed: () {
                  // ref.read() lee el provider SIN suscribirse (para escribir)
                  // .notifier accede al controlador del StateProvider
                  // .state = asigna un nuevo valor y notifica automáticamente
                  ref.read(temaProvider.notifier).state =
                      EstadoTema(temaClaro, 'Claro');
                },
                child: Text('Modo Claro'), // Texto del botón
              ),
              SizedBox(height: 10), // Espaciado entre widgets

              // Botón modo oscuro
              ElevatedButton(
                onPressed: () {
                  ref.read(temaProvider.notifier).state =
                      EstadoTema(temaOscuro, 'Oscuro');
                },
                child: Text('Modo Oscuro'), // Texto del botón
              ),
              SizedBox(height: 10), // Espaciado entre widgets

              // Botón modo devSenior
              ElevatedButton(
                onPressed: () {
                  ref.read(temaProvider.notifier).state =
                      EstadoTema(temaDevSenior, 'devSenior');
                },
                child: Text('Modo devSenior'), // Texto del botón
              ),
              SizedBox(height: 40), // Espaciado entre widgets

              // Botón para volver al menú principal
              OutlinedButton(
                onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
                child: Text('Volver al menú'), // Texto del botón
              ),
            ],
          ),
        ),
      ),
    );
  }
}
