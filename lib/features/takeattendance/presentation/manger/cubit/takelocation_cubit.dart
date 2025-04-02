import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:project_greduation/core/utils/api/Apiserverce.dart';

part 'takelocation_state.dart';

class TakelocationCubit extends Cubit<TakelocationState> {
  TakelocationCubit() : super(TakelocationInitial());
  getlocationmothed(
      {required String session,
      required String 
     // required String latitude,
    //  required String longitude
      }) async {
    emit(Takelocationloading());
    try {
    //  var data = await Apiserverce(Dio()).getloaction(
     //     session: session, latitude: "30.669295878641602", longitude: "30.070144100553378",token: );
    //  print(data.toString());
      emit(TakelocationSucess());
    } on Exception catch (e) {
      emit(TakelocationFailure());
    }
  }
}
