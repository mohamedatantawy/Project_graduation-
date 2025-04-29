part of 'auth_send_email_cubit.dart';

@immutable
sealed class AuthSendEmailState {}

final class AuthSendEmailInitial extends AuthSendEmailState {}

final class AuthSendEmailloading extends AuthSendEmailState {}

final class AuthSendEmailSucess extends AuthSendEmailState {
  final String email;
  final dynamic data;
  AuthSendEmailSucess({required this.email,required this.data});
}

final class AuthSendEmailFailure extends AuthSendEmailState {
  final String emassage;

  AuthSendEmailFailure({required this.emassage});
}
