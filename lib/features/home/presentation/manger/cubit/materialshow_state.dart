part of 'materialshow_cubit.dart';

@immutable
sealed class MaterialshowState {}

final class MaterialshowInitial extends MaterialshowState {}

final class Materialshowloading extends MaterialshowState {}

final class MaterialshowSucess extends MaterialshowState {
  final List<Materialmodels> data;

  MaterialshowSucess({required this.data});
}

final class Materialshowfailure extends MaterialshowState {
  final String emassage;

  Materialshowfailure({required this.emassage});
}
