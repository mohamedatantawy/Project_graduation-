import 'assistant.dart';
import 'section_hall.dart';

class Section {
  int? id;
  int? academicScheduleId;
  int? assistantId;
  int? sectionHallId;
  int? isSectionAttendanceOpen;
  String? sectionDay;
  String? sectionStartHour;
  String? sectionEndHour;
  dynamic createdAt;
  DateTime? updatedAt;
  Assistant? assistant;
  SectionHall? sectionHall;
  List? section_numbers;

  Section({
    this.id,
    this.section_numbers,
    this.academicScheduleId,
    this.assistantId,
    this.sectionHallId,
    this.isSectionAttendanceOpen,
    this.sectionDay,
    this.sectionStartHour,
    this.sectionEndHour,
    this.createdAt,
    this.updatedAt,
    this.assistant,
    this.sectionHall,
  });

  factory Section.fromJson(Map<String, dynamic> json) => Section(
        id: json['id'] as int?,
        section_numbers: json['section_numbers'] as List?,
        academicScheduleId: json['academic_schedule_id'] as int?,
        assistantId: json['assistant_id'] as int?,
        sectionHallId: json['section_hall_id'] as int?,
        isSectionAttendanceOpen: json['is_section_attendance_open'] as int?,
        sectionDay: json['section_day'] as String?,
        sectionStartHour: json['section_start_hour'] as String?,
        sectionEndHour: json['section_end_hour'] as String?,
        createdAt: json['created_at'] as dynamic,
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        assistant: json['assistant'] == null
            ? null
            : Assistant.fromJson(json['assistant'] as Map<String, dynamic>),
        sectionHall: json['section_hall'] == null
            ? null
            : SectionHall.fromJson(
                json['section_hall'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        "section_numbers":section_numbers,
        'academic_schedule_id': academicScheduleId,
        'assistant_id': assistantId,
        'section_hall_id': sectionHallId,
        'is_section_attendance_open': isSectionAttendanceOpen,
        'section_day': sectionDay,
        'section_start_hour': sectionStartHour,
        'section_end_hour': sectionEndHour,
        'created_at': createdAt,
        'updated_at': updatedAt?.toIso8601String(),
        'assistant': assistant?.toJson(),
        'section_hall': sectionHall?.toJson(),
      };
}
