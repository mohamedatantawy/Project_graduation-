import 'package:bloc/bloc.dart';
import 'package:project_greduation/feature_Doc/apis/lecture_info_api.dart';
import 'package:project_greduation/feature_Doc/models/lecture_model/lecture_model.dart';
import 'package:project_greduation/feature_Doc/models/section_models/section_models.dart';
import 'lecture_state.dart';

class LectureCubit extends Cubit<LectureState> {
  LectureCubit(this.lectureInfoApi) : super(LectureInitial());

  final LectureInfoApi lectureInfoApi;

  Future<void> getLecInfo(
      {required String token, required String depname}) async {
    emit(LectureLoading());
    try {
      var res = await lectureInfoApi.getLecInfo(token: token, depname: depname);
      List<LectureModel> lectures = [];
      List<SectionModels> section = [];
      depname == 'assistant'
          ? {
              for (var i in res) {section.add(SectionModels.fromJson(i))}
            }
          : {
              for (var i in res) {lectures.add(LectureModel.fromJson(i))}
            };
      depname == 'assistant'
          ? emit(SectionSuccess(section: section))
          : emit(LectureSuccess(lectures: lectures));
    } catch (e) {
      emit(LectureFailure(message: e.toString()));
    }
  }

  restart() {
    emit(LectureInitial());
  }
}
