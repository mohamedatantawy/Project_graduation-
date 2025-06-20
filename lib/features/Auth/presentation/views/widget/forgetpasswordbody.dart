import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:project_greduation/constants.dart';
import 'package:project_greduation/core/gorouter.dart';
import 'package:project_greduation/core/utils/customelevatedbutton.dart';
import 'package:project_greduation/features/Auth/presentation/manager/Auth_SendEmail/auth_send_email_cubit.dart';
import 'package:project_greduation/features/Auth/presentation/views/widget/textfield.dart';

class forgetpasswordbody extends StatefulWidget {
  const forgetpasswordbody({super.key});

  @override
  State<forgetpasswordbody> createState() => _forgetpasswordbodyState();
}

class _forgetpasswordbodyState extends State<forgetpasswordbody> {
  final TextEditingController email = TextEditingController();
  GlobalKey<FormState> keyform = GlobalKey();
  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthSendEmailCubit, AuthSendEmailState>(
      listener: (context, state) {
        if (state is AuthSendEmailloading) {
          isloading = true;
        } else if (state is AuthSendEmailSucess) {
          isloading = false;
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('good bar ${state.data['message']} ')));
          GoRouter.of(context)
              .pushReplacement(Gorouter.forgetReset, extra: state.email);
        } else if (state is AuthSendEmailFailure) {
          isloading = false;
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('bad bar${state.emassage} ')));
          GoRouter.of(context)
              .pushReplacement(Gorouter.forgetReset, extra: email.text);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isloading,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(70),
                topRight: Radius.circular(70),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: keyform,
                child: ListView(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Forget Password',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          color: kprimarykey),
                    ),
                    const SizedBox(
                      height: 44,
                    ),
                    const Text(
                      '''Please Enter Your Email Address To
   Recieve a Verification Code''',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: kprimarykey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Email Address',
                      style: TextStyle(
                        fontSize: 15,
                        color: kprimarykey,
                        //fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    customtextFormField(
                      text: email,
                      title: 'Email',
                      icon: Icons.email,
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Customelevatedbutton(
                        onpressed: () async {
                          if (keyform.currentState!.validate()) {
                            BlocProvider.of<AuthSendEmailCubit>(context)
                                .sendpassword(email: email.text);
                          }
                        },
                        title: 'Verify')
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
