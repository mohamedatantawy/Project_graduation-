import 'package:dartz/dartz.dart';
import 'package:project_greduation/core/utils/errors/failure.dart';

abstract class AuthreposSendotp {
  Future<Either<Failure, dynamic>> fetchSendOTP({required String email, required String otp});
}