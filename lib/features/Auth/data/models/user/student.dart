class Student {
  int? id;
  String? department;
  int? grade;
  String? dateOfBirth;
  String? address;

  Student({
    this.id,
    this.department,
    this.grade,
    this.dateOfBirth,
    this.address,
  });

  factory Student.fromJson(Map<String, dynamic> json) => Student(
        id: json['id'] as int?,
        department: json['department'] as String?,
        grade: json['grade'] as int?,
        dateOfBirth: json['date_of_birth'] as String?,
        address: json['address'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'department': department,
        'grade': grade,
        'date_of_birth': dateOfBirth,
        'address': address,
      };
}
