// ============================================
// ARCHIVO: logica_bloc.dart
// Contiene: la clase TemaCubit + la pantalla que lo usa
// Dependencia: flutter_bloc (paquete)
// ============================================

import 'package:flutter/material.dart'; // Importa los widgets básicos de Flutter
import 'package:flutter_bloc/flutter_bloc.dart'; // Importa flutter_bloc para la gestión de estado
import 'package:selector_temas/theme.dart'; // Importa los temas definidos en el archivo theme.dart

// ---- LOGICA: Cubit ----

// Cubit es la versión simple de BLoC
// No usa eventos (Events), solo métodos directos
// Cubit<EstadoTema> = el estado que emite es de tipo EstadoTema
class TemaCubit extends Cubit<EstadoTema> {
  // super() define el estado inicial: tema claro con nombre 'Claro'
  TemaCubit() : super(EstadoTema(temaClaro, 'Claro'));

  // Método para cambiar el tema
  // emit() envía un nuevo estado a todos los widgets que escuchan
  void cambiar(ThemeData nuevo, String nuevoNombre) {
    emit(EstadoTema(nuevo, nuevoNombre)); // Emite el nuevo estado
  }
}

// ---- PANTALLA: usa BLoC/Cubit ----

// Esta pantalla se envuelve en su propio BlocProvider
class PantallaBloc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // BlocProvider crea e inyecta el TemaCubit
    return BlocProvider(
      create: (_) => TemaCubit(), // Crea una instancia nueva
      child: _ContenidoBloc(), // Widget hijo que lo consume
    );
  }
}

// Widget privado que consume el TemaCubit
class _ContenidoBloc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // BlocBuilder reconstruye su builder cada vez que el Cubit emite
    // <TemaCubit, EstadoTema> = tipo del cubit y tipo del estado
    return BlocBuilder<TemaCubit, EstadoTema>(
      builder: (context, estado) {
        // context.read obtiene el Cubit SIN suscribirse (para llamar métodos)
        final cubit = context.read<TemaCubit>();

        // MaterialApp local con el tema del estado actual
        return MaterialApp(
          theme: estado.tema, // Tema actual del Cubit
          home: Scaffold(
            appBar: AppBar(title: Text('BLoC - ${estado.nombre}')),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Muestra el nombre del tema actual
                  Text('Tema: ${estado.nombre}', style: TextStyle(fontSize: 22)),
                  SizedBox(height: 30),

                  // Botón modo claro: llama cubit.cambiar que usa emit()
                  ElevatedButton(
                    onPressed: () => cubit.cambiar(temaClaro, 'Claro'),
                    child: Text('Modo Claro'),
                  ),
                  SizedBox(height: 10),

                  // Botón modo oscuro
                  ElevatedButton(
                    onPressed: () => cubit.cambiar(temaOscuro, 'Oscuro'),
                    child: Text('Modo Oscuro'),
                  ),
                  SizedBox(height: 10),

                  // Botón modo devSenior
                  ElevatedButton(
                    onPressed: () => cubit.cambiar(temaDevSenior, 'devSenior'),
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
      },
    );
  }
}
