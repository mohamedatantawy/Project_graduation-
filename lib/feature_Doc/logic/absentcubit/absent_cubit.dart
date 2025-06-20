import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:project_greduation/feature_Doc/apis/absentStudents.dart';

part 'absent_state.dart';

class AbsentCubit extends Cubit<AbsentState> {
  AbsentCubit(this.absentstudents) : super(AbsentInitial());
  final Absentstudents absentstudents;
  absentStudentsmothed(
      {required String token,
      required int id,
      required int idst,
      required String role}) async {
    emit(Absentloading());
    try {
      var data = await absentstudents.absent(
          token: token, id: id, idstudent: idst, role: role);
      emit(AbsentSucess(data: data));
    } on DioException catch (e) {
      emit(AbsentFailure(
        emassage: e.response!.data.toString(),
      ));
    }
  }
}
