class Product {
  final int? id;
  final String name;
  final String description;
  final double price;

  Product({
    this.id,
    required this.name,
    required this.description,
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    // Manejar price que puede venir como double, int o String
    dynamic priceValue = json['price'];
    double price;
    
    if (priceValue is String) {
      price = double.tryParse(priceValue) ?? 0.0;
    } else if (priceValue is num) {
      price = priceValue.toDouble();
    } else {
      price = 0.0;
    }
    
    return Product(
      id: json['id'] as int?,
      name: json['name'] as String,
      description: json['description'] as String,
      price: price,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
    };
  }
}
