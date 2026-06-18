import 'package:flutter/material.dart';
import '../models/player.dart';
import '../services/gemini_service.dart';
import '../services/player_repository.dart';
import '../theme/app_colors.dart';
import 'consent_choice_screen.dart';

/// ============================================================
///  PANTALLA 3: Formulario de Registro (RegistrationScreen)
/// ============================================================
/// Captura los datos del jugador, los valida y llama a Gemini.
/// Mientras Gemini responde, muestra un indicador de carga.
/// Al terminar, navega a la pantalla de resultados.
///
/// Es StatefulWidget porque maneja estado: los valores de los
/// dropdowns y si está cargando o no.
/// ------------------------------------------------------------
class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  // "Llave" del formulario: nos permite validar todos los campos.
  final _formKey = GlobalKey<FormState>();

  // Controladores para leer el texto de los campos de escritura.
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _goalController = TextEditingController();

  // Valores seleccionados en los dropdowns (pueden ser nulos al inicio).
  String? _position;
  String? _level;

  // Indica si estamos esperando la respuesta de Gemini.
  bool _isLoading = false;

  // Listas de opciones para los dropdowns (datos fijos del taller).
  final List<String> _positions = [
    'Portero',
    'Defensa',
    'Mediocampista',
    'Delantero',
  ];
  final List<String> _levels = [
    'Principiante',
    'Intermedio',
    'Avanzado',
  ];

  // Instancia del servicio que habla con Gemini.
  final GeminiService _geminiService = GeminiService();

  // dispose: liberamos memoria de los controladores al salir.
  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _goalController.dispose();
    super.dispose();
  }

  /// Función que se ejecuta al presionar "Guardar jugador".
  ///
  /// Guarda únicamente la información del jugador en memoria y regresa
  /// a la pantalla anterior (ConsentChoice) sin llamar a Gemini.
  Future<void> _submit() async {
    // 1) Validamos el formulario. Si algún campo falla, salimos.
    if (!_formKey.currentState!.validate()) return;

    // 2) Activamos el indicador de carga.
    setState(() => _isLoading = true);

    // 3) Creamos el objeto Player con los datos del formulario.
    final player = Player(
      name: _nameController.text.trim(),
      age: int.parse(_ageController.text.trim()),
      position: _position!,
      level: _level!,
      goal: _goalController.text.trim(),
    );

    // 4) Guardamos el jugador en el array del repositorio.
    PlayerRepository.add(player);

    // 5) Apagamos carga y regresamos a la pantalla anterior.
    if (mounted) {
      setState(() => _isLoading = false);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registro del Jugador')),
      // Si está cargando mostramos el indicador; si no, el formulario.
      body: _isLoading ? _buildLoading() : _buildForm(),
    );
  }

  /// PANTALLA DE CARGA (Requerimiento 5).
  /// Muestra un CircularProgressIndicator y un mensaje informativo.
  Widget _buildLoading() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(color: AppColors.primary),
          SizedBox(height: 20),
          Text(
            'La IA está procesando tu consulta...',
            style: TextStyle(
              fontSize: 16,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  /// FORMULARIO con todos los campos y sus validaciones.
  Widget _buildForm() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --------------------- Nombre completo ---------------
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Nombre completo',
                prefixIcon: Icon(Icons.person_outline),
              ),
              // Validación: no puede estar vacío.
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'El nombre es obligatorio';
                }
                return null; // null = sin error
              },
            ),
            const SizedBox(height: 16),

            // ------------------------- Edad ----------------------
            TextFormField(
              controller: _ageController,
              keyboardType: TextInputType.number, // teclado numérico
              decoration: const InputDecoration(
                labelText: 'Edad',
                prefixIcon: Icon(Icons.cake_outlined),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'La edad es obligatoria';
                }
                // Intentamos convertir el texto a número.
                final age = int.tryParse(value.trim());
                if (age == null) {
                  return 'Ingresa un número válido';
                }
                // Regla del taller: edad mayor a 5 años.
                if (age <= 5) {
                  return 'La edad debe ser mayor a 5 años';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // -------------------- Posición (Dropdown) ------------
            DropdownButtonFormField<String>(
              value: _position,
              decoration: const InputDecoration(
                labelText: 'Posición de juego',
                prefixIcon: Icon(Icons.place_outlined),
              ),
              // Convertimos cada posición en una opción del menú.
              items: _positions
                  .map((p) => DropdownMenuItem(value: p, child: Text(p)))
                  .toList(),
              onChanged: (value) => setState(() => _position = value),
              validator: (value) =>
                  value == null ? 'Selecciona una posición' : null,
            ),
            const SizedBox(height: 16),

            // --------------------- Nivel (Dropdown) --------------
            DropdownButtonFormField<String>(
              value: _level,
              decoration: const InputDecoration(
                labelText: 'Nivel deportivo',
                prefixIcon: Icon(Icons.bar_chart_outlined),
              ),
              items: _levels
                  .map((l) => DropdownMenuItem(value: l, child: Text(l)))
                  .toList(),
              onChanged: (value) => setState(() => _level = value),
              validator: (value) =>
                  value == null ? 'Selecciona un nivel' : null,
            ),
            const SizedBox(height: 16),

            // ----------------- Objetivo de entrenamiento ---------
            TextFormField(
              controller: _goalController,
              maxLines: 3, // permite varias líneas
              decoration: const InputDecoration(
                labelText: 'Objetivo de entrenamiento',
                alignLabelWithHint: true,
                prefixIcon: Icon(Icons.flag_outlined),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'El objetivo es obligatorio';
                }
                return null;
              },
            ),
            const SizedBox(height: 28),

            // -------------------- Botón Guardar ------------------
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _submit,
                icon: const Icon(Icons.save_alt_outlined),
                label: const Text('Guardar jugador'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
