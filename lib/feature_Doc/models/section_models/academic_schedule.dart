import 'course.dart';
import 'department.dart';

class AcademicSchedule {
  int? id;
  int? courseId;
  String? term;
  String? year;
  int? grade;
  int? departmentId;
  int? doctorId;
  int? lectureHallId;
  int? isLectureAttendanceOpen;
  String? lectureDay;
  String? lectureStartHour;
  String? lectureEndHour;
  dynamic createdAt;
  DateTime? updatedAt;
  Course? course;
  Department? department;

  AcademicSchedule({
    this.id,
    this.courseId,
    this.term,
    this.year,
    this.grade,
    this.departmentId,
    this.doctorId,
    this.lectureHallId,
    this.isLectureAttendanceOpen,
    this.lectureDay,
    this.lectureStartHour,
    this.lectureEndHour,
    this.createdAt,
    this.updatedAt,
    this.course,
    this.department,
  });

  factory AcademicSchedule.fromJson(Map<String, dynamic> json) {
    return AcademicSchedule(
      id: json['id'] as int?,
      courseId: json['course_id'] as int?,
      term: json['term'] as String?,
      year: json['year'] as String?,
      grade: json['grade'] as int?,
      departmentId: json['department_id'] as int?,
      doctorId: json['doctor_id'] as int?,
      lectureHallId: json['lecture_hall_id'] as int?,
      isLectureAttendanceOpen: json['is_lecture_attendance_open'] as int?,
      lectureDay: json['lecture_day'] as String?,
      lectureStartHour: json['lecture_start_hour'] as String?,
      lectureEndHour: json['lecture_end_hour'] as String?,
      createdAt: json['created_at'] as dynamic,
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      course: json['course'] == null
          ? null
          : Course.fromJson(json['course'] as Map<String, dynamic>),
      department: json['department'] == null
          ? null
          : Department.fromJson(json['department'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'course_id': courseId,
        'term': term,
        'year': year,
        'grade': grade,
        'department_id': departmentId,
        'doctor_id': doctorId,
        'lecture_hall_id': lectureHallId,
        'is_lecture_attendance_open': isLectureAttendanceOpen,
        'lecture_day': lectureDay,
        'lecture_start_hour': lectureStartHour,
        'lecture_end_hour': lectureEndHour,
        'created_at': createdAt,
        'updated_at': updatedAt?.toIso8601String(),
        'course': course?.toJson(),
        'department': department?.toJson(),
      };
}
