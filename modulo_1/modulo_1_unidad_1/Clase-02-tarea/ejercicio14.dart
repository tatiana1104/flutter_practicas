class Configuracion {
  final String urlApi;
  final String modo;
  final int timeout;
  const Configuracion({required this.urlApi, required this.modo, required this.timeout});
}
void main() {
  Configuracion config = Configuracion(urlApi: 'https://api.example.com', modo: 'light', timeout: 30);
}