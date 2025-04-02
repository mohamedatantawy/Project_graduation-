import 'attendance_record.dart';

class Reportattandancemodel {
  int? totalPresent;
  int? totalAbsent;
  List<AttendanceRecord>? attendanceRecords;

  Reportattandancemodel({
    this.totalPresent,
    this.totalAbsent,
    this.attendanceRecords,
  });

  factory Reportattandancemodel.fromJson(Map<String, dynamic> json) {
    return Reportattandancemodel(
      totalPresent: json['total_present'] as int?,
      totalAbsent: json['total_absent'] as int?,
      attendanceRecords: (json['attendance_records'] as List<dynamic>?)
          ?.map((e) => AttendanceRecord.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'total_present': totalPresent,
        'total_absent': totalAbsent,
        'attendance_records':
            attendanceRecords?.map((e) => e.toJson()).toList(),
      };
}
