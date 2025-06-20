part of 'counter_cubit.dart';

@immutable
sealed class CounterState {}

final class CounterInitial extends CounterState {}

final class Counterloading extends CounterState {}

final class CounterSucess extends CounterState {
  final num present;

  CounterSucess({required this.present});
}

final class Counterfailure extends CounterState {
  final String massage;

  Counterfailure({required this.massage});
}
