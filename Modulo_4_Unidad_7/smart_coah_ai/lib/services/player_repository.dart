import '../models/player.dart';

/// ============================================================
///  REPOSITORIO: PlayerRepository (Almacenamiento en memoria)
/// ============================================================
/// Aquí guardamos TODOS los jugadores registrados dentro de un
/// array (en Dart un array se llama "List").
///
/// Usamos miembros "static" para que el array sea ÚNICO y
/// COMPARTIDO en toda la app: no importa desde qué pantalla lo
/// llamemos, siempre accedemos a la misma lista.
///
/// IMPORTANTE: este almacenamiento es solo en memoria, por lo
/// que los datos se borran al cerrar la app. Es suficiente para
/// el alcance del taller (no se pide base de datos).
/// ------------------------------------------------------------
class PlayerRepository {
  // El array donde se guardan los jugadores. Empieza vacío.
  // "_" al inicio significa que es privado (no se toca de fuera).
  static final List<Player> _players = [];

  /// Agrega un jugador al array.
  static void add(Player player) {
    _players.add(player);
  }

  /// Devuelve la lista completa de jugadores guardados.
  /// Retornamos una copia (List.from) para que nadie modifique
  /// el array original por accidente desde fuera.
  static List<Player> getAll() {
    return List.from(_players);
  }

  /// Cantidad de jugadores registrados (útil para mostrar contadores).
  static int get count => _players.length;

  /// Borra todos los jugadores del array.
  static void clear() {
    _players.clear();
  }
}
