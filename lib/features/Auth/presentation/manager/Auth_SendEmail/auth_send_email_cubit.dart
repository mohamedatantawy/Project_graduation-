import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_greduation/features/Auth/domain/Use_case/Auths_Use_Case_SendEmail.dart';

part 'auth_send_email_state.dart';

class AuthSendEmailCubit extends Cubit<AuthSendEmailState> {
  AuthSendEmailCubit(this.authsUseCaseSendemail)
      : super(AuthSendEmailInitial());
  final AuthsUseCaseSendemail authsUseCaseSendemail;
  sendpassword({required String email}) async {
    emit(AuthSendEmailloading());
    var data = await authsUseCaseSendemail.Call(email: email);
    data.fold((failure) {
      emit(AuthSendEmailFailure(emassage: failure.errormassage));
    }, (data) {
      emit(AuthSendEmailSucess(email: email,data: data));
    });
  }
}
