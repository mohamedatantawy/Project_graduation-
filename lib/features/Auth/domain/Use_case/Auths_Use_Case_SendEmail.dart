import 'package:dartz/dartz.dart';
import 'package:project_greduation/core/utils/errors/failure.dart';
import 'package:project_greduation/features/Auth/domain/repos/authsRepos_sendEmail.dart';

class AuthsUseCaseSendemail {
  final AuthsreposSendemail authsreposSendemail;

  AuthsUseCaseSendemail({required this.authsreposSendemail});
  Future<Either<Failure, dynamic>> Call({required String email}) {
    return authsreposSendemail.fetchSendEmail(email: email);
  }
}
