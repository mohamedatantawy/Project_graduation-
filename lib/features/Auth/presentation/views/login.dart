import 'package:flutter/material.dart';
import 'package:project_greduation/constants.dart';
import 'package:project_greduation/features/Auth/presentation/views/widget/loginbody.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundcolor,
      appBar: AppBar(
        toolbarHeight: 122,
        backgroundColor: kbackgroundcolor,
        // leading: IconButton(
        //   onPressed: () {
        //     //   GoRouter.of(context).pop();
        //   },
        //   icon: const Icon(
        //     Icons.arrow_back_ios,
        //     color: Color(0xff06224D),
        //   ),
        // )
      ),
      body: const Loginbody(),
    );
  }
}
