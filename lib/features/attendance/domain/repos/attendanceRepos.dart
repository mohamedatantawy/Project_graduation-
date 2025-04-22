import 'package:dartz/dartz.dart';
import 'package:project_greduation/core/utils/errors/failure.dart';
import 'package:project_greduation/features/attendance/data/models/reportattandance/reportattandance.dart';

abstract class Attendance_Data_Source {
  Future<Either<Failure, Reportattandancemodel>> fetchReportattandance(
      {required String session, required int id, required String token});
}
/*
  Future<Reportattandancemodel> getReport(
      {required String session, required int id, required String token}) async {
    var data = await Api(Dio()).geta(
      token: {
        'Authorization': 'Bearer $token', // Include the token here
      },
      path:
          "student/attendance-history/$id?session_type=$session",
    );

    Reportattandancemodel subjectList;
    var datamodels = data;
    //  print(datamodels.toString());
    // for (int i = 0; i < datamodels.length; i++) {
    subjectList = Reportattandancemodel.fromJson(datamodels);
    // }
    print(subjectList.toString());
    return subjectList;
  }
}  */
