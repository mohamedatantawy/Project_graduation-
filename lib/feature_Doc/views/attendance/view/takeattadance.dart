import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:project_greduation/feature_Doc/logic/attandancecubitdreaer/attandancedrewer_cubit.dart';
import 'package:project_greduation/feature_Doc/logic/getAbsent/get_absent_cubit.dart';
import 'package:project_greduation/feature_Doc/views/attendance/view/searchStudent.dart';
import 'package:project_greduation/feature_Doc/widgets/CardAttandDrawer.dart';
import 'package:project_greduation/feature_Doc/widgets/random_attendance_card.dart';
import 'package:project_greduation/feature_Doc/widgets/takeattendancesecend.dart';

class Takeattadancec extends StatefulWidget {
  const Takeattadancec(
      {super.key, required this.token, required this.id, required this.role});
  final String token;
  final int id;
  final String role;
  @override
  State<Takeattadancec> createState() => _TakeattadanceState();
}

class _TakeattadanceState extends State<Takeattadancec> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<GetAbsentCubit>(context).getAbsentStudents(
        token: widget.token, id: widget.id, role: widget.role);
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
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
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
          ],
        ),

        BlocConsumer<GetAbsentCubit, GetAbsentState>(
          listener: (context, state) {
            if (state is GetAbsentLoading) {
              isloading = true;
            } else {
              isloading = false;
            }
          },
          builder: (context, state) {
            if (state is GetAbsentSucess) {
              return Searchstudent(
                students: state.data,
                role: widget.role,
                token: widget.token,
                id: widget.id,
              );
            } else if (state is GetAbsentLoading) {
              return Flexible(
                child: SizedBox(
                  height: 350,
                  child:
                      ModalProgressHUD(inAsyncCall: true, child: Container()),
                ),
              );
            } else {
              return Flexible(
                child: SizedBox(
                  height: 100,
                  // color: Colors.amber,
                  child: Center(
                      child: Text(
                    'There was an Error',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
                ),
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
