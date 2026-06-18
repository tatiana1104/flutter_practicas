/// ============================================================
///  MODELO: Player (Jugador)
/// ============================================================
/// Un "modelo" es una clase que representa los datos de la app.
/// Aquí guardamos toda la información que el usuario escribe en
/// el formulario de registro. Tener un modelo evita andar
/// pasando muchas variables sueltas entre pantallas.
/// ------------------------------------------------------------
class Player {
  final String name; // Nombre completo
  final int age; // Edad (número entero)
  final String position; // Posición de juego (Portero, Defensa, ...)
  final String level; // Nivel deportivo (Principiante, ...)
  final String goal; // Objetivo de entrenamiento

  // Recomendaciones que devolvió la IA para este jugador.
  // Es opcional (puede ir vacío) porque al crear el jugador,
  // todavía no tenemos la respuesta de Gemini.
  String recommendations;

  // Constructor: exige los datos del jugador.
  // "recommendations" tiene un valor por defecto ('') para no
  // obligar a pasarlo cuando aún no existe la respuesta de la IA.
  Player({
    required this.name,
    required this.age,
    required this.position,
    required this.level,
    required this.goal,
    this.recommendations = '',
  });

  /// Construye el texto (prompt) que se le enviará a Gemini.
  /// Aquí "armamos" la consulta con todos los datos del jugador
  /// y le pedimos a la IA exactamente las 4 secciones requeridas.
  String toPrompt() {
    return '''
Eres un entrenador deportivo profesional. A partir de la siguiente información de un jugador, genera recomendaciones personalizadas.

Datos del jugador:
- Nombre: $name
- Edad: $age años
- Posición: $position
- Nivel deportivo: $level
- Objetivo de entrenamiento: $goal

Responde en español, de forma clara y organizada usando los siguientes títulos exactos:

ANÁLISIS DEL JUGADOR:
(breve análisis según su posición, nivel y objetivo)

RECOMENDACIONES DE ENTRENAMIENTO:
(ejercicios y rutinas adecuadas)

CONSEJOS DE ALIMENTACIÓN:
(alimentación recomendada para su objetivo)

RECOMENDACIONES DE RECUPERACIÓN FÍSICA:
(descanso, estiramientos y prevención de lesiones)
''';
  }
}
