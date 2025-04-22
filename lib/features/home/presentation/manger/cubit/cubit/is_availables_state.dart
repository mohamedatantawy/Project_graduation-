part of 'is_availables_cubit.dart';

@immutable
sealed class IsAvailablesState {}

final class IsAvailablesInitial extends IsAvailablesState {}

final class IsAvailablesloading extends IsAvailablesState {}

final class IsAvailablesSucuess extends IsAvailablesState {
  final bool isactive;

  IsAvailablesSucuess({required this.isactive});
}

final class IsAvailablesfailure extends IsAvailablesState {
  final String emassage;

  IsAvailablesfailure({required this.emassage});
}
