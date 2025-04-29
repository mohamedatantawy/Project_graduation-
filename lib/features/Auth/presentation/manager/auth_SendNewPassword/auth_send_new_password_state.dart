part of 'auth_send_new_password_cubit.dart';

@immutable
sealed class AuthSendNewPasswordState {}

final class AuthSendNewPasswordInitial extends AuthSendNewPasswordState {}

final class AuthSendNewPasswordloading extends AuthSendNewPasswordState {}

final class AuthSendNewPasswordSucess extends AuthSendNewPasswordState {
  final dynamic data;

  AuthSendNewPasswordSucess({required this.data});
}

final class AuthSendNewPasswordFailure extends AuthSendNewPasswordState {
  final String emassage;

  AuthSendNewPasswordFailure({required this.emassage});
}
