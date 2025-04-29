import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project_greduation/constants.dart';
import 'package:project_greduation/core/gorouter.dart';
import 'package:project_greduation/features/Auth/presentation/views/widget/forgetResetbodyotp.dart';

class Forgetresetcode extends StatelessWidget {
  const Forgetresetcode({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  backgroundColor: kbackgroundcolor,
      backgroundColor: kbackgroundcolor,
      appBar: AppBar(
          toolbarHeight: 122,
          backgroundColor: kbackgroundcolor,
          leading: IconButton(
            onPressed: () {
              GoRouter.of(context).pushReplacement(
                Gorouter.klogin,
              );
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color(0xff06224D),
            ),
          )),
      body: Forgetresetbodyotp(
        email: email,
      ),
    );
  }
}
