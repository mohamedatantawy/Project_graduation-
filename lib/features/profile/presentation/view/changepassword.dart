import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:project_greduation/constants.dart';
import 'package:project_greduation/core/gorouter.dart';
import 'package:project_greduation/core/utils/customelevatedbutton.dart';
import 'package:project_greduation/features/Auth/presentation/views/widget/textfield.dart';
import 'package:project_greduation/features/home/presentation/manger/cubit/materialshow_cubit.dart';
import 'package:project_greduation/features/profile/presentation/mange/cubit/changepassword_cubit.dart';

class Changepassword extends StatefulWidget {
  const Changepassword({
    super.key,
    required this.token,
  });
  final String token;

  @override
  State<Changepassword> createState() => _ChangepasswordState();
}

class _ChangepasswordState extends State<Changepassword> {
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundcolor,
      appBar: AppBar(
          toolbarHeight: 122,
          backgroundColor: kbackgroundcolor,
          leading: IconButton(
            onPressed: () {
              //   BlocProvider.of<MaterialshowCubit>(context).Restart();
              GoRouter.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color(0xff06224D),
            ),
          )),
      body: BlocConsumer<ChangepasswordCubit, ChangepasswordState>(
        listener: (context, state) {
          if (state is Changepasswordloading) {
            isloading = true;
          } else if (state is ChangepasswordSucess) {
            isloading = false;
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Your Password is change Now')));

            // BlocProvider.of<MaterialshowCubit>(context).Restart();
            print('pop the page ');
            GoRouter.of(context).pushReplacement(
              Gorouter.klogin,
            );
          } else if (state is ChangepasswordFailure) {
            isloading = false;
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('${state.emassage}')));
          } else {
            isloading = false;
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Your Password is not change ')));
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: isloading,
            child: Resetpasswordbodyd(
              token: widget.token,
            ),
          );
        },
      ),
    );
  }
}

class Resetpasswordbodyd extends StatefulWidget {
  const Resetpasswordbodyd({
    super.key,
    required this.token,
  });
  final String token;
  @override
  State<Resetpasswordbodyd> createState() => _ResetpasswordbodyState();
}

class _ResetpasswordbodyState extends State<Resetpasswordbodyd> {
  TextEditingController _password = TextEditingController();
  TextEditingController _oldpassword = TextEditingController();

  TextEditingController _confirmpassword = TextEditingController();

  GlobalKey<FormState> keyform = GlobalKey();

  bool isloading = false;

  @override
  Widget build(BuildContext context) {
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
                'Change Password',
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
                'Enter the old password',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: kprimarykey,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              customtextFormField(
                fill: false,
                title: 'password',
                text: _oldpassword,
                posticon: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'this field is required';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Enter the new password',
                style: TextStyle(
                  fontSize: 18,
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
                  fontSize: 18,
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
                onpressed: () async {
                  if (keyform.currentState!.validate()) {
                    //   GoRouter.of(context).pushReplacement(Gorouter.klogin);
                    await context.read<ChangepasswordCubit>().changepasswords(
                        token: widget.token,
                        oldpassword: _oldpassword.text,
                        newpassword: _password.text,
                        confirm: _confirmpassword.text);
                    //show snackbar to teel you is correct
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
