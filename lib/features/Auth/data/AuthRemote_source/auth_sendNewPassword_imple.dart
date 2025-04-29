import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:project_greduation/core/utils/errors/failure.dart';
import 'package:project_greduation/features/Auth/domain/repos/AuthRepos_SendNewPassword.dart';
import 'package:project_greduation/helper/api.dart';

class AuthSendnewpasswordImple implements AuthreposSendnewpassword {
  final Api api;

  AuthSendnewpasswordImple({required this.api});
  @override
  Future<Either<Failure, dynamic>> fetchNewPassword(
      {required String email,
      required String otp,
      required String password,
      required String confirm}) async {
    try {
      var data = await api.posts(
        path: "verify-otp-reset-password",
        data: {
          "email": email,
          "new_password": password,
          "new_password_confirmation": confirm,
          "otp": otp
        },
      );
      print(data.toString());

      

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
