// ============================================================
// SERVICIO API - app_productos
// ============================================================
// Este archivo contiene la conexión con la API de productos.
// URL Base: https://api.fgoga.com
//
// Endpoints disponibles:
//   - Autenticación: /api/register, /api/login
//   - Productos: /api/products (CRUD completo)
//
// Uso:
//   1. Crear instancia: final api = ApiService();
//   2. Login: await api.login(email: '...', password: '...');
//   3. Productos: await api.getProducts(), api.createProduct(), etc.
// ============================================================

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';
import '../models/product.dart';

class ApiService {
  // Singleton - instancia única compartida entre todas las pantallas
  static final ApiService _instance = ApiService._internal();
  factory ApiService() => _instance;
  
  // URL base de la API
  static const String baseUrl = 'https://api.fgoga.com/api';
  
  // Token de autenticación (se obtiene después del login)
  String? _token;
  String? _tokenType;

  ApiService._internal();

  // Headers para las peticiones HTTP
  // Incluye el token de autorización si está disponible
  Map<String, String> get _headers {
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    if (_token != null) {
      // Usar el token_type si está disponible, si no usar "Bearer"
      final prefix = _tokenType ?? 'Bearer';
      headers['Authorization'] = '$prefix $_token';
      print('Headers enviados: $headers');
    }
    return headers;
  }

  // ==================== AUTENTICACIÓN ====================

  /// Registrar un nuevo usuario en el sistema
  /// Envía: name, email, password
  /// Retorna: datos del usuario creado
  Future<Map<String, dynamic>> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/register'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'name': name,
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 201) {
        return {
          'success': true,
          'data': jsonDecode(response.body),
        };
      } else {
        return {
          'success': false,
          'error': jsonDecode(response.body),
        };
      }
    } catch (e) {
      return {
        'success': false,
        'error': e.toString(),
      };
    }
  }

  /// Iniciar sesión y obtener token JWT
  /// Envía: email, password
  /// Retorna: access_token para solicitudes autenticadas
  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      print('Login response status: ${response.statusCode}');
      print('Login response body: ${response.body}');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        
        // Verificar diferentes nombres de clave para el token
        _token = data['access_token'] ?? data['token'] ?? data['accessToken'];
        _tokenType = data['token_type']?.toString();
        
        print('Token guardado en login: $_token');
        print('Token type: $_tokenType');
        
        return {
          'success': true,
          'data': data,
        };
      } else {
        return {
          'success': false,
          'error': jsonDecode(response.body),
        };
      }
    } catch (e) {
      return {
        'success': false,
        'error': e.toString(),
      };
    }
  }

  /// Cerrar sesión
  /// Limpia el token de autenticación
  void logout() {
    _token = null;
  }

  /// Verificar si el usuario está autenticado
  bool get isAuthenticated => _token != null;

  // ==================== PRODUCTOS ====================

  /// Obtener todos los productos del usuario
  /// Requiere estar autenticado (token JWT)
  /// Retorna: Lista de productos
  Future<List<Product>> getProducts() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/products'),
        headers: _headers,
      );

      print('GetProducts response status: ${response.statusCode}');
      print('GetProducts response body: ${response.body}');

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((json) => Product.fromJson(json)).toList();
      } else {
        throw Exception('Error al obtener productos: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error de conexión: $e');
    }
  }

  /// Obtener un producto específico por su ID
  /// Requiere autenticación
  /// Retorna: Producto encontrado
  Future<Product> getProduct(int id) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/products/$id'),
        headers: _headers,
      );

      if (response.statusCode == 200) {
        return Product.fromJson(jsonDecode(response.body));
      } else if (response.statusCode == 404) {
        throw Exception('Producto no encontrado');
      } else {
        throw Exception('Error al obtener producto: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error de conexión: $e');
    }
  }

  /// Crear un nuevo producto
  /// Requiere autenticación
  /// Envía: name, description, price
  /// Retorna: Producto creado con su ID
  Future<Product> createProduct({
    required String name,
    required String description,
    required double price,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/products'),
        headers: _headers,
        body: jsonEncode({
          'name': name,
          'description': description,
          'price': price,
        }),
      );

      if (response.statusCode == 201) {
        return Product.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Error al crear producto: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error de conexión: $e');
    }
  }

  /// Actualizar un producto existente
  /// Requiere autenticación
  /// Envía: name, description, price
  /// Retorna: Producto actualizado
  Future<Product> updateProduct({
    required int id,
    required String name,
    required String description,
    required double price,
  }) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/products/$id'),
        headers: _headers,
        body: jsonEncode({
          'name': name,
          'description': description,
          'price': price,
        }),
      );

      if (response.statusCode == 200) {
        return Product.fromJson(jsonDecode(response.body));
      } else if (response.statusCode == 404) {
        throw Exception('Producto no encontrado');
      } else {
        throw Exception('Error al actualizar producto: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error de conexión: $e');
    }
  }

  /// Eliminar un producto
  /// Requiere autenticación
  /// Retorna: true si se eliminó correctamente
  Future<bool> deleteProduct(int id) async {
    try {
      final response = await http.delete(
        Uri.parse('$baseUrl/products/$id'),
        headers: _headers,
      );

      if (response.statusCode == 200) {
        return true;
      } else if (response.statusCode == 404) {
        throw Exception('Producto no encontrado');
      } else {
        throw Exception('Error al eliminar producto: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error de conexión: $e');
    }
  }
}
