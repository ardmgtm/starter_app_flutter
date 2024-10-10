import 'user_role.dart';

class User {
  final int? id;
  final String username;
  final String name;
  final String? npk;
  final String? email;
  final List<UserRole>? roles;

  User({
    this.id,
    required this.username,
    required this.name,
    this.npk,
    this.email,
    this.roles,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int?,
      username: json['username'] as String,
      name: json['name'] as String,
      npk: json['npk'] as String?,
      email: json['email'] as String?,
      roles: (json['roles'] as List<dynamic>?)
          ?.map((role) => UserRole.fromJson(role as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'name': name,
      'npk': npk,
      'email': email,
      'roles': roles?.map((role) => role.toJson()).toList(),
    };
  }
}
