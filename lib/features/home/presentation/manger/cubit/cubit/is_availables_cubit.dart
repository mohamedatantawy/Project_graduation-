import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:project_greduation/core/utils/api/Apiserverce.dart';
import 'package:project_greduation/core/utils/errors/failure.dart';
import 'package:project_greduation/features/home/domain/Repos/homeRepos.dart';

part 'is_availables_state.dart';

class IsAvailablesCubit extends Cubit<IsAvailablesState> {
  IsAvailablesCubit(this.homeRemoteDataSource) : super(IsAvailablesInitial());
  final HomeRepoDataSource homeRemoteDataSource;
  getavialablemothed(
      {required String session,
      required String token,
      int? number,
      required int id}) async {
    emit(IsAvailablesloading());
    var data = await homeRemoteDataSource.isavailablesubject(
        token: token, id: id, session: session);
    data.fold((failure) {
      emit(IsAvailablesfailure(emassage: failure.errormassage));
    }, (subject) {
      if (subject == true) {
        if (session == 'lecture') {
          emit(IsAvailablesSucuessLecture(isactive: subject));
        } else {
          emit(IsAvailablesSucuessSection(
              numberindex: number ?? -1, isactive: subject));
        }
      } else {
        emit(IsAvailablesfailure(emassage: 'false'));
      }
    });
  }
}
