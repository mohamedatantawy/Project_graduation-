class Assistant {
  final int id;
  final String department;

  Assistant({
    required this.id,
    required this.department,
  });

  factory Assistant.fromJson(Map<String, dynamic> json) {
    return Assistant(
      id: json['id'] as int,
      department: json['department'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'department': department,
      };
}
