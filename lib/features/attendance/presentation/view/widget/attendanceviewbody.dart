import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project_greduation/constants.dart';
import 'package:project_greduation/core/gorouter.dart';
import 'package:project_greduation/core/styles/textstyles.dart';
import 'package:project_greduation/features/home/data/models/material/materialmodel.dart';

class Attendanceviewbody extends StatelessWidget {
  const Attendanceviewbody({super.key, required this.materialmodels});
  final List<Materialmodels> materialmodels;
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        SizedBox(
          height: 20,
        ),
        Text(
          'Choose the Subject :',
          style:
              Textstyles.font18boldblue.copyWith(fontWeight: FontWeight.w400),
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.62,
          child: GridView.builder(
            itemCount: materialmodels.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 30,
                childAspectRatio: 1.3),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  if (index == index) {
                    //  Apiserverce(Dio()).getReport(session: session, id: id, token: token)
                    GoRouter.of(context).push(Gorouter.ksetattendance,
                        extra: materialmodels[index]);
                  }
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          offset: Offset(10, 10),
                          blurRadius: 1,
                          spreadRadius: -5,
                        )
                      ]),
                  child: Card(
                    shadowColor: Colors.black,
                    color: kcolorcard,
                    child: Center(
                        child: Text(
                      '${materialmodels[index].schedule!.course!.name}',
                      style: Textstyles.font15semiboldwite,
                      textAlign: TextAlign.center,
                    )),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
