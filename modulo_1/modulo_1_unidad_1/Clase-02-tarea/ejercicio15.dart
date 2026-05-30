class Configuracion {
  final String urlApi;
  final String modo;
  final int timeout;
  const Configuracion({required this.urlApi, required this.modo, required this.timeout});
  Configuracion copyWith({String? urlApi, String? modo, int? timeout}) {
    return Configuracion(
      urlApi: urlApi ?? this.urlApi,
      modo: modo ?? this.modo,
      timeout: timeout ?? this.timeout,
    );
  }
}
void main() {
  Configuracion configInicial = Configuracion(urlApi: 'https://api.example.com', modo: 'light', timeout: 30);
  Configuracion configModoOscuro = configInicial.copyWith(modo: 'dark');
  print(configInicial.modo);
  print(configModoOscuro.modo);
}