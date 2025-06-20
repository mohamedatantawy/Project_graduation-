import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:project_greduation/feature_Doc/apis/absentStudents.dart';
import 'package:project_greduation/feature_Doc/logic/absentcubit/absent_cubit.dart';
import 'package:project_greduation/feature_Doc/logic/counter/counter_cubit.dart';
import 'package:project_greduation/feature_Doc/logic/yesattandancecubit/yesattandance_cubit.dart';
import 'package:project_greduation/feature_Doc/models/yesattandancemodels/yesattandancemodels.dart';
import 'package:project_greduation/feature_Doc/widgets/random_attendance_card.dart';

class RandomAttendanceScreen extends StatefulWidget {
  final String token;
  final int id;
  final String role;
  RandomAttendanceScreen(
      {super.key, required this.token, required this.id, required this.role});

  @override
  State<RandomAttendanceScreen> createState() => _RandomAttendanceScreenState();
}

class _RandomAttendanceScreenState extends State<RandomAttendanceScreen> {
  final List<Map<String, String>> students = List.generate(7, (index) {
    return {
      "name": "Ahmed Fathi",
      "email": "s2021784515448@cis.dmu.edu.eg",
    };
  });
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<YesattandanceCubit>(context).getyesattandance(
      token: widget.token,
      id: widget.id,
      role: widget.role,
    );
    //                        BlocProvider.of<YesattandanceCubit>(context).reset();
  }

  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff557DBB),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 30),
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
                          role: widget.role,
                          token: widget.token,
                          id: widget.id);
                    }),
                const SizedBox(width: 35),
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
                    'Random Attendance',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
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
                  List<Yesattandancemodels> nn = [];
                  for (var i = 0; i < state.students.length; i++) {
                    if (state.students[i].attendanceStatus == 1) {
                      nn.add(state.students[i]);
                    }
                  }
                  nn.shuffle();
                  List<Yesattandancemodels> randum = nn.take(10).toList();
                  return Expanded(
                    child: ListView.builder(
                      itemCount: randum.length,
                      itemBuilder: (context, index) {
                        //BlocProvider.of<YesattandanceCubit>(context).reset();
                        return randum.length == 0
                            ? Container()
                            : RandomAttendanceCard(
                                role: widget.role,
                                token: widget.token,
                                id: widget.id,
                                user: randum[index],
                              );
                      },
                    ),
                  );
                } else if (state is YesattandanceLoading) {
                  return Expanded(
                    child: Container(
                      height: 400,
                      child: ModalProgressHUD(
                          inAsyncCall: true, child: Container()),
                    ),
                  );
                } else {
                  return Expanded(child: Container());
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
