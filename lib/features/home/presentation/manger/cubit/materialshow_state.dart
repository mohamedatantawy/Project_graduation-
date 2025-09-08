part of 'materialshow_cubit.dart';

@immutable
sealed class MaterialshowState {}

final class MaterialshowInitial extends MaterialshowState {}

final class Materialshowloading extends MaterialshowState {}

final class MaterialshowSucess extends MaterialshowState {
  final List<Materialmodels> data;

  MaterialshowSucess({required this.data});
}

final class MaterialshowFirst extends MaterialshowState {
  final String token;

  MaterialshowFirst({required this.token});

}

final class Materialshowfailure extends MaterialshowState {
  final String emassage;

  Materialshowfailure({required this.emassage});
}
