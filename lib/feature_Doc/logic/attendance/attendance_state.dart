part of 'attendance_cubit.dart';

sealed class AttendanceState {
  const AttendanceState();

  @override
  List<Object> get props => [];
}

final class AttendanceInitial extends AttendanceState {}

final class AttendanceLoading extends AttendanceState {}

final class AttendanceSuccess extends AttendanceState {
  final String message;

  const AttendanceSuccess({required this.message});
}

final class AttendanceFailure extends AttendanceState {
  final String errMessage;

  const AttendanceFailure({required this.errMessage});
}
