import 'package:flutter/material.dart'; 
import 'services/api_service.dart'; 
 
void main() { 
  runApp(const MyApp()); 
} 
 
class MyApp extends StatelessWidget { 
  const MyApp({super.key}); 
 
  @override 
  Widget build(BuildContext context) { 
    return MaterialApp( 
      title: 'Dio Pro', 
      theme: ThemeData(primarySwatch: Colors.blue), 
      home: const DioTestScreen(), 
    ); 
  } 
} 
 
class DioTestScreen extends StatefulWidget { 
  const DioTestScreen({super.key}); 
 
  @override 
  State<DioTestScreen> createState() => _DioTestScreenState(); 
} 
 
class _DioTestScreenState extends State<DioTestScreen> { 
  final ApiService apiService = ApiService(); 
  String _status = "Esperando acción..."; 
 
  void _fetchPosts() async { 
    setState(() => _status = "Cargando posts..."); 
    try { 
      final posts = await apiService.getPosts(); 
      setState(() => _status = "Éxito: ${posts.length} posts obtenidos."); 
    } catch (e) { 
      setState(() => _status = "Falló la petición."); 
    } 
  } 
 
  void _testRetry() async { 
    setState(() => _status = "Probando error 500 y retry... (Revisa consola)"); 
    await apiService.simulateError500(); 
    setState(() => _status = "Prueba de Retry finalizada."); 
  } 
 
  void _testCancel() async { 
    setState(() => _status = "Probando cancelación..."); 
    await apiService.getLongRequestAndCancel(); 
    setState(() => _status = "Petición cancelada."); 
  } 
 
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      appBar: AppBar(title: const Text("Clase: Dio Profesional")), 
      body: Padding( 
        padding: const EdgeInsets.all(20.0), 
        child: Column( 
          crossAxisAlignment: CrossAxisAlignment.stretch, 
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [ 
            Text( 
              _status, 
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold), 
              textAlign: TextAlign.center, 
            ), 
            const SizedBox(height: 40), 
            ElevatedButton( 
              onPressed: _fetchPosts, 
              child: const Text("1. Petición Normal (Get Posts)"), 
            ), 
            const SizedBox(height: 10), 
            ElevatedButton( 
              onPressed: _testRetry, 
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange), 
              child: const Text("2. Forzar Error 500 (Probar Interceptor Retry)"), 
            ), 
            const SizedBox(height: 10), 
            ElevatedButton( 
              onPressed: _testCancel, 
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red), 
              child: const Text("3. Probar Cancelación de Petición"), 
            ), 
          ], 
        ), 
      ), 
); 
} 
} 