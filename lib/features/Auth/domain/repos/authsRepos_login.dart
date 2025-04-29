import 'package:dartz/dartz.dart';
import 'package:project_greduation/core/utils/errors/failure.dart';
import 'package:project_greduation/features/Auth/data/models/user/user.dart';

abstract class AuthsreposLogin {
  Future<Either<Failure, User>> fecthlogin( {required String email, required String password});

}
