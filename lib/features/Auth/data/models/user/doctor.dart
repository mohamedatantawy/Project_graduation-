class Doctormodels {
  final int id;
  final String department;

  Doctormodels({
    required this.id,
    required this.department,
  });

  factory Doctormodels.fromJson(Map<String, dynamic> json) {
    return Doctormodels(
      id: json['id'] as int,
      department: json['department']['department'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'department': department,
      };
}
