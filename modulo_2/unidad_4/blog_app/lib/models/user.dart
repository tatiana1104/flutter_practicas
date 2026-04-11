class User {
  final String id;
  final String name;
  final String username;
  final String email;
  final String phone;
  final String company;
  final String address;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.company,
    required this.address,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      name: json['name'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      company: json['company']['name'] as String,
      address: json['address']['street'] as String,
    );
  }
}