import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:project_greduation/feature_Doc/apis/presentStudents.dart';

part 'present_student_state.dart';

class PresentStudentCubit extends Cubit<PresentStudentState> {
  PresentStudentCubit(this.presentstudents) : super(PresentStudentInitial());
  final Presentstudents presentstudents;
  PresentStudentsmothed(
      {required String token,
      required int id,
      required int idst,
      required String role}) async {
    emit(PresentStudentloading());
    try {
      var data = await presentstudents.present(
          token: token, id: id, idstudent: idst, role: role);
      emit(PresentStudentSucess(data: data));
    } on DioException catch (e) {
      emit(PresentStudentfailure(
        emessage: e.response!.data.toString(),
      ));
    }
  }
}
