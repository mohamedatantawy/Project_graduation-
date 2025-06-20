import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:project_greduation/feature_Doc/apis/attendance_api.dart';

part 'attendance_state.dart';

class AttendanceCubit extends Cubit<AttendanceState> {
  AttendanceCubit(this.attendanceApi) : super(AttendanceInitial());

  final AttendanceApi attendanceApi;

  Future<void> openAttendance(
      {required String token,
      required int id,
      required int minute,
      required String depname}) async {
    emit(AttendanceLoading());
    try {
      var messageMap = await attendanceApi.openAtendance(
          depname: depname, token: token, id: id, minute: minute);
      String mess = messageMap['message'];
      print(mess.toString());
      emit(AttendanceSuccess(message: mess));
    } on DioException catch (e) {
      //  print(e.response!.data['message'].toString());
      emit(
        AttendanceFailure(
          errMessage: e.response!.data.toString(),
        ),
      );
    }
  }

  Future<void> closeAttendance(
      {required String token, required int id, required String depname}) async {
    emit(AttendanceLoading());
    try {
      var messageMap = await attendanceApi.closeAtendance(
        depname: depname,
        token: token,
        id: id,
      );
      String mess = messageMap['message'];
      print(mess);
      emit(AttendanceSuccess(message: mess));
    } on DioException catch (e) {
      // print(e.response!.data.toString());
      emit(
        AttendanceFailure(
          errMessage: e.response!.data.toString(),
        ),
      );
    }
  }
}
