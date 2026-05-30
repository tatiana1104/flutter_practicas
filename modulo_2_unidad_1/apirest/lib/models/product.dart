//clase

class Product {
  final int? id; // El ID puede ser nulo al crear un producto
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;

  Product({
    this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
  });

  // Constructor factory para crear un objeto Product desde JSON
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: (json['price'] as num).toDouble(),
      description: json['description'],
      category: json['category'],
      image: json['image'],
    );
  }

  // Método para convertir un objeto Product a JSON
  Map<String, dynamic> toJson() {
    return {
      'title': title, //el ID no se incluye al crear un producto, ya que la API lo asignará automáticamente
      'price': price, //el precio se convierte a un número, ya que la API espera un valor numérico
      'description': description, //la descripción se incluye como una cadena de texto
      'category': category, //la categoría se incluye como una cadena de texto
      'image': image, //la URL de la imagen se incluye como una cadena de texto
    };
  }
}

