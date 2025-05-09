import 'package:dartz/dartz.dart';
import 'package:project_greduation/core/utils/errors/failure.dart';
import 'package:project_greduation/features/Auth/domain/repos/AuthRepos_SendNewPassword.dart';

class AuthUseCaseSendnewpassword {
  final AuthreposSendnewpassword authreposSendnewpassword;

  AuthUseCaseSendnewpassword({required this.authreposSendnewpassword});
  Future<Either<Failure, dynamic>> Call(
      {required String email,
      required String otp,
      required String password,
      required String confirm}) {
    return authreposSendnewpassword.fetchNewPassword(
        confirm: confirm, email: email, otp: otp, password: password);
  }
}
