import 'package:project_greduation/features/home/data/models/material/schedule/schedule.dart';

import 'schedule.dart';

class Materialmodels {
  int? id;
  int? studentId;
  int? academicScheduleId;
  String? createdAt;
  Schedule? schedule;

  Materialmodels({
    this.id,
    this.studentId,
    this.academicScheduleId,
    this.createdAt,
    this.schedule,
  });

  factory Materialmodels.fromJson(Map<String, dynamic> json) => Materialmodels(
        id: json['id'] as int?,
        studentId: json['student_id'] as int?,
        academicScheduleId: json['academic_schedule_id'] as int?,
        createdAt: json['created_at'] as String?,
        schedule: json['schedule'] == null
            ? null
            : Schedule.fromJson(json['schedule'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'student_id': studentId,
        'academic_schedule_id': academicScheduleId,
        'created_at': createdAt,
        'schedule': schedule?.toJson(),
      };
}
