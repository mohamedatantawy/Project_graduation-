import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:project_greduation/constants.dart';
import 'package:project_greduation/core/gorouter.dart';
import 'package:project_greduation/core/utils/customelevatedbutton.dart';
import 'package:project_greduation/features/Auth/data/models/loginmodels.dart';
import 'package:project_greduation/features/Auth/presentation/manager/cubit/auths_cubit.dart';

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
  late Loginmodels loginmodels;
  @override
  void initState() {
    //  loginmodels = Loginmodels(email: widget.email, otp: otp.text);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: BlocConsumer<AuthsCubit, AuthsState>(
        listener: (context, state) {
          if (state is Authsloadingotp) {
            isloading = true;
          } else if (state is AuthsSucessotp) {
            isloading = false;
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('good bar ')));
            GoRouter.of(context)
                .pushReplacement(Gorouter.kresetpassword, extra: loginmodels);
          } else if (state is Authsfailureotp) {
            isloading = false;
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('good bar ')));
            GoRouter.of(context)
                .pushReplacement(Gorouter.kresetpassword, extra: loginmodels);
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
                          onPressed: () {},
                          child: const Text(
                            'Reset',
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
                            BlocProvider.of<AuthsCubit>(context)
                                .getotp(email: widget.email, otp: otp.text);
                            loginmodels =
                                Loginmodels(email: widget.email, otp: otp.text);
                          }
                        },
                        title: 'Verify')
                  ],
                ),
              ),
            ),
          );
        },
      ),
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
  void dispose() {
    //  otp.clear();
    // otp.dispose();

    super.dispose();
  }

  bool emptybool = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 65),
      child: PinCodeTextField(
        appContext: context,
        validator: (value) {
          if (value!.isEmpty) {
            emptybool = true;
            setState(() {});
            return 'Enter your code';
          } else {
            emptybool = false;
            return null;
          }
        },
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
      ),
    );
  }
}
/* Form(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          color: Colors.grey,
          height: 45,
          width: 45,
          child: TextFormField(
            onSaved: (newValue) {},
            onChanged: (value) {
              FocusScope.of(context).nextFocus();
            },
            // keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.singleLineFormatter,
            ],
          ),
        ),
        Container(
          color: Colors.grey,
          height: 45,
          width: 45,
          child: TextFormField(
            onSaved: (newValue) {},
            onChanged: (value) {
              FocusScope.of(context).nextFocus();
            },
            // keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.singleLineFormatter,
            ],
          ),
        ),
        Container(
          color: Colors.grey,
          height: 45,
          width: 45,
          child: TextFormField(
            onSaved: (newValue) {},
            onChanged: (value) {
              FocusScope.of(context).nextFocus();
            },
            // keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.singleLineFormatter,
            ],
          ),
        ),
        Container(
          color: Colors.grey,
          height: 45,
          width: 45,
          child: TextFormField(
            onSaved: (newValue) {},
            onChanged: (value) {
              FocusScope.of(context).nextFocus();
            },
            //keyboardType: TextInputType.emailAddress,
            textAlign: TextAlign.center,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.singleLineFormatter,
            ],
          ),
        ),
      ],
    ));
  */
