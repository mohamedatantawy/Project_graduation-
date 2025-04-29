part of 'is_availables_cubit.dart';

@immutable
sealed class IsAvailablesState {}

final class IsAvailablesInitial extends IsAvailablesState {}

final class IsAvailablesloading extends IsAvailablesState {}

final class IsAvailablesSucuessLecture extends IsAvailablesState {
  final bool isactive;

  IsAvailablesSucuessLecture({required this.isactive});
}

final class IsAvailablesSucuessSection extends IsAvailablesState {
  final bool isactive;

  IsAvailablesSucuessSection({required this.isactive});
}

final class IsAvailablesfailure extends IsAvailablesState {
  final String emassage;

  IsAvailablesfailure({required this.emassage});
}
