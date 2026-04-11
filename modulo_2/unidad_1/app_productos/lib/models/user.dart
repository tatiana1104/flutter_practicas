class User {
  final int? id;
  final String name;
  final String email;
  final String? password;

  User({
    this.id,
    required this.name,
    required this.email,
    this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    // Manejar campos que pueden venir como diferentes tipos
    dynamic nameValue = json['name'];
    dynamic emailValue = json['email'];
    
    return User(
      id: json['id'] as int?,
      name: nameValue?.toString() ?? '',
      email: emailValue?.toString() ?? '',
      password: json['password'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
    };
  }
}
