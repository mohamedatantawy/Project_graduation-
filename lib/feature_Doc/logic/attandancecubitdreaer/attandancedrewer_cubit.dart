import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:project_greduation/feature_Doc/apis/attendancedrawer.dart';
import 'package:project_greduation/feature_Doc/models/studentsfordrawermodels.dart';

part 'attandancedrewer_state.dart';

class AttandancedrewerCubit extends Cubit<AttandancedrewerState> {
  AttandancedrewerCubit(this.attendancedrawer)
      : super(AttandancedrewerInitial());
  final Attendancedrawer attendancedrawer;
  getallStudents({required String token, required int id}) async {
    emit(AttandancedrewerLoading());
    try {
      var data =
          await attendancedrawer.attendancedrawermethod(token: token, id: id);
      emit(AttandancedrewerSucess(students: data));
    } on DioException catch (e) {
      emit(AttandancedrewerFailure(
        emassage: e.response!.data.toString(),
      ));
    }
  }
}
