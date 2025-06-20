import 'package:project_greduation/feature_Doc/models/lecture_model/lecture_model.dart';
import 'package:project_greduation/feature_Doc/models/section_models/section_models.dart';

abstract class LectureState {
  const LectureState();
  @override
  List<Object?> get props => [];
}

class LectureInitial extends LectureState {}

class LectureLoading extends LectureState {}

class LectureSuccess extends LectureState {
  final List<LectureModel> lectures;

  const LectureSuccess({required this.lectures});
}

class SectionSuccess extends LectureState {
  final List<SectionModels> section;

  const SectionSuccess({required this.section});
}

class LectureFailure extends LectureState {
  final String message;

  const LectureFailure({required this.message});
}
