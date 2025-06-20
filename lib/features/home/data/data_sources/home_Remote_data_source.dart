import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:project_greduation/core/utils/errors/failure.dart';
import 'package:project_greduation/core/utils/sharedperfernace.dart';
import 'package:project_greduation/features/home/data/models/material/materialmodel.dart';
import 'package:project_greduation/features/home/domain/Repos/homeRepos.dart';
import 'package:project_greduation/helper/api.dart';

class HomeRemoteDataSourceImple implements HomeRemoteDataSource {
  final Api api;

  HomeRemoteDataSourceImple({required this.api});
  @override
  Future<Either<Failure, List<Materialmodels>>> fetchsubjects(
      {required String token}) async {
    try {
      var data = await api.geta(path: "student/schedules", token: {
        'Authorization': 'Bearer $token', // Include the token here
      });

      List<Materialmodels> subjectList = await getmodelslist(data, token);
      return right(subjectList);
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

  Future<List<Materialmodels>> getmodelslist(data, String token) async {
    List<Materialmodels> subjectList = [];

    for (var element in data["schedules"]) {
      subjectList.add(Materialmodels.fromJson(element));
    }
    await Sharedperfernace.setString('token', token);

    return subjectList;
  }

  @override
  Future<Either<Failure, bool>> isavailablesubject(
      {required String token, required int id, required String session}) async {
    try {
      var data = await api.geta(///api/student/schedules/1/attendance/available

          path: "student/schedules/$id/attendance/available?session_type=$session",
          token: {
            'Authorization': 'Bearer $token', // Include the token here
          });

      if (data['message'] == "attendance is available for this course now") {
        return right(true);
      } else {
        return right(false);
      }
    } catch (e) {
      if (e is DioException)
        return left(Serverfailure.fromdioerror(e));
      else {
        return left(Serverfailure(
          errormassage: e.toString(),
        ));
      }
    }
    /* Future<bool> Is_available(
      {required String session, required String token,required int id}) async {
    var data = await Api(Dio()).geta(
      token: {
        'Authorization': 'Bearer $token', // Include the token here
      },
      path:
          "student/is-attendance-available/$id?session_type=$session",
    );

    
    if (data['message'] == "attendance is available for this course now") {
      return true;
    } else {
      return false;
    }
    // print(subjectList.length.toString());
    //return data;
  } */
  }
}
