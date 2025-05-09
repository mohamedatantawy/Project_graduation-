import 'package:dartz/dartz.dart';
import 'package:project_greduation/core/utils/errors/failure.dart';

abstract class AuthreposSendnewpassword {
  Future<Either<Failure, dynamic>> fetchNewPassword(
      {required String email,
      required String otp,
      required String password,
      required String confirm});
}
