import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:project_greduation/core/utils/errors/failure.dart';
import 'package:project_greduation/features/attendance/data/models/reportattandance/reportattandance.dart';
import 'package:project_greduation/features/attendance/domain/repos/attendanceRepos.dart';
import 'package:project_greduation/helper/api.dart';

class AttendanceRemoteSourceImple implements Attendance_Data_Source {
  final Api api;

  AttendanceRemoteSourceImple({required this.api});
  @override
  Future<Either<Failure, Reportattandancemodel>> fetchReportattandance(
      {required String session, required int id, required String token}) async {
    try {
      var data = await api.geta(
        token: {
          'Authorization': 'Bearer $token', // Include the token here
        },///api/student/schedules/1/attendance/history

        path: "student/schedules/$id/attendance/history?session_type=$session",
      );

      Reportattandancemodel subjectList;
      var datamodels = data;

      subjectList = Reportattandancemodel.fromJson(datamodels);

      print(subjectList.toString());
      return right(subjectList);
    } catch (e) {
      if (e is DioException) {
        return left(Serverfailure.fromdioerror(e));
      } else {
        return left(Serverfailure(
          errormassage: e.toString(),
        ));
      }
    }
  }
}
