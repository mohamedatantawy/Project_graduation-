class Studentsfordrawermodels {
  int? studentId;
  String? name;
  int? grade;
  String? department;
  int? totalPresent;
  int? totalAbsent;

  Studentsfordrawermodels({
    this.studentId,
    this.name,
    this.grade,
    this.department,
    this.totalPresent,
    this.totalAbsent,
  });

  factory Studentsfordrawermodels.fromJson(Map<String, dynamic> json) {
    return Studentsfordrawermodels(
      studentId: json['student_id'] as int?,
      name: json['name'] as String?,
      grade: json['grade'] as int?,
      department: json['department'] as String?,
      totalPresent: json['total_present'] as int?,
      totalAbsent: json['total_absent'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'student_id': studentId,
        'name': name,
        'grade': grade,
        'department': department,
        'total_present': totalPresent,
        'total_absent': totalAbsent,
      };
}
