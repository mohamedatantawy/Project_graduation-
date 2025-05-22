import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:project_greduation/feature_Doc/apis/attendance_api.dart';

part 'attendance_state.dart';

class AttendanceCubit extends Cubit<AttendanceState> {
  AttendanceCubit(this.attendanceApi) : super(AttendanceInitial());

  final AttendanceApi attendanceApi;

  Future<void> openAttendance({required String token, required int id,required int minute}) async {
    emit(AttendanceLoading());
    try {
      var messageMap = await attendanceApi.openAtendance(token: token, id: id, minute:minute);
      String mess = messageMap['message'];
      print(mess.toString());
      emit(AttendanceSuccess(message: mess));
    } on DioException catch (e) {
      print(e.response!.data['message'].toString());
      emit(
        AttendanceFailure(
          errMessage: e.response!.data['message'],
        ),
      );
    }
  }

  Future<void> closeAttendance({required String token, required int id}) async {
    emit(AttendanceLoading());
    try {
      var messageMap = await attendanceApi.closeAtendance(
        token: token,
        id: id,
      );
      String mess = messageMap['message'];
      print(mess);
      emit(AttendanceSuccess(message: mess));
    } on DioException catch (e) {
      print(e.response!.data.toString());
      emit(
        AttendanceFailure(
          errMessage: e.response!.data['message'],
        ),
      );
    }
  }
}
