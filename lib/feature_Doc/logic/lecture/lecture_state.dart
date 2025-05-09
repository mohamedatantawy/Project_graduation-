import 'package:project_greduation/feature_Doc/models/lecture_model/lecture_model.dart';

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

class LectureFailure extends LectureState {
  final String message;

  const LectureFailure({required this.message});
}
