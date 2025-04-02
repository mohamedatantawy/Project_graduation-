class AttendanceRecord {
  int? id;
  int? studentId;
  int? scheduleId;
  int? attendanceStatus;
  String? sessionType;
  String? attendAt;

  AttendanceRecord({
    this.id,
    this.studentId,
    this.scheduleId,
    this.attendanceStatus,
    this.sessionType,
    this.attendAt,
  });

  factory AttendanceRecord.fromJson(Map<String, dynamic> json) {
    return AttendanceRecord(
      id: json['id'] as int?,
      studentId: json['student_id'] as int?,
      scheduleId: json['schedule_id'] as int?,
      attendanceStatus: json['attendance_status'] as int?,
      sessionType: json['session_type'] as String?,
      attendAt: json['attend_at'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'student_id': studentId,
        'schedule_id': scheduleId,
        'attendance_status': attendanceStatus,
        'session_type': sessionType,
        'attend_at': attendAt,
      };
}
