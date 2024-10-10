import 'user_permission.dart';

class UserRole {
  final int? id;
  final String name;
  final List<UserPermission>? permissions;

  UserRole({
    this.id,
    required this.name,
    this.permissions,
  });

  factory UserRole.fromJson(Map<String, dynamic> json) {
    return UserRole(
      id: json['id'] as int?,
      name: json['name'] as String,
      permissions: (json['permissions'] as List<dynamic>?)
          ?.map((e) => UserPermission.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'permissions': permissions?.map((e) => e.toJson()).toList(),
    };
  }
}
