import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project_greduation/constants.dart';
import 'package:project_greduation/core/gorouter.dart';
import 'package:project_greduation/core/utils/customelevatedbutton.dart';
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
                  onpressed: () {
                    if (keyform.currentState!.validate()) {
                      GoRouter.of(context)
                          .pushReplacement(Gorouter.forgetReset);
                    }
                  },
                  title: 'Verify')
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 50),
              //   child: ListTile(
              //     tileColor: Colors.white,
              //     shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(12),
              //         side: const BorderSide(color: Colors.white)),
              //     onTap: () {
              //       GoRouter.of(context).push(Gorouter.forgetReset);
              //     },
              //     title: const Center(
              //       child: Text(
              //         'Password recovery',
              //         style: TextStyle(
              //             color: Color(0xff082B61),
              //             fontSize: 16,
              //             fontWeight: FontWeight.w600),
              //       ),
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
