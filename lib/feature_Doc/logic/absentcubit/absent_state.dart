part of 'absent_cubit.dart';

@immutable
sealed class AbsentState {}

final class AbsentInitial extends AbsentState {}

final class Absentloading extends AbsentState {}

final class AbsentSucess extends AbsentState {
  final dynamic data;

  AbsentSucess({required this.data});
}

final class AbsentFailure extends AbsentState {
  final String emassage;

  AbsentFailure({required this.emassage});
}
