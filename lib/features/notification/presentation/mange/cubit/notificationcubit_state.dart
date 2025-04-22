part of 'notificationcubit_cubit.dart';

@immutable
sealed class NotificationcubitState {}

final class NotificationcubitInitial extends NotificationcubitState {}

final class Notificationcubitloading extends NotificationcubitState {}

final class NotificationcubitSucess extends NotificationcubitState {
  final dynamic worning;

  NotificationcubitSucess({required this.worning});
}

final class Notificationcubitfailure extends NotificationcubitState {
  final String emassage;

  Notificationcubitfailure({required this.emassage});
}
