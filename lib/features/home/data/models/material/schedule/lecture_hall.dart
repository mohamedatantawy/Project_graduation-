class LectureHall {
  int? id;
  String? name;

  LectureHall({this.id, this.name});

  factory LectureHall.fromJson(Map<String, dynamic> json) => LectureHall(
        id: json['id'] as int?,
        name: json['name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
