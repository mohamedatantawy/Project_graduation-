class Student {
  int? id;
  int? grade;
  String? department;

  Student({this.id, this.grade, this.department});

  factory Student.fromJson(Map<String, dynamic> json) => Student(
        id: json['id'] as int?,
        grade: json['grade'] as int?,
        department: json['department'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'grade': grade,
        'department': department,
      };
}
