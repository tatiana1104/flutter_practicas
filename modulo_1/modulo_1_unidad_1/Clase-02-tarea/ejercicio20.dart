class Usuario {
  final int id;
  final String nombre;
  const Usuario({required this.id, required this.nombre});
}
class Comentario {
  final int id;
  final String texto;
  final int usuarioId;
  const Comentario({required this.id, required this.texto, required this.usuarioId});
}
List<String> obtenerComentariosFormateados(int postId) {
  List<Usuario> usuarios = [
    Usuario(id: 1, nombre: 'Ana'),
    Usuario(id: 2, nombre: 'Carlos'),
  ];
  List<Comentario> comentarios = [
    Comentario(id: 1, texto: '¡Genial!', usuarioId: 1),
    Comentario(id: 2, texto: 'De acuerdo.', usuarioId: 2),
  ];
  return comentarios.map((comentario) {
    Usuario usuario = usuarios.firstWhere((u) => u.id == comentario.usuarioId);
    return 'El usuario ${usuario.nombre} dijo: ${comentario.texto}';
  }).toList();
}
void main() {
  List<String> comentariosFormateados = obtenerComentariosFormateados(1);
  print(comentariosFormateados);
}