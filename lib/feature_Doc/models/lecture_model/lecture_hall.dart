class LectureHall {
  final int? id;
  final String? name;
  final int? numberOfChairsOrBenchesOrComputers;

  const LectureHall({
    this.id,
    this.name,
    this.numberOfChairsOrBenchesOrComputers,
  });

  factory LectureHall.fromJson(Map<String, dynamic> json) => LectureHall(
        id: json['id'] as int?,
        name: json['name'] as String?,
        numberOfChairsOrBenchesOrComputers:
            json['number_of_chairs_or_benches_or_computers'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'number_of_chairs_or_benches_or_computers':
            numberOfChairsOrBenchesOrComputers,
      };
}
