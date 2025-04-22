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

    if (data == 'you are not in college') {
      emit(Takelocationoutthecollege(emassage: data));
    } else if (data ==  "attendance is already registered") {
      emit(TakelocationalrdayRegister(emassage: data));
    } else if (data == 'attendance is registered') {
      emit(TakelocationSucess());
    } else if (data == 'schedule not found') {
      emit(TakelocationFailure(emassage: data));
    } else if (data == 'the student has not registered for this course') {
      emit(TakelocationFailure(emassage: data));
    } else if (data == 'the doctor did not open the attendance today') {
        emit(TakelocationFailure(emassage: data));
    } else   {emit(TakelocationFailure(emassage: data.toString()));}
  }
}
