class Post {
  final String id;
  final String title;
  final String body;
  final String userId;

  Post({
    required this.id,
    required this.title,
    required this.body,
    required this.userId,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] as String,
      title: json['title'] as String,
      body: json['body'] as String,
      userId: json['userId'] as String,
    );
  }
}