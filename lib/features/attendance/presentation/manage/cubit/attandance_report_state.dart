part of 'attandance_report_cubit.dart';

@immutable
sealed class AttandanceReportState {}

final class AttandanceReportInitial extends AttandanceReportState {}

final class AttandanceReportloading extends AttandanceReportState {}

final class AttandanceReportSucess extends AttandanceReportState {
  final Reportattandancemodel reportattandancemodel;

  AttandanceReportSucess({required this.reportattandancemodel});
}

final class AttandanceReportFailure extends AttandanceReportState {
  final String emassage;

  AttandanceReportFailure({required this.emassage});
}
