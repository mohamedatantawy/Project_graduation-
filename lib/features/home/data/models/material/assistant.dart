import 'user.dart';

class Assistant {
  int? id;
  String? department;
  dynamic createdAt;
  dynamic updatedAt;
  User? user;

  Assistant({
    this.id,
    this.department,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  factory Assistant.fromJson(Map<String, dynamic> json) => Assistant(
        id: json['id'] as int?,
        department: json['department'] as String?,
        createdAt: json['created_at'] as dynamic,
        updatedAt: json['updated_at'] as dynamic,
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'department': department,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'user': user?.toJson(),
      };
}
