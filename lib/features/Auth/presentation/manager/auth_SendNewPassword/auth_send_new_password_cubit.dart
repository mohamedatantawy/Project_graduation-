import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_greduation/features/Auth/domain/Use_case/Auth_Use_Case_SendNewPassword.dart';

part 'auth_send_new_password_state.dart';

class AuthSendNewPasswordCubit extends Cubit<AuthSendNewPasswordState> {
  AuthSendNewPasswordCubit(this.authUseCaseSendnewpassword)
      : super(AuthSendNewPasswordInitial());
  final AuthUseCaseSendnewpassword authUseCaseSendnewpassword;
  sendNewpasswordMethod(
      {required String email,
      required String otp,
      required String password,
      required String confirm}) async {
    emit(AuthSendNewPasswordloading());
    var data = await authUseCaseSendnewpassword.Call(
        email: email, otp: otp, password: password, confirm: confirm);
    data.fold((failure) {
      emit(AuthSendNewPasswordFailure(emassage: failure.errormassage));
    }, (user) {
      emit(AuthSendNewPasswordSucess(data: user));
    });
  }
}
