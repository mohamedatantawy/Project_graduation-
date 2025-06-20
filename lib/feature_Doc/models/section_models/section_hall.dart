class SectionHall {
  int? id;
  String? name;
  String? hallType;

  SectionHall({this.id, this.name, this.hallType});

  factory SectionHall.fromJson(Map<String, dynamic> json) => SectionHall(
        id: json['id'] as int?,
        name: json['name'] as String?,
        hallType: json['hall_type'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'hall_type': hallType,
      };
}
