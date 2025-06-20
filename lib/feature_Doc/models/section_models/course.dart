class Course {
  int? id;
  String? name;
  String? code;
  DateTime? createdAt;
  DateTime? updatedAt;

  Course({this.id, this.name, this.code, this.createdAt, this.updatedAt});

  factory Course.fromJson(Map<String, dynamic> json) => Course(
        id: json['id'] as int?,
        name: json['name'] as String?,
        code: json['code'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'code': code,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };
}
