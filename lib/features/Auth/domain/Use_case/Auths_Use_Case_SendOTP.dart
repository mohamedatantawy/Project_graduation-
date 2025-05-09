import 'package:dartz/dartz.dart';
import 'package:project_greduation/core/utils/errors/failure.dart';
import 'package:project_greduation/features/Auth/domain/repos/AuthRepos_SendOTP.dart';

class AuthsUseCaseSendotp {
  final AuthreposSendotp authreposSendotp;

  AuthsUseCaseSendotp({required this.authreposSendotp});
  Future<Either<Failure, dynamic>> Call(
      {required String email, required String otp}) {
    return authreposSendotp.fetchSendOTP(email: email, otp: otp);
  }
}
