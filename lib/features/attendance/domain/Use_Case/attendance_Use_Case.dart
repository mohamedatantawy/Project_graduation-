import 'package:dartz/dartz.dart';
import 'package:project_greduation/core/utils/errors/failure.dart';
import 'package:project_greduation/features/attendance/data/models/reportattandance/attendance_record.dart';
import 'package:project_greduation/features/attendance/data/models/reportattandance/reportattandance.dart';
import 'package:project_greduation/features/attendance/domain/repos/attendanceRepos.dart';

class AttendanceUseCase {
  final Attendance_Data_Source attendance_data_source;

  AttendanceUseCase({required this.attendance_data_source});
  Future<Either<Failure, Reportattandancemodel>> call(
      {required String session, required int id, required String token}) {
    return attendance_data_source.fetchReportattandance(
        session: session, id: id, token: token);
  }
}
