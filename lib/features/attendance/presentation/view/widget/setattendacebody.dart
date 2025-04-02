import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project_greduation/constants.dart';
import 'package:project_greduation/core/gorouter.dart';
import 'package:project_greduation/core/styles/textstyles.dart';
import 'package:project_greduation/core/utils/api/Apiserverce.dart';
import 'package:project_greduation/core/utils/customelevatedbutton.dart';
import 'package:project_greduation/core/utils/sharedperfernace.dart';
import 'package:project_greduation/features/home/data/models/material/materialmodel.dart';

class Setattendacebody extends StatelessWidget {
  const Setattendacebody({super.key, required this.materialmodels});
  final Materialmodels materialmodels;
  final List<String> items = const [
    'Attendance for Lecture',
    'Attendance for Section',
    //  'Last 2 Week',
    // 'Select A specific Day',
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          SizedBox(
            height: 60,
          ),
          Row(
            children: [
              Icon(Icons.calendar_month),
              Text(
                'Choose Date :',
                style: Textstyles.font18boldblue,
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 400,
            margin: EdgeInsets.all(12),
            // color: kcolorwhite,
            decoration: BoxDecoration(
                color: kcolorwhite, borderRadius: BorderRadius.circular(12)),
            child: Container(
              decoration: BoxDecoration(
                  color: kcolorwhite, borderRadius: BorderRadius.circular(12)),
              child: Column(
                  children: List.generate(
                items.length,
                (index) => Card(
                  color: Color(0xffDDDEE5),
                  margin: EdgeInsets.all(13),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(items[index]),
                      ),
                      IconButton(
                          onPressed: () async {
                            if (index == 0) {
                              String token =
                                  await Sharedperfernace.getString('token') ??
                                      '';
                              print("${token + materialmodels.academicScheduleId!.toString()}");
                              if (token != '') {
                                var data = await Apiserverce(Dio()).getReport(
                                    session: 'lecture',
                                    id: materialmodels.academicScheduleId!,
                                    token: token);
                                GoRouter.of(context).push(
                                    Gorouter.kattendancemothed,
                                    extra: data);
                              } else {
                                print('Error in token for go calendaer00');
                              }
                            } else if (index == 1) {
                               String token =
                                  await Sharedperfernace.getString('token') ??
                                      '';
                              print("${token + materialmodels.academicScheduleId!.toString()}");
                              if (token != '') {
                                var data = await Apiserverce(Dio()).getReport(
                                    session: 'section',
                                    id: materialmodels.academicScheduleId!,
                                    token: token);
                                GoRouter.of(context).push(
                                    Gorouter.kattendancemothed,
                                    extra: data);
                              } else {
                                print('Error in token for go calendaer00');
                              }
                            }
                          },
                          icon: Icon(Icons.arrow_forward_ios_outlined))
                    ],
                  ),
                ),
              )),
            ),
          ),
          SizedBox(
            height: 55,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  SizedBox(
                    width: 170,
                    height: 40,
                    child: Customelevatedbutton(
                      title: 'Present',
                      onpressed: () {},
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: kcolorwhite,
                    ),
                    child: Center(child: Text('5')),
                  )
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    width: 170,
                    height: 40,
                    child: Customelevatedbutton(
                      title: 'Present',
                      onpressed: () {},
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: kcolorwhite,
                    ),
                    child: Center(child: Text('5')),
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
