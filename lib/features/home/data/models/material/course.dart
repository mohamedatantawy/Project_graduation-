class Course {
  int? id;
  String? name;

  Course({this.id, this.name});

  factory Course.fromJson(Map<String, dynamic> json) => Course(
        id: json['id'] as int?,
        name: json['name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
