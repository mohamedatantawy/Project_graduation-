import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:project_greduation/feature_Doc/apis/getadsenttoday.dart';
import 'package:project_greduation/feature_Doc/models/studentsfordrawermodels.dart';
import 'package:project_greduation/feature_Doc/models/yesattandancemodels/yesattandancemodels.dart';

part 'get_absent_state.dart';

class GetAbsentCubit extends Cubit<GetAbsentState> {
  GetAbsentCubit(this.getadsenttoday) : super(GetAbsentInitial());
  final Getadsenttoday getadsenttoday;
  getAbsentStudents(
      {required String token, required int id, required String role}) async {
    emit(GetAbsentLoading());
    try {
      var messageMap = await getadsenttoday.getadsent(token: token, id: id, role: role);
      List<Yesattandancemodels> re = [];
     
      List mess = messageMap['absent_students_records'];
      for (var element in mess) {
        re.add(Yesattandancemodels.fromJson(element));
      }
      print(mess.toString());
      emit(GetAbsentSucess(data:re ));
    } on DioException catch (e) {
      print(e.response!.data.toString());
      emit(
        GetAbsentFailure(
          emassage: e.response!.data,
        ),
      );
    }
  }
}
