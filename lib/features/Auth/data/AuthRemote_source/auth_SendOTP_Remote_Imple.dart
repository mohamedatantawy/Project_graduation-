import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:project_greduation/core/utils/errors/failure.dart';
import 'package:project_greduation/features/Auth/domain/repos/AuthRepos_SendOTP.dart';
import 'package:project_greduation/helper/api.dart';

class AuthSendotpRemoteImple implements AuthreposSendotp {
  final Api api;

  AuthSendotpRemoteImple({required this.api});
  @override
  Future<Either<Failure, dynamic>> fetchSendOTP(
      {required String email, required String otp}) async {
    try {
      var data = await api.posts(
        path: "verify-otp",
        data: {
          "email": email,
          "otp": otp,
        },
      );
      print(data.toString());

      //User user = User.fromJson(data);
      return right(data);
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
