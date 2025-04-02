part of 'auths_cubit.dart';

@immutable
sealed class AuthsState {}

final class AuthsInitial extends AuthsState {}

final class Authsloadinglogin extends AuthsState {}

final class Authsfailurelogin extends AuthsState {
  final String emassage;
  final User user;
  Authsfailurelogin(this.user, {required this.emassage});
}

final class AuthsSucesslogin extends AuthsState {
  final User user;

  AuthsSucesslogin({required this.user});
}

final class Authsloadingsendeamil extends AuthsState {}

final class Authsfailuresendemail extends AuthsState {
  final String emassage;

  Authsfailuresendemail({required this.emassage});
}

final class AuthsSucesssendemail extends AuthsState {
  final String email;

  AuthsSucesssendemail({required this.email});
}

final class Authsloadingotp extends AuthsState {}

final class Authsfailureotp extends AuthsState {
  final String emassage;

  Authsfailureotp({required this.emassage});
}

final class AuthsSucessotp extends AuthsState {
  final dynamic loginmodels;

  AuthsSucessotp({required this.loginmodels});
}

final class AuthsloadingReset extends AuthsState {}

final class AuthsfailureReset extends AuthsState {
  final String emassage;

  AuthsfailureReset({required this.emassage});
}

final class AuthsSucessReset extends AuthsState {
  // final dynamic loginmodels;

  //AuthsSucessReset({required this.loginmodels});
}
