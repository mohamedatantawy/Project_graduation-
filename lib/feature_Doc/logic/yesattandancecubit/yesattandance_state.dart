part of 'yesattandance_cubit.dart';

@immutable
sealed class YesattandanceState {}

final class YesattandanceInitial extends YesattandanceState {}

final class YesattandanceLoading extends YesattandanceState {}

final class YesattandanceSucess extends YesattandanceState {
  final List<Yesattandancemodels> students;
  final num present;
  YesattandanceSucess(this.present, {required this.students});
}

final class YesattandanceSucessshow extends YesattandanceState {
  final num present;
  YesattandanceSucessshow(
    this.present,
  );
}

final class Yesattandancefailure extends YesattandanceState {
  final String emassage;

  Yesattandancefailure({required this.emassage});
}
