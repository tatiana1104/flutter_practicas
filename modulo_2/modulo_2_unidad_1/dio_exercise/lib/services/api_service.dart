import 'package:dio/dio.dart'; 
import 'package:pretty_dio_logger/pretty_dio_logger.dart'; 
 
class ApiService { 
  late final Dio _dio; 
  final CancelToken _cancelToken = CancelToken(); 
 
  ApiService() { 
    // 1. Configuración Global (BaseOptions) 
    BaseOptions options = BaseOptions( 
      baseUrl: 'https://jsonplaceholder.typicode.com', 
      connectTimeout: const Duration(seconds: 5), 
      receiveTimeout: const Duration(seconds: 3), 
      headers: { 
        'Content-Type': 'application/json', 
        'Accept': 'application/json', 
      }, 
    ); 
 
    _dio = Dio(options); 
 
    // 2. Interceptor de Logging (De terceros para mejor visualización) 
    _dio.interceptors.add(PrettyDioLogger( 
      requestHeader: true, 
      requestBody: true, 
      responseBody: true, 
      error: true, 
      compact: true, 
    )); 
 
    // 3. Interceptor Personalizado (Token y Reintentos) 
    _dio.interceptors.add( 
      InterceptorsWrapper( 
        onRequest: (options, handler) { 
          // Simulamos la inyección de un token de autorización 
          options.headers['Authorization'] = 'Bearer MI_TOKEN_SECRETO'; 
          print('Petición saliendo a: ${options.path}'); 
          return handler.next(options); 
        }, 
        onResponse: (response, handler) { 
          print(' Respuesta recibida de: ${response.requestOptions.path}'); 
          return handler.next(response); 
        }, 
        onError: (DioException e, handler) async { 
          print('x Error detectado: ${e.message}'); 
           
          // Lógica de Retry Automático para errores 408 o 500 
          if (e.response?.statusCode == 408 || e.response?.statusCode == 500) { 
            print(' Reintentando petición fallida...'); 
            try { 
              // Esperamos 2 segundos antes de reintentar 
              await Future.delayed(const Duration(seconds: 2)); 
              // Volvemos a ejecutar la misma petición usando las opciones originales 
              final response = await _dio.fetch(e.requestOptions); 
              return handler.resolve(response); 
            } catch (retryError) { 
              return handler.next(e); 
            } 
          } 
          return handler.next(e); 
        }, 
      ), 
    ); 
  } 
 
  // Método para obtener datos 
  Future<List<dynamic>> getPosts() async { 
    try { 
      final response = await _dio.get('/posts', cancelToken: _cancelToken); 
      return response.data; 
    } on DioException catch (e) { 
      _handleError(e); 
      rethrow; 
    } 
  } 
 
  // Método para simular un error 500 y probar el Retry 
  Future<void> simulateError500() async { 
    try { 
      // Endpoint irreal para forzar fallo o simular un servicio caído 
      await _dio.get('https://httpstat.us/500');  
    } on DioException catch (e) { 
      _handleError(e); 
    } 
  } 
 
  // Método para probar la cancelación 
  Future<void> getLongRequestAndCancel() async { 
    try { 
      // Iniciamos petición 
      _dio.get('/posts', cancelToken: _cancelToken); 
      // Cancelamos inmediatamente 
      _cancelToken.cancel(" Petición cancelada por el usuario"); 
    } on DioException catch (e) { 
      if (CancelToken.isCancel(e)) { 
        print("Manejo específico: La petición fue cancelada intencionalmente."); 
      } 
    } 
  } 
 
  // Centralización de manejo de errores 
  void _handleError(DioException e) { 
    switch (e.type) { 
      case DioExceptionType.connectionTimeout: 
        print("Error: Se agotó el tiempo de conexión."); 
        break; 
      case DioExceptionType.badResponse: 
        print("Error de servidor. Código: ${e.response?.statusCode}"); 
        break; 
      case DioExceptionType.cancel: 
        print("Error: Petición cancelada."); 
        break; 
      default: 
        print("Error de red desconocido: ${e.message}"); 
    } 
  } 
} 