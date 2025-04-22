import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_greduation/features/notification/data/models/worningmodels.dart';
import 'package:project_greduation/features/notification/domain/Use_case/notification_Use_case.dart';

part 'notificationcubit_state.dart';

class NotificationcubitCubit extends Cubit<NotificationcubitState> {
  NotificationcubitCubit(this.notificationUseCase)
      : super(NotificationcubitInitial());
  final NotificationUseCase notificationUseCase;
  getworning({
    required String token,
  }) async {
    emit(Notificationcubitloading());
    var data = await notificationUseCase.call(
      token: token,
    );
    data.fold(
      (failure) {
        emit(Notificationcubitfailure(emassage: failure.errormassage));
      },
      (list) {
        emit(NotificationcubitSucess(worning: list));
      },
    );
  }
}
