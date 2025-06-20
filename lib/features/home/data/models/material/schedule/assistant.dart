import 'user.dart';

class Assistant {
  int? id;
  int? departmentId;
  dynamic createdAt;
  DateTime? updatedAt;
  User? user;

  Assistant({
    this.id,
    this.departmentId,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  factory Assistant.fromJson(Map<String, dynamic> json) => Assistant(
        id: json['id'] as int?,
        departmentId: json['department_id'] as int?,
        createdAt: json['created_at'] as dynamic,
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'department_id': departmentId,
        'created_at': createdAt,
        'updated_at': updatedAt?.toIso8601String(),
        'user': user?.toJson(),
      };
}
