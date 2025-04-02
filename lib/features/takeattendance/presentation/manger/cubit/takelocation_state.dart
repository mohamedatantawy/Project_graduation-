part of 'takelocation_cubit.dart';

@immutable
sealed class TakelocationState {}

final class TakelocationInitial extends TakelocationState {}

final class Takelocationloading extends TakelocationState {}

final class TakelocationSucess extends TakelocationState {}

final class TakelocationFailure extends TakelocationState {}
