class Department {
  int? id;
  String? department;

  Department({this.id, this.department});

  factory Department.fromJson(Map<String, dynamic> json) => Department(
        id: json['id'] as int?,
        department: json['department'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'department': department,
      };
}
