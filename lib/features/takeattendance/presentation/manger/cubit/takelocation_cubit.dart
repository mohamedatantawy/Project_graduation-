import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:project_greduation/core/utils/api/Apiserverce.dart';
import 'package:project_greduation/features/takeattendance/domain/Use_case/takeattandance_Use_case.dart';

part 'takelocation_state.dart';

class TakelocationCubit extends Cubit<TakelocationState> {
  TakelocationCubit(this.takeattandanceUseCase) : super(TakelocationInitial());
  final TakeattandanceUseCase takeattandanceUseCase;
  getlocationmothed(
      {required String session,
      required int id,
      required String token,
      required String latitude,
      required String longitude}) async {
    emit(Takelocationloading());

    var data = await takeattandanceUseCase.call(
        id: id,
        latitude: latitude,
        longitude: longitude,
        session: session,
        token: token);
    data.fold((failure) {
      if (failure.errormassage == 'you are not in college') {
        emit(Takelocationoutthecollege(emassage: failure.errormassage));
      } else if (failure.errormassage == "attendance is already registered") {
        emit(TakelocationalrdayRegister(emassage: failure.errormassage));
      } else if (failure.errormassage == 'schedule not found') {
        emit(TakelocationFailure(emassage: failure.errormassage));
      } else if (failure.errormassage ==
          'the student has not registered for this course') {
        emit(TakelocationFailure(emassage: failure.errormassage));
      } else if (failure.errormassage ==
          'the doctor did not open the attendance today') {
        emit(TakelocationFailure(emassage: failure.errormassage));
      } else {
        emit(TakelocationFailure(emassage: failure.errormassage));
      }
    }, (data) {
      print(data.toString());

      if (data['message'] == 'you are not in college') {
        emit(Takelocationoutthecollege(emassage: data['message']));
      } else if (data['message'] == "attendance is already registered") {
        emit(TakelocationalrdayRegister(emassage: data['message']));
      } else if (data['message'] == 'attendance is registered') {
        emit(TakelocationSucess());
      } else if (data['message'] == 'schedule not found') {
        emit(TakelocationFailure(emassage: data['message']));
      } else if (data['message'] ==
          'the student has not registered for this course') {
        emit(TakelocationFailure(emassage: data['message']));
      } else if (data['message'] ==
          'the doctor did not open the attendance today') {
        emit(TakelocationFailure(emassage: data['message']));
      } else {
        emit(TakelocationFailure(emassage: data.toString()));
      }
    });
  }

  void reset() {
    emit(TakelocationInitial());
  }
}
