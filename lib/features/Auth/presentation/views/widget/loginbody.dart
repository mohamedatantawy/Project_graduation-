import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project_greduation/constants.dart';
import 'package:project_greduation/core/gorouter.dart';
import 'package:project_greduation/core/utils/customelevatedbutton.dart';
import 'package:project_greduation/features/Auth/presentation/views/widget/textfield.dart';

class Loginbody extends StatelessWidget {
  const Loginbody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(70),
          topRight: Radius.circular(70),
        ),
      ),
      child: const Padding(
        padding: const EdgeInsets.all(16),
        child: loginbodyform(),
      ),
    );
  }
}

class loginbodyform extends StatefulWidget {
  const loginbodyform({
    super.key,
  });

  @override
  State<loginbodyform> createState() => _loginbodyformState();
}

class _loginbodyformState extends State<loginbodyform> {
  final GlobalKey<FormState> keyform = GlobalKey();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: keyform,
      child: ListView(
        //  crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 90,
          ),
          const Align(
            alignment: Alignment.center,
            child: Text(
              'Sign in',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: kprimarykey,
                fontSize: 26,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Align(
            alignment: Alignment.center,
            child: Text(
              '''Log in to access your account
      to take your attendance''',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: kprimarykey,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          const Text(
            'Email',
            style: TextStyle(
              color: kprimarykey,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          customtextFormField(
            text: email,
            title: "Email",
            icon: Icons.person_2_outlined,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Password',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          customtextFormField(
            text: password,
            title: "Password",
            icon: Icons.lock_outline,
            posticon: true,
          ),
          Row(
            children: [
              Checkbox(
                value: true,
                onChanged: (value) {},
                checkColor: Colors.white,
                shape: CircleBorder(),
              ),
              const Text(
                'remind me ',
                style: TextStyle(
                  color: kprimarykey,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                width: 80,
              ),
              TextButton(
                onPressed: () {
                  GoRouter.of(context).pushReplacement(Gorouter.kforgetpassword);
                },
                child: const Text('forget password?',
                    style: TextStyle(
                      color: kprimarykey,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                      decorationColor: Color(0xff06224D),
                    )),
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Center(
            child: Customelevatedbutton(
                onpressed: () {
                  if (keyform.currentState!.validate()) {
                    GoRouter.of(context).push(Gorouter.HomeView);
                  }
                },
                title: 'Login'),
          )
        ],
      ),
    );
  }
}
