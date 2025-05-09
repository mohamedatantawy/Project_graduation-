import 'student.dart';
import 'user.dart';

class Yesattandancemodels {
  int? id;
  int? studentId;
  int? scheduleId;
  int? attendanceStatus;
  String? sessionType;
  String? attendAt;
  User? user;
  Student? student;

  Yesattandancemodels({
    this.id,
    this.studentId,
    this.scheduleId,
    this.attendanceStatus,
    this.sessionType,
    this.attendAt,
    this.user,
    this.student,
  });

  factory Yesattandancemodels.fromJson(Map<String, dynamic> json) {
    return Yesattandancemodels(
      id: json['id'] as int?,
      studentId: json['student_id'] as int?,
      scheduleId: json['schedule_id'] as int?,
      attendanceStatus: json['attendance_status'] as int?,
      sessionType: json['session_type'] as String?,
      attendAt: json['attend_at'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      student: json['student'] == null
          ? null
          : Student.fromJson(json['student'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'student_id': studentId,
        'schedule_id': scheduleId,
        'attendance_status': attendanceStatus,
        'session_type': sessionType,
        'attend_at': attendAt,
        'user': user?.toJson(),
        'student': student?.toJson(),
      };
}
