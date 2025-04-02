import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project_greduation/core/styles/textstyles.dart';
import 'package:project_greduation/features/attendance/presentation/view/widget/setattendacebody.dart';
import 'package:project_greduation/features/home/data/models/material/materialmodel.dart';

class Setattendance extends StatelessWidget {
  const Setattendance({super.key, required this.materialmodels});
  final Materialmodels materialmodels;
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
             materialmodels.schedule!.course!.name.toString(),
              style: Textstyles.font18boldblue,
            ),
          ],
        ),
      ),
      body: Setattendacebody(materialmodels: materialmodels,),
    );
  }
}
