import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:project_greduation/feature_Doc/logic/counter/counter_cubit.dart';
import 'package:project_greduation/feature_Doc/logic/yesattandancecubit/yesattandance_cubit.dart';
import 'package:project_greduation/feature_Doc/widgets/attendance_card.dart';

class AttendanceLecture extends StatefulWidget {
  AttendanceLecture(
      {super.key, required this.token, required this.id, required this.role});
  final String token;
  final int id;
  final String role;

  @override
  State<AttendanceLecture> createState() => _AttendanceLectureState();
}

class _AttendanceLectureState extends State<AttendanceLecture> {
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<YesattandanceCubit>(context).getyesattandance(
        token: widget.token, id: widget.id, role: widget.role);
  }

  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff557DBB),
      body: Column(children: [
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
                  BlocProvider.of<CounterCubit>(context).showPresent1(
                      role: widget.role, token: widget.token, id: widget.id);
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

        BlocConsumer<YesattandanceCubit, YesattandanceState>(
          listener: (context, state) {
            if (state is YesattandanceLoading) {
              isloading = true;
            } else {
              isloading = false;
            }
          },
          builder: (context, state) {
            if (state is YesattandanceSucess) {
              return Expanded(
                child: ListView.builder(
                  itemCount: state.students.length,
                  itemBuilder: (context, index) {
                    // final student = students[index];
                    return AttendanceCard(
                      name: state.students[index].user!.name!,
                      email: state.students[index].user!.email!,
                      time: state.students[index].attendAt!,
                      status: state.students[index].attendanceStatus!,
                    );
                  },
                ),
              );
            } else if (state is YesattandanceLoading) {
              return Expanded(
                child: Container(
                  height: 350,
                  child:
                      ModalProgressHUD(inAsyncCall: true, child: Container()),
                ),
              );
            } else {
              return Expanded(child: Container());
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
