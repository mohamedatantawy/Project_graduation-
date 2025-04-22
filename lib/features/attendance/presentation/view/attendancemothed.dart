import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project_greduation/core/styles/textstyles.dart';
import 'package:project_greduation/features/attendance/data/models/reportattandance/reportattandance.dart';
import 'package:project_greduation/features/attendance/presentation/view/widget/attendancemothedbody.dart';

class Attendancemothed extends StatelessWidget {
  const Attendancemothed({super.key, required this.reportattandancemodel});
  final Reportattandancemodel reportattandancemodel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffDDDEE5),
      appBar: AppBar(
        backgroundColor: Color(0xffDDDEE5),
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
        title: Column(
          children: [
            Text(
              'Attendance Report for ',
              style: Textstyles.font18lightwithe,
            ),
            Text(
              "Lecture",
              style: Textstyles.font18boldblue,
            ),
          ],
        ),
      ),
      body: Attendancemothedbody(
        reportattandancemodel: reportattandancemodel,
      ),
    );
  }
}
