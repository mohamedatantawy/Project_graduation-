import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:project_greduation/core/utils/api/Apiserverce.dart';
import 'package:project_greduation/core/utils/sharedperfernace.dart';
import 'package:project_greduation/features/Auth/data/models/loginmodels.dart';
import 'package:project_greduation/features/Auth/data/models/user/user.dart';

part 'auths_state.dart';

class AuthsCubit extends Cubit<AuthsState> {
  AuthsCubit() : super(AuthsInitial());
  late Apiserverce apiserverce = Apiserverce(Dio());
  getlogin({required String email, required String password}) async {
    emit(Authsloadinglogin());
    //  print('dsddsdsdsdsdsdsdsdsdsdloading');
    try {
      var data =
          await apiserverce.getloginresonse(email: email, password: password);

      print(data.toString());
     
      emit(AuthsSucesslogin(user: data));
    } on Exception catch (e) {
      emit(Authsfailurelogin(User(), emassage: e.toString()));
    }
  }

  logout({required String token}) async {
    // emit(Authsloadinglogin());
    //  print('dsddsdsdsdsdsdsdsdsdsdloading');
    try {
      var data = await apiserverce.logout(token: token);

      print(data.toString());

      return true;
    } on Exception catch (e) {
      return false;
    }
  }

  getemailforgetpassword({required String email}) async {
    emit(Authsloadingsendeamil());
    //  print('dsddsdsdsdsdsdsdsdsdsdloading');
    try {
      var data = await apiserverce.getresetpassword(email: email);

      print(data.toString());
      print('send otp');

      emit(AuthsSucesssendemail(email: email));
    } on Exception catch (e) {
      emit(Authsfailuresendemail(emassage: e.toString()));
    }
  }

  getotp({required String email, required String otp}) async {
    emit(Authsloadingotp());
    //  print('dsddsdsdsdsdsdsdsdsdsdloading');
    try {
      var data = await apiserverce.getotp(email: email, otp: otp);

      print(data.toString());
      print('send otp');

      emit(AuthsSucessotp(loginmodels: data));
    } on Exception catch (e) {
      emit(Authsfailureotp(emassage: e.toString()));
    }
  }

  Resetpass(
      {required String email,
      required String otp,
      required String password,
      required String confirm}) async {
    emit(AuthsloadingReset());
    //  print('dsddsdsdsdsdsdsdsdsdsdloading');
    try {
      var data = await apiserverce.resetpassword(
        email: email,
        otp: otp,
        confirm: confirm,
        password: password,
      );

      print(data.toString());
      print('send otp');
      if (data.toString() == 'password updated successfully') {
        emit(AuthsSucessReset());
      }
    } on Exception catch (e) {
      emit(AuthsfailureReset(emassage: e.toString()));
    }
  }
}
