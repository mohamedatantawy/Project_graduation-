import 'package:dartz/dartz.dart';
import 'package:project_greduation/core/utils/errors/failure.dart';
import 'package:project_greduation/features/Auth/data/models/user/user.dart';
import 'package:project_greduation/features/Auth/domain/repos/authsRepos_login.dart';

class AuthsUseCaseLogin {
  final AuthsreposLogin authsreposlogin;

  AuthsUseCaseLogin({required this.authsreposlogin});
  Future<Either<Failure, Usermodels>> Call(
      {required String email, required String password}) async {
    var data = authsreposlogin.fecthlogin(email: email, password: password);

    //premissin
    return authsreposlogin.fecthlogin(email: email, password: password);
  }
}
