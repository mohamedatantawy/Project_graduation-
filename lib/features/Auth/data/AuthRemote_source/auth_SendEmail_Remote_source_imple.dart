import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:project_greduation/core/utils/errors/failure.dart';
import 'package:project_greduation/features/Auth/domain/repos/authsRepos_sendEmail.dart';
import 'package:project_greduation/helper/api.dart';

class AuthSendemailRemoteSourceImple implements AuthsreposSendemail {
  final Api api;

  AuthSendemailRemoteSourceImple({required this.api});
  @override
  Future<Either<Failure, dynamic>> fetchSendEmail(
      {required String email}) async {
    try {
      var data = await api.posts(
        path: "send-otp",
        data: {
          "email": email,
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
