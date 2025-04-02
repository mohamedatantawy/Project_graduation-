import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:project_greduation/core/utils/errors/failure.dart';
import 'package:project_greduation/core/utils/sharedperfernace.dart';
import 'package:project_greduation/features/home/data/models/material/materialmodel.dart';
import 'package:project_greduation/helper/api.dart';

abstract class HomeRemoteDataSource {
  Future<Either<Failure,List<Materialmodels>>> fetchsubjects({required String token});
}

class HomeRemoteDataSourceImple implements HomeRemoteDataSource {
  final Api api;

  HomeRemoteDataSourceImple({required this.api});
  @override
  Future<Either<Failure,List<Materialmodels>>> fetchsubjects(
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
        return left(Serverfailure( errormassage: e.toString(),));
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
}
