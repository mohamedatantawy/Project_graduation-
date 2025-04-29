import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:project_greduation/core/utils/errors/failure.dart';
import 'package:project_greduation/features/notification/data/models/worningmodels.dart';
import 'package:project_greduation/features/notification/domain/Repos/notification_Remote_source.dart';
import 'package:project_greduation/helper/api.dart';

class NotificationRemoteSourceImple implements NotificationRemoteSource {
  final Api api;

  NotificationRemoteSourceImple({required this.api});
  @override
  Future<Either<Failure, Map<String,dynamic>>> fetchNotification({
    required String token,
  }) async {
    try {
      var data = await api.geta(path: "student/warnings", token: {
        'Authorization': 'Bearer $token', // Include the token here
      });
      //   Map<String,dynamic> subjectList ={};
      // List datamodels = data["warnings"];
      // //  print(datamodels.toString());
      // for (int i = 0; i < datamodels.length; i++) {
      //   subjectList.add(Worningmodels.fromJson(datamodels[i]));
      // }
      //  await Sharedperfernace.setString('token', token);
      print(data.toString());
      data["warnings"];
      return right(data["warnings"]);
    } catch (e) {
      if (e is DioException)
        return left(Serverfailure.fromdioerror(e));
      else {
        return left(Serverfailure(
          errormassage: e.toString(),
        ));
      }
    }
  }
}

// Future<List<Materialmodels>> getsubject({required String token}) async {
//   var data = await Api(Dio()).geta(
//       path:
//           "https://graduationa-project-production.up.railway.app/api/student/warnings/2?session_type=lecture",
//       token: {
//         'Authorization': 'Bearer $token', // Include the token here
//       });
//   List<Materialmodels> subjectList = [];
//   List datamodels = data["schedules"];
//   //  print(datamodels.toString());
//   for (int i = 0; i < datamodels.length; i++) {
//     subjectList.add(Materialmodels.fromJson(datamodels[i]));
//   }
//   await Sharedperfernace.setString('token', token);
//   // print(subjectList.length.toString());
//   return subjectList;
// }
