import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_greduation/features/home/data/models/material/materialmodel.dart';
import 'package:project_greduation/features/home/domain/Repos/homeRepos.dart';

part 'materialshow_state.dart';

class MaterialshowCubit extends Cubit<MaterialshowState> {
  MaterialshowCubit(this.homeRemoteDataSource) : super(MaterialshowInitial());
  // late List<Materialmodels> data;
  final HomeRemoteDataSource homeRemoteDataSource;
  getsubjectcu({required String token}) async {
    emit(Materialshowloading());

    var data = await homeRemoteDataSource.fetchsubjects(token: token);
    print(data.length.toString());
    data.fold((failure) {
      emit(Materialshowfailure(emassage: failure.errormassage));
    }, (subject) {
      emit(MaterialshowSucess(data: subject));
    });
  }

  
  // getAvailable({required String session}) async {
  //   emit(MaterialAvailableloading());
  //    try {
  //     var data = await Apiserverce(Dio()).Is_available(session: session);
  //     print(data.toString());
  //     emit(MaterialAvailableSucess());
  //   } on Exception catch (e) {
  //     emit(MaterialAvailablefailure(emassage: e.toString()));
  //   }
  // }
}
