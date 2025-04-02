import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project_greduation/core/styles/textstyles.dart';
import 'package:project_greduation/features/notification/presentation/view/widget/notificationviewbody.dart';

class Notificationview extends StatelessWidget {
  const Notificationview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xff06224D),
          ),
        ),
        title: Text(
          'Notification',
          style: Textstyles.font26medinmblue,
        ),
      ),
      body: Notificationviewbody(),
    );
  }
}
