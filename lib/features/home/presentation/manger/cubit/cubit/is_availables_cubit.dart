import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:project_greduation/core/utils/api/Apiserverce.dart';

part 'is_availables_state.dart';

class IsAvailablesCubit extends Cubit<IsAvailablesState> {
  IsAvailablesCubit() : super(IsAvailablesInitial());
  getavialablemothed({required String session}) async {
    emit(IsAvailablesloading());
    try {
     // var data = await Apiserverce(Dio()).Is_available(session: session);
     // print(data.toString());
      emit(IsAvailablesSucuess());
    } on Exception catch (e) {
      emit(IsAvailablesfailure());
    }
  }
}
