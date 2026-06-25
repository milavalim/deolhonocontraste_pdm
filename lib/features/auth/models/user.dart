/// Modelo que representa o usuário do sistema.
class User {
  final String id;
  final String name;
  final String email;
  final String? profileImageUrl;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.profileImageUrl,
  });

  /// Construtor para criar um usuário a partir de um JSON (vindo do backend PHP)
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'].toString(),
      name: json['name'],
      email: json['email'],
      profileImageUrl: json['image'],
    );
  }
}
