part of 'auth_send_otp_cubit.dart';

@immutable
sealed class AuthSendOtpState {}

final class AuthSendOtpInitial extends AuthSendOtpState {}

final class AuthSendOtploading extends AuthSendOtpState {}

final class AuthSendOtpSucess extends AuthSendOtpState {
  final String email;
  final String otp;
  final dynamic data;

  AuthSendOtpSucess({required this.email,required this.data, required this.otp});
}

final class AuthSendOtpfailure extends AuthSendOtpState {
  final String emassage;

  AuthSendOtpfailure({required this.emassage});
}
