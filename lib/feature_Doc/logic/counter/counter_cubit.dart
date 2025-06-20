import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:project_greduation/feature_Doc/apis/conterpresent.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit(this.conterpresent) : super(CounterInitial());
  Timer? timer;
  final Conterpresent conterpresent;
showPresent1(
      {required String token, required String role, required int id}) async {
    // emit(Counterloading());
   
   
      try {
        print('sendddddddd');
        var messageMap = await conterpresent.Conterpresentmothed(
            token: token, role: role, id: id);

        num present = messageMap['total_present'];

        emit(CounterSucess(present: present));
      } on DioException catch (e) {
        print(e.response.toString());

        emit(
          Counterfailure(
            massage: e.response.toString(),
          ),
        );
      }
    
  }

  showPresent2(
      {required String token, required String role, required int id}) async {
    // emit(Counterloading());
    timer?.cancel();
    timer = Timer.periodic(Duration(seconds: 1), (timer) async {
      try {
        print('sendddddddd');
        var messageMap = await conterpresent.Conterpresentmothed(
            token: token, role: role, id: id);

        num present = messageMap['total_present'];

        emit(CounterSucess(present: present));
      } on DioException catch (e) {
        print(e.response.toString());

        emit(
          Counterfailure(
            massage: e.response.toString(),
          ),
        );
      }
    });
  }

  closed() {
    timer?.cancel();
    emit(CounterInitial());
  }

  Future<void> closet() {
    timer?.cancel();
    return super.close();
  }
}
