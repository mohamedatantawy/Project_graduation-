part of 'present_student_cubit.dart';

@immutable
sealed class PresentStudentState {}

final class PresentStudentInitial extends PresentStudentState {}

final class PresentStudentloading extends PresentStudentState {}

final class PresentStudentSucess extends PresentStudentState {
    final dynamic data;

  PresentStudentSucess({required this.data});
}

final class PresentStudentfailure extends PresentStudentState {
  final String emessage;

  PresentStudentfailure({required this.emessage});
}
