import 'package:flutter/material.dart';
import 'package:apirest/models/product.dart';
import 'package:apirest/services/api_service.dart';

class CreateProductScreen extends StatefulWidget {
  @override
  _CreateProductScreenState createState() => _CreateProductScreenState();
}

// Pantalla para crear un nuevo producto
class _CreateProductScreenState extends State<CreateProductScreen> { //estado de la pantalla para manejar el formulario y la lógica de creación de productos
  final _formKey = GlobalKey<FormState>(); //clave para el formulario, nos permite validar los campos y manejar el estado del formulario
  final _titleController = TextEditingController(); //controlador para el campo de texto del título, nos permite obtener el valor ingresado por el usuario y manejar su estado
  final _priceController = TextEditingController(); //controlador para el campo de texto del precio, nos permite obtener el valor ingresado por el usuario y manejar su estado
  final _descriptionController = TextEditingController(); //controlador para el campo de texto de la descripción, nos permite obtener el valor ingresado por el usuario y manejar su estado
  final _categoryController = TextEditingController(); //controlador para el campo de texto de la categoría, nos permite obtener el valor ingresado por el usuario y manejar su estado
  final _imageController = TextEditingController(); //controlador para el campo de texto de la URL de la imagen, nos permite obtener el valor ingresado por el usuario y manejar su estado
  final ApiService _apiService = ApiService(); //instancia de la clase ApiService para hacer las peticiones a la API

  @override
  void dispose() { //método dispose para limpiar los controladores cuando la pantalla se destruye, evitando fugas de memoria
    _titleController.dispose(); 
    _priceController.dispose(); 
    _descriptionController.dispose(); 
    _categoryController.dispose();
    _imageController.dispose();
    super.dispose();
  }

  //método para manejar la creación del producto cuando se envía el formulario
  void _createProduct() async {
    if (_formKey.currentState!.validate()) { //validamos el formulario, si es válido, procedemos a crear el producto
      final product = Product(
        title: _titleController.text,
        price: double.parse(_priceController.text),
        description: _descriptionController.text,
        category: _categoryController.text,
        image: _imageController.text,
      );

      try { //intentamos crear el producto usando el método createProduct de ApiService
        final createdProduct = await _apiService.createProduct(product);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Producto creado: ${createdProduct.title}')),
        );
        Navigator.pop(context);
      } catch (e) { //si ocurre un error durante la creación del producto, mostramos un mensaje de error usando ScaffoldMessenger
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al crear el producto: $e')),
        );
      }
    }
  }

  //método build para construir la interfaz de usuario de la pantalla de creación de productos, incluye un formulario con campos para el título, precio, descripción, categoría y URL de la imagen, y un botón para enviar el formulario y crear el producto
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crear Producto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Título'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese un título';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _priceController,
                decoration: InputDecoration(labelText: 'Precio'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese un precio';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Por favor ingrese un número válido';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Descripción'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese una descripción';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _categoryController,
                decoration: InputDecoration(labelText: 'Categoría'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese una categoría';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _imageController,
                decoration: InputDecoration(labelText: 'URL de la Imagen'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese una URL de imagen';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _createProduct,
                child: Text('Crear Producto'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}