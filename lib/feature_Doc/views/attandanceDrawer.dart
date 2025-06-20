import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:project_greduation/constants.dart';
import 'package:project_greduation/feature_Doc/apis/downloadexcel.dart';
import 'package:project_greduation/feature_Doc/logic/attandancecubitdreaer/attandancedrewer_cubit.dart';
import 'package:project_greduation/feature_Doc/widgets/CardAttandDrawer.dart';
import 'package:project_greduation/feature_Doc/widgets/attendance_card.dart';

class Attandancedrawer extends StatefulWidget {
  const Attandancedrawer(
      {super.key, required this.token, required this.id, required this.role});
  final String token;
  final int id;
  final String role;
  @override
  State<Attandancedrawer> createState() => _AttandancedrawerState();
}

class _AttandancedrawerState extends State<Attandancedrawer> {
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<AttandancedrewerCubit>(context)
        .getallStudents(token: widget.token, id: widget.id, role: widget.role);
  }

  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff557DBB),
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        const SizedBox(
          height: 50,
        ),
        Row(
          children: [
            IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Color(0xFF06224D),
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
            const SizedBox(width: 35),
            Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0D2442),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(color: Colors.black12, blurRadius: 4)
                    ],
                  ),
                  child: const Text(
                    'Attendance Lecture',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: kprimarykey),
                  onPressed: () async {
                    var response = await Downloadexcel(dio: Dio())
                        .downloadexcel(
                            token: widget.token,
                            role: widget.role,
                            id: widget.id);
                    final directory = await getExternalStorageDirectory();
                    final path = '${directory!.path}/attendance.xlsx';
                    final file = File(path);
                    await file.writeAsBytes(response);

                    print('File saved at: $path');
                    final result = await OpenFile.open(path);
                  },
                  child: const Text(
                    'Download Attendance',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ],
        ),

        BlocConsumer<AttandancedrewerCubit, AttandancedrewerState>(
          listener: (context, state) {
            if (state is AttandancedrewerLoading) {
              isloading = true;
            } else {
              isloading = false;
            }
          },
          builder: (context, state) {
            if (state is AttandancedrewerSucess) {
              return Expanded(
                child: ListView.builder(
                  itemCount: state.students.length,
                  itemBuilder: (context, index) {
                    return Cardattanddrawer(
                      user: state.students[index],
                    );

                    // return AttendanceCard(
                    //   name: state.students[index].name!,
                    //   email: state.students[index].,
                    //   time: state.students[index].attendAt!,
                    //   status: state.students[index].attendanceStatus!,
                    // );
                  },
                ),
              );
            } else if (state is AttandancedrewerLoading) {
              return Container(
                height: 350,
                child: ModalProgressHUD(inAsyncCall: true, child: Container()),
              );
            } else {
              return Container(
                height: 100,
                // color: Colors.amber,
                child: Center(
                    child: Text(
                  'There was an Error',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
              );
            }
          },
        )
        //   Expanded(
        //     child: ListView.builder(
        //       itemCount: attendanceList.length,
        //       itemBuilder: (context, index) {
        //         final item = attendanceList[index];
        //         return AttendanceCard(
        //           name: item['name']!,
        //           email: item['email']!,
        //           time: item['time']!,
        //           status: item['status']!,
        //         );
        //       },
        //     ),
        //   ),
        // ],
      ]),
    );
  }
}
