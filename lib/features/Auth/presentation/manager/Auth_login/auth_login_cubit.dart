import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_greduation/features/Auth/data/models/user/user.dart';
import 'package:project_greduation/features/Auth/domain/Use_case/Auths_Use_Case_login.dart';

part 'auth_login_state.dart';

class AuthLoginCubit extends Cubit<AuthLoginState> {
  AuthLoginCubit(this.authsUseCaseLogin) : super(AuthLoginInitial());
  final AuthsUseCaseLogin authsUseCaseLogin;
  LoginMothed({required String email, required String password}) async {
    emit(AuthLoginLoading());
    var data = await authsUseCaseLogin.Call(email: email, password: password);
    data.fold((failure) {
      emit(AuthLoginFailure(emassage: failure.errormassage));
    }, (user) {
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
