part of 'auth_login_cubit.dart';

@immutable
sealed class AuthLoginState {}

final class AuthLoginInitial extends AuthLoginState {}

final class AuthLoginLoading extends AuthLoginState {}

final class AuthLoginSucessStudent extends AuthLoginState {
  final User user;
 
  AuthLoginSucessStudent({required this.user, });
}

final class AuthLoginSucessDoctor extends AuthLoginState {
  final User user;
 
  AuthLoginSucessDoctor({required this.user, });
}
final class AuthLoginFailure extends AuthLoginState {
  final String emassage;

  AuthLoginFailure({required this.emassage});
}
