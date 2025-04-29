import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:project_greduation/features/Auth/domain/Use_case/Auths_Use_Case_SendOTP.dart';

part 'auth_send_otp_state.dart';

class AuthSendOtpCubit extends Cubit<AuthSendOtpState> {
  AuthSendOtpCubit(this.authsUseCaseSendotp) : super(AuthSendOtpInitial());
  final AuthsUseCaseSendotp authsUseCaseSendotp;
  sendOTP({required String email, required String otp}) async {
    emit(AuthSendOtploading());
    var data = await authsUseCaseSendotp.Call(email: email, otp: otp);
    data.fold((failure) {
      emit(AuthSendOtpfailure(emassage: failure.errormassage));
    }, (user) {
      if(user['message']=='OTP is valid')
      emit(AuthSendOtpSucess(email: email, otp: otp,data: user));
      else 
      {
        emit(AuthSendOtpfailure(emassage: user['message']));
      }
    });
  }
}
