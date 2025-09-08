import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:project_greduation/core/utils/errors/failure.dart';
import 'package:project_greduation/core/utils/sharedperfernace.dart';
import 'package:project_greduation/features/home/data/data_sources/home_Remote_data_source.dart';
import 'package:project_greduation/features/home/data/models/material/materialmodel.dart';
import 'package:project_greduation/features/home/domain/Repos/homeRepos.dart';
import 'package:project_greduation/helper/api.dart';

class Repoimplehome extends HomeRepoDataSource {
  final HomeRemoteDataSource homeRemoteDataSource;
  Repoimplehome(
    this.homeRemoteDataSource,
  );
  Future<Either<Failure, List<Materialmodels>>> fetchsubjects(
      {required String token}) async {
    try {
      var data = await homeRemoteDataSource.fetchsubjects(token: token);
       print(data.toString());
      if (data['message'] ==  "must change password first")
      {
 return left(Serverfailure(errormassage: data['message'] ));
      }else {
       List<Materialmodels> subjectList = await getmodelslist(data, token);
      return right(subjectList);
      }
  return right(data);
       List<Materialmodels> subjectList = await getmodelslist(data, token);
     
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
    // final HomeRemoteDataSource homeRemoteDataSource;
    try {
      var data = await homeRemoteDataSource.isavailablesubject(
          token: token, id: id, session: session);
      return right(data);
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
