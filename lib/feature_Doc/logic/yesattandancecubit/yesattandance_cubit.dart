import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:project_greduation/feature_Doc/apis/attendance_api.dart';
import 'package:project_greduation/feature_Doc/apis/getStudentAttendance.dart';
import 'package:project_greduation/feature_Doc/models/yesattandancemodels/yesattandancemodels.dart';

part 'yesattandance_state.dart';

class YesattandanceCubit extends Cubit<YesattandanceState> {
  YesattandanceCubit(this.getstudentattendance) : super(YesattandanceInitial());
  final Getstudentattendance getstudentattendance;
  getyesattandance({required String token, required int id}) async {
    emit(YesattandanceLoading());
    try {
      var messageMap =
          await getstudentattendance.getStudants(token: token, id: id);
      List<Yesattandancemodels> re = [];
      num present = messageMap['total_present'];
      List mess = messageMap['students_attendance_records'];
      for (var element in mess) {
        re.add(Yesattandancemodels.fromJson(element));
      }
      print(mess.toString());
      emit(YesattandanceSucess(students: re));
    } on DioException catch (e) {
      print(e.response!.data.toString());
      emit(
        Yesattandancefailure(
          emassage: e.response!.data,
        ),
      );
    }
  }
}
