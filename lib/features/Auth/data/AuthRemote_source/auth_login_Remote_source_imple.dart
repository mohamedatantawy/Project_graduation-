import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:project_greduation/core/utils/errors/failure.dart';
import 'package:project_greduation/features/Auth/data/models/user/user.dart';
import 'package:project_greduation/features/Auth/domain/repos/authsRepos_login.dart';
import 'package:project_greduation/helper/api.dart';

class AuthLoginRemoteSourceImple implements AuthsreposLogin {
  final Api api;

  AuthLoginRemoteSourceImple({required this.api});
  @override
  Future<Either<Failure, Usermodels>> fecthlogin(
      {required String email, required String password}) async {
    try {
      var data = await api.posts(
        path: "login",
        data: {
          "email": email,
          "password": password,
        },
      );
      print(data.toString());

      Usermodels user = Usermodels.fromJson(data);

      return right(user);
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
