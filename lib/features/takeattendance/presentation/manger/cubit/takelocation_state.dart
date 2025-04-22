part of 'takelocation_cubit.dart';

@immutable
sealed class TakelocationState {}

final class TakelocationInitial extends TakelocationState {}

final class Takelocationloading extends TakelocationState {}

final class TakelocationSucess extends TakelocationState {}

final class TakelocationFailure extends TakelocationState {
  final String emassage;

  TakelocationFailure({required this.emassage});
}

final class Takelocationoutthecollege extends TakelocationState {
  final String emassage;

  Takelocationoutthecollege({required this.emassage});
}

final class TakelocationalrdayRegister extends TakelocationState {
  final String emassage;

  TakelocationalrdayRegister({required this.emassage});
}
