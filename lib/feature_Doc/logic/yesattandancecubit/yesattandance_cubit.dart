import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:project_greduation/feature_Doc/apis/getStudentAttendance.dart';
import 'package:project_greduation/feature_Doc/models/yesattandancemodels/yesattandancemodels.dart';

part 'yesattandance_state.dart';

class YesattandanceCubit extends Cubit<YesattandanceState> {
  YesattandanceCubit(this.getstudentattendance) : super(YesattandanceInitial());

  Timer? timer;
  final Getstudentattendance getstudentattendance;
  getyesattandance(
      {required String token, required int id, required String role}) async {
    emit(YesattandanceLoading());
    try {
      var messageMap = await getstudentattendance.getStudants(
          token: token, id: id, role: role);
      List<Yesattandancemodels> re = [];
      num present = messageMap['total_present'];
      List mess = messageMap['students_attendance_records'];
      for (var element in mess) {
        re.add(Yesattandancemodels.fromJson(element));
      }
      print(mess.toString());
      emit(YesattandanceSucess(present, students: re));
    } on DioException catch (e) {
      print(e.response!.data.toString());
      emit(
        Yesattandancefailure(
          emassage: e.response!.data,
        ),
      );
    }
  }

  // showPresent({required String token, required int id}) {
  //   timer = Timer(
  //     Duration(milliseconds: 600),
  //     () async {
  //       emit(YesattandanceLoading());

  //       try {
  //         var messageMap =
  //             await getstudentattendance.getStudants(token: token, id: id);
  //         List<Yesattandancemodels> re = [];
  //         num present = messageMap['total_present'];
  //         // List mess = messageMap['students_attendance_records'];
  //         // for (var element in mess) {
  //         //   re.add(Yesattandancemodels.fromJson(element));
  //         // }
  //         // print(mess.toString());
  //         emit(YesattandanceSucessshow(
  //           present,
  //         ));
  //       } on DioException catch (e) {
  //         print(e.response!.data.toString());
  //         emit(
  //           Yesattandancefailure(
  //             emassage: e.response!.data,
  //           ),
  //         );
  //       }
  //     },
  //   );
  // }
}
