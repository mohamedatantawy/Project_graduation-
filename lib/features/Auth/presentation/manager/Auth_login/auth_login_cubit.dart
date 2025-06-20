import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_greduation/core/utils/sharedperfernace.dart';
import 'package:project_greduation/features/Auth/data/models/user/user.dart';
import 'package:project_greduation/features/Auth/domain/Use_case/Auths_Use_Case_login.dart';

part 'auth_login_state.dart';

class AuthLoginCubit extends Cubit<AuthLoginState> {
  AuthLoginCubit(this.authsUseCaseLogin) : super(AuthLoginInitial());
  final AuthsUseCaseLogin authsUseCaseLogin;
  alreadylogin() async {
    bool isremid = await Sharedperfernace.getbool('isremid') ?? false;
    String email = await Sharedperfernace.getString('email') ?? '';
    String password = await Sharedperfernace.getString('password') ?? '';
    if (isremid == true && email != '') {
      print(
          'dksahfkasjkdfhaskhdfkashfjkasdfjkhaskdfhkjashdfjkashkdhfa $password  $email');
      LoginMothed(email: email, password: password, isremid: isremid);
    } else {
      await Sharedperfernace.setString('email', '');
      await Sharedperfernace.setString('password', '');
    }
  }

  removethealreadlogin() async {
    await Sharedperfernace.setbool('isremid', false);
    await Sharedperfernace.setString('email', '');
    await Sharedperfernace.setString('password', '');
  }

  LoginMothed(
      {required String email,
      required String password,
      required isremid}) async {
    emit(AuthLoginLoading());
    var data = await authsUseCaseLogin.Call(email: email, password: password);
    data.fold((failure) {
      emit(AuthLoginFailure(emassage: failure.errormassage));
    }, (user) async {
      if (isremid == true) {
        await Sharedperfernace.setString('email', email);
        await Sharedperfernace.setString('password', password);
      } else {
        await Sharedperfernace.setString('email', '');
        await Sharedperfernace.setString('password', '');
        await Sharedperfernace.setbool('isremid', false);
      }
      if (user.role == 'student') {
        emit(AuthLoginSucessStudent(
          user: user,
        ));
      } else {
        emit(AuthLoginSucessDoctor(
          user: user,
        ));
      }
    });
  }
}
