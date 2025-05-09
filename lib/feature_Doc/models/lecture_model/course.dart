class Course {
  final int? id;
  final String? name;

  const Course({this.id, this.name});

  factory Course.fromJson(Map<String, dynamic> json) => Course(
        id: json['id'] as int?,
        name: json['name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };

  @override
  List<Object?> get props => [id, name];
}
