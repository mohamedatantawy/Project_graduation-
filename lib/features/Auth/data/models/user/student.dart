class Student {
  int? id;
  String? department;
  int? grade;
  int? code;
  int? national_id;


  Student({
    this.id,
    this.department,
    this.grade,
    this.code,
    this.national_id,
  
  });

  factory Student.fromJson(Map<String, dynamic> json) => Student(
        id: json['id'] as int?,
        department: json['department']['department'] as String?,
        grade: json['grade'] as int?,
        code:  json['code'] as int?,
        national_id:  json['national_id'] as int?,
       
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'department': department,
        'grade': grade,
        'code': code,
        'national_id': national_id,
        
      };
}
