part of 'attandancedrewer_cubit.dart';

@immutable
sealed class AttandancedrewerState {}

final class AttandancedrewerInitial extends AttandancedrewerState {}

final class AttandancedrewerLoading extends AttandancedrewerState {}

final class AttandancedrewerSucess extends AttandancedrewerState {
  final List<Studentsfordrawermodels> students;

  AttandancedrewerSucess({required this.students});
}

final class AttandancedrewerFailure extends AttandancedrewerState {
  final String emassage;

  AttandancedrewerFailure({required this.emassage});
}
