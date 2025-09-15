part of 'get_absent_cubit.dart';

@immutable
sealed class GetAbsentState {}

final class GetAbsentInitial extends GetAbsentState {}

final class GetAbsentLoading extends GetAbsentState {}

final class GetAbsentSucess extends GetAbsentState {
 final List<Yesattandancemodels> data;

  GetAbsentSucess({required this.data});
}

final class GetAbsentFailure extends GetAbsentState {
  final String emassage;

  GetAbsentFailure({required this.emassage});
}
