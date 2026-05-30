import 'dart:convert'; //para usar jsonDecode
import 'package:http/http.dart' as http; //para hacer peticiones HTTP
import 'package:apirest/models/product.dart'; //para usar la clase Product

class ApiService {
  //definimpos la URL de la API
  static const String baseUrl = 'https://fakestoreapi.com';

  //método para obtener la lista de los productos
  Future<List<Product>> fetchProducts() async {
    //intentamos hacer la petición GET a la API
    final response = await http.get(Uri.parse('$baseUrl/products'));

    //verificar el codigo de estado (Status code)
    if (response.statusCode == 200) { 
      List<dynamic> jsonData = jsonDecode(response.body); //decodificamos el cuerpo de la respuesta (JSON) a una lista de objetos dinámicos
      
      return jsonData.map((item) => Product.fromJson(item)).toList();//mapeamos la lista de JSON a nuestra lista de objetos de Product
    
    } else {
    
      //manejo de errores
      throw Exception('Erros al cargar los productos: ${response.statusCode}');
    
    }
  }

  // Método para crear un producto
  Future<Product> createProduct(Product product) async { //recibe un objeto Product como parámetro
    final response = await http.post( //hacemos una petición POST a la API para crear un nuevo producto
      Uri.parse('$baseUrl/products'), //la URL de la API para crear productos
      headers: {'Content-Type': 'application/json'}, //especificamos que el contenido de la petición es JSON
      body: jsonEncode(product.toJson()), //convertimos el objeto Product a JSON usando el método toJson() y luego lo codificamos a una cadena JSON usando jsonEncode
    );

    if (response.statusCode == 201) { //si la respuesta tiene un código de estado 201 (Created), significa que el producto se creó correctamente
      return Product.fromJson(jsonDecode(response.body)); //decodificamos la respuesta JSON y creamos un objeto Product a partir de ella usando el constructor fromJson
    } else { //si la respuesta no tiene un código de estado 201, significa que hubo un error al crear el producto
      throw Exception('Error al crear el producto: ${response.statusCode}'); //lanzamos una excepción con el mensaje de error y el código de estado de la respuesta
    }
  }
}
