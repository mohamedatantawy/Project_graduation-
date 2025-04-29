import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:project_greduation/constants.dart';
import 'package:project_greduation/core/gorouter.dart';
import 'package:project_greduation/core/utils/customelevatedbutton.dart';
import 'package:project_greduation/features/Auth/presentation/manager/auth_SendNewPassword/auth_send_new_password_cubit.dart';
import 'package:project_greduation/features/Auth/presentation/views/widget/textfield.dart';

class Resetpassword extends StatelessWidget {
  const Resetpassword({super.key, required this.email, required this.otp});
  final String email;
  final String otp;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundcolor,
      appBar: AppBar(
          toolbarHeight: 122,
          backgroundColor: kbackgroundcolor,
          leading: IconButton(
            onPressed: () {
               GoRouter.of(context).pushReplacement(Gorouter.klogin);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color(0xff06224D),
            ),
          )),
      body: Resetpasswordbody(
        email: email,
        otp: otp,
      ),
    );
  }
}

class Resetpasswordbody extends StatefulWidget {
  const Resetpasswordbody({super.key, required this.email, required this.otp});
  final String email;
  final String otp;
  @override
  State<Resetpasswordbody> createState() => _ResetpasswordbodyState();
}

class _ResetpasswordbodyState extends State<Resetpasswordbody> {
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmpassword = TextEditingController();

  GlobalKey<FormState> keyform = GlobalKey();

  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthSendNewPasswordCubit, AuthSendNewPasswordState>(
      listener: (context, state) {
        if (state is AuthSendNewPasswordloading) {
          isloading = true;
        } else if (state is AuthSendNewPasswordSucess) {
          isloading = false;
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('good bar ${state.data} ')));
          GoRouter.of(context).pushReplacement(Gorouter.klogin);
        } else if (state is AuthSendNewPasswordFailure) {
          isloading = false;
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('bad bar ${state.emassage} ')));
          GoRouter.of(context).pushReplacement(Gorouter.klogin);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isloading,
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Form(
              key: keyform,
              child: ListView(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ' password',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: kprimarykey),
                  ),
                  const SizedBox(
                    height: 44,
                  ),
                  const Text(
                    'Enter the new password',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: kprimarykey,
                    ),
                  ),
                  const Text(
                    '''Password must be different from the
              password previously used  ''',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w200,
                      color: kprimarykey,
                    ),
                  ),
                  const SizedBox(
                    height: 87,
                  ),
                  const Text(
                    'Enter the new password',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: kprimarykey,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  customtextFormField(
                    fill: false,
                    title: 'password',
                    text: _password,
                    posticon: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'this field is required';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const Text(
                    'confirm the new password',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: kprimarykey,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  customtextFormField(
                    title: 'Confirm password',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'this field is required';
                      } else if (value != _password.text) {
                        return 'Confirm password is not equil password';
                      } else {
                        return null;
                      }
                    },
                    fill: false,
                    text: _confirmpassword,
                    posticon: true,
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Customelevatedbutton(
                    title: 'Verify',
                    onpressed: () {
                      if (keyform.currentState!.validate()) {
                        BlocProvider.of<AuthSendNewPasswordCubit>(context)
                            .sendNewpasswordMethod(
                                email: widget.email,
                                otp: widget.otp,
                                password: _password.text,
                                confirm: _confirmpassword.text);
                        //   GoRouter.of(context).pushReplacement(Gorouter.klogin);

                        //show snackbar to teel you is correct
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
