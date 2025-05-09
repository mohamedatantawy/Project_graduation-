import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project_greduation/constants.dart';
import 'package:project_greduation/core/styles/textstyles.dart';
import 'package:project_greduation/features/setting/presentation/view/widget/settingviewbody.dart';

class Settingview extends StatelessWidget {
  const Settingview({super.key, required this.token});
  final String token;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcolorwhite,
      appBar: AppBar(
        title: Text(
          'Settings',
          style: Textstyles.font26medinmblue,
        ),
        centerTitle: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(100),
                bottomRight: Radius.circular(100))),
        toolbarHeight: 210,
        backgroundColor: kbackgroundcolor,
        leading: Align(
          alignment: Alignment.topLeft,
          child: IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: const Icon(
                Icons.arrow_back_ios,
                color: Color(0xff06224D),
              ),
            ),
          ),
        ),
      ),
      body: Settingviewbody(
        token: token,
      ),
    );
  }
}
