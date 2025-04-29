part of 'notificationcubit_cubit.dart';

@immutable
sealed class NotificationcubitState {}

final class NotificationcubitInitial extends NotificationcubitState {}

final class Notificationcubitloading extends NotificationcubitState {}

final class NotificationcubitSucess extends NotificationcubitState {
  final Map<String,dynamic> worning;
final List<String> keylist;
  NotificationcubitSucess( {required this.worning ,required this.keylist,});
}

final class Notificationcubitfailure extends NotificationcubitState {
  final String emassage;

  Notificationcubitfailure({required this.emassage});
}
