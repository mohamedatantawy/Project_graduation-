import 'package:dartz/dartz.dart';
import 'package:project_greduation/core/utils/errors/failure.dart';

abstract class AuthsreposSendemail {
  Future<Either<Failure, dynamic>> fetchSendEmail({required String email});
}
