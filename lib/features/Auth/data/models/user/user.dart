import 'package:project_greduation/features/Auth/data/models/user/doctor.dart';

import 'student.dart';

class Usermodels {
  int? id;
  String? email;
  String? name;
  String? phone;
  String? role;
  DateTime? createdAt;
  DateTime? updatedAt;
  Student? student;
  Doctormodels? doctor;
  String? token;
  Usermodels(
      {this.id,
      this.email,
      this.name,
      this.phone,
      this.role,
      this.createdAt,
      this.updatedAt,
      this.student,
      this.token,
      this.doctor});

  factory Usermodels.fromJson(Map<String, dynamic> json) {
    var user = json['user'];
    return Usermodels(
        id: user['id'] as int?,
        doctor: user['doctor'] == null
            ? null
            : Doctormodels.fromJson(user['doctor'] as Map<String, dynamic>),
        email: user['email'] as String?,
        name: user['name'] as String?,
        phone: user['phone'] as String?,
        role: user['role'] as String?,
        createdAt: user['created_at'] == null
            ? null
            : DateTime.parse(user['created_at'] as String),
        updatedAt: user['updated_at'] == null
            ? null
            : DateTime.parse(user['updated_at'] as String),
        student: user['student'] == null
            ? null
            : Student.fromJson(user['student'] as Map<String, dynamic>),
        token: json['token']);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'name': name,
        'phone': phone,
        'role': role,
        'doctor': doctor?.toJson(),
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'student': student?.toJson(),
      };
}
