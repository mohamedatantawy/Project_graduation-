import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project_greduation/constants.dart';
import 'package:project_greduation/core/styles/textstyles.dart';
import 'package:project_greduation/features/attendance/presentation/view/widget/attendanceviewbody.dart';
import 'package:project_greduation/features/home/data/models/material/materialmodel.dart';

class Attendanceview extends StatelessWidget {
  const Attendanceview({super.key, required this.materialmodels});
  final List<Materialmodels> materialmodels;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      appBar: AppBar(
        title: Text(
          'Attendance Report ',
          style: Textstyles.font26medinmblue.copyWith(color: kcolorwhite),
        ),
        centerTitle: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(100),
                bottomRight: Radius.circular(100))),
        toolbarHeight: MediaQuery.sizeOf(context).height * 0.26,
        backgroundColor: ksecandkey,
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
                color: kcolorwhite,
              ),
            ),
          ),
        ),
      ),
      body: Attendanceviewbody(
        materialmodels: materialmodels,
      ),
    );
  }
}
