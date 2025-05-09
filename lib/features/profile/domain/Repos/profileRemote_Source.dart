import 'package:dartz/dartz.dart';
import 'package:project_greduation/core/utils/errors/failure.dart';

abstract class ProfileremoteSource {
  Future<Either<Failure, dynamic>> changepassword(
      {required String token,
      required String oldpassword,
      required String newpassword,
      required String confrim});
}
