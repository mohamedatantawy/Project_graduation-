part of 'changepassword_cubit.dart';

@immutable
sealed class ChangepasswordState {}

final class ChangepasswordInitial extends ChangepasswordState {}

final class Changepasswordloading extends ChangepasswordState {}

final class ChangepasswordSucess extends ChangepasswordState {
  final dynamic data;

  ChangepasswordSucess({required this.data});
}

final class ChangepasswordFailure extends ChangepasswordState {
  final String emassage;

  ChangepasswordFailure({required this.emassage});
}
