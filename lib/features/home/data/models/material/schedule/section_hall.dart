class SectionHall {
  int? id;
  String? name;

  SectionHall({this.id, this.name});

  factory SectionHall.fromJson(Map<String, dynamic> json) => SectionHall(
        id: json['id'] as int?,
        name: json['name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
