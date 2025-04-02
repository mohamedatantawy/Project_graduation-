part of 'is_availables_cubit.dart';

@immutable
sealed class IsAvailablesState {}

final class IsAvailablesInitial extends IsAvailablesState {}

final class IsAvailablesloading extends IsAvailablesState {}

final class IsAvailablesSucuess extends IsAvailablesState {}

final class IsAvailablesfailure extends IsAvailablesState {}
