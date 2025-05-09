import 'package:bloc/bloc.dart';
import 'package:project_greduation/feature_Doc/apis/lecture_info_api.dart';
import 'package:project_greduation/feature_Doc/models/lecture_model/lecture_model.dart';
import 'lecture_state.dart';

class LectureCubit extends Cubit<LectureState> {
  LectureCubit(this.lectureInfoApi) : super(LectureInitial());

  final LectureInfoApi lectureInfoApi;

  Future<void> getLecInfo({required String token}) async {
    emit(LectureLoading());
    try {
      var res = await lectureInfoApi.getLecInfo(token: token);
      List<LectureModel> lectures = [];

      for (var i in res) {
        lectures.add(LectureModel.fromJson(i));
      }
      emit(LectureSuccess(lectures: lectures));
    } catch (e) {
      emit(LectureFailure(message: e.toString()));
    }
  }
}
