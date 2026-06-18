import 'package:flutter/material.dart';
import '../models/player.dart';
import '../services/player_repository.dart';
import '../theme/app_colors.dart';
import 'results_screen.dart';

/// ============================================================
///  PANTALLA: Historial de Jugadores (HistoryScreen)
/// ============================================================
/// Muestra TODOS los jugadores guardados en el array del
/// PlayerRepository. Si tocamos uno, vamos a ver sus resultados.
///
/// Es StatefulWidget porque la lista puede cambiar (por ejemplo,
/// si borramos el historial) y necesitamos redibujar con setState.
/// ------------------------------------------------------------
class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    // Leemos el array de jugadores guardados.
    final List<Player> players = PlayerRepository.getAll();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Jugadores registrados'),
        actions: [
          // Botón para borrar todo el historial (solo si hay datos).
          if (players.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.delete_outline),
              tooltip: 'Borrar historial',
              onPressed: () {
                PlayerRepository.clear();
                // setState vuelve a dibujar la pantalla ya vacía.
                setState(() {});
              },
            ),
        ],
      ),
      // Si el array está vacío mostramos un mensaje; si no, la lista.
      body: players.isEmpty ? _buildEmpty() : _buildList(players),
    );
  }

  /// Mensaje que se muestra cuando todavía no hay jugadores.
  Widget _buildEmpty() {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.group_off_outlined,
                size: 64, color: AppColors.textSecondary),
            SizedBox(height: 16),
            Text(
              'Aún no hay jugadores registrados.\n'
              'Completa el formulario para agregar el primero.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: AppColors.textSecondary),
            ),
          ],
        ),
      ),
    );
  }

  /// Lista de jugadores. ListView.builder es eficiente porque
  /// solo construye los elementos visibles en pantalla.
  Widget _buildList(List<Player> players) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: players.length,
      itemBuilder: (context, index) {
        final player = players[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: AppColors.primary,
              // Mostramos un número (la posición en el array + 1).
              child: Text(
                '${index + 1}',
                style: const TextStyle(color: AppColors.onPrimary),
              ),
            ),
            title: Text(player.name),
            subtitle: Text(
              '${player.position} · ${player.level} · ${player.age} años',
            ),
            trailing: const Icon(Icons.chevron_right),
            // Al tocar, abrimos los resultados guardados de ese jugador.
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsScreen(
                    player: player,
                    aiResponse: player.recommendations,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
