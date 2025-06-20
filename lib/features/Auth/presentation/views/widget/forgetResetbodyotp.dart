import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:project_greduation/constants.dart';
import 'package:project_greduation/core/gorouter.dart';
import 'package:project_greduation/core/utils/customelevatedbutton.dart';
import 'package:project_greduation/features/Auth/presentation/manager/Auth_SendEmail/auth_send_email_cubit.dart';
import 'package:project_greduation/features/Auth/presentation/manager/auth_SendOTP/auth_send_otp_cubit.dart';

class Forgetresetbodyotp extends StatefulWidget {
  const Forgetresetbodyotp({super.key, required this.email});
  final String email;
  @override
  State<Forgetresetbodyotp> createState() => _ForgetresetbodyotpState();
}

class _ForgetresetbodyotpState extends State<Forgetresetbodyotp> {
  GlobalKey<FormState> keyform = GlobalKey();
  final TextEditingController otp = TextEditingController();
  bool isloading = false;
  Map<String, dynamic> dataofemail = {};
  @override
  void initState() {
    //  loginmodels = Loginmodels(email: widget.email, otp: otp.text);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthSendOtpCubit, AuthSendOtpState>(
      listener: (context, state) {
        if (state is AuthSendOtploading) {
          isloading = true;
        } else if (state is AuthSendOtpSucess) {
          isloading = false;
          dataofemail = {
            "email": state.email,
            "OTP": state.otp,
          };
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('good bar ${state.data} ')));
          GoRouter.of(context).pushReplacement(
            Gorouter.kresetpassword,
            extra: dataofemail,
          );
        } else if (state is AuthSendOtpfailure) {
          isloading = false;
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('bad bar ${state.emassage}')));
          setState(() {});
          //   GoRouter.of(context)
          //       .pushReplacement(Gorouter.kresetpassword, extra: loginmodels);
          //
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isloading,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: keyform,
              child: ListView(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Password reset code',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: kprimarykey,
                    ),
                  ),
                  const SizedBox(
                    height: 37,
                  ),
                  const Text(
                    'Email Verification',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: kprimarykey,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    'Get Your Code',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: kprimarykey,
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  const Text(
                    'Please enter the four-digit code',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: kprimarykey,
                    ),
                  ),
                  const Text(
                    'sent to your email address',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: kprimarykey,
                    ),
                  ),
                  const SizedBox(
                    height: 31,
                  ),
                  Custompincodeconfirm(
                    otp: otp,
                  ),
                  const SizedBox(
                    height: 31,
                  ),
                  Row(
                    children: [
                      const Text(
                        'If you do not receive the code !',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: kprimarykey,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          BlocProvider.of<AuthSendEmailCubit>(context)
                              .sendpassword(email: widget.email);
                        },
                        child: const Text(
                          'Resend',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                            color: kprimarykey,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 150,
                  ),
                  Customelevatedbutton(
                      onpressed: () {
                        if (keyform.currentState!.validate()) {
                          BlocProvider.of<AuthSendOtpCubit>(context)
                              .sendOTP(email: widget.email, otp: otp.text);
                        }
                      },
                      title: 'Verify')
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class Custompincodeconfirm extends StatefulWidget {
  const Custompincodeconfirm({
    super.key,
    required this.otp,
  });
  final TextEditingController otp;

  @override
  State<Custompincodeconfirm> createState() => _CustompincodeconfirmState();
}

class _CustompincodeconfirmState extends State<Custompincodeconfirm> {
  @override
  String? _errorMessage;

  void _validateInput(String value) {
    try {
      // Check if the input is valid
      if (value.isEmpty || !RegExp(r'^\d+$').hasMatch(value)) {
        throw Exception("Input must be a number.");
      }
      // Clear error message if valid
      setState(() {
        _errorMessage = null;
      });
    } catch (e) {
      // Handle exception
      setState(() {
        _errorMessage = e.toString();
        widget.otp.clear(); // Clear input on error
      });
    }
  }

  bool emptybool = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 65),

      // to try other  the solveing this problem
// child: Otpt,
      child: _pincode(context),
    );
  }

  PinCodeTextField _pincode(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      onSubmitted: (value) {
        if (value!.isEmpty) {
          emptybool = true;
          setState(() {});
          //  return 'Enter your code';
        } else {
          emptybool = false;
          return null;
        }
      },
      // validator: (value) {
      //   if (value!.isEmpty) {
      //     emptybool = true;
      //     setState(() {});
      //     return 'Enter your code';
      //   } else {
      //     emptybool = false;
      //     return null;
      //   }
      // },
      length: 4,
      controller: widget.otp,
      enableActiveFill: true,
      pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          activeColor: Colors.white,
          inactiveColor: !emptybool ? Colors.white : Colors.red,
          inactiveFillColor: !emptybool ? Colors.white : Colors.red,
          disabledColor: Colors.white,
          fieldWidth: 50,
          errorBorderColor: Colors.red,
          borderWidth: 1,
          borderRadius: BorderRadius.circular(12)),
    );
  }
}
