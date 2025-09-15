import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:project_greduation/constants.dart';
import 'package:project_greduation/core/styles/textstyles.dart';
import 'package:project_greduation/feature_Doc/logic/attendance/attendance_cubit.dart';
import 'package:project_greduation/feature_Doc/logic/counter/counter_cubit.dart';
import 'package:project_greduation/feature_Doc/logic/yesattandancecubit/yesattandance_cubit.dart';
import 'package:project_greduation/feature_Doc/models/lecture_model/lecture_model.dart';
import 'package:project_greduation/feature_Doc/models/section_models/section_models.dart';
import 'package:project_greduation/feature_Doc/views/attendance/view/attendance_lecturee.dart';
import 'package:project_greduation/feature_Doc/views/attendance/view/random_attendance.dart';
import 'package:project_greduation/feature_Doc/views/attendance/view/takeattadance.dart';
import 'package:project_greduation/features/Auth/data/models/user/user.dart';

class Attandancetake extends StatefulWidget {
  const Attandancetake(
      {super.key, this.lecture, required this.user, this.section});
  final LectureModel? lecture;
  final Usermodels user;
  final SectionModels? section;

  @override
  State<Attandancetake> createState() => _AttandancetakeState();
}

class _AttandancetakeState extends State<Attandancetake> {
  int minute = 5;

  bool isloading = false;
  Timer? time;
  num number = 0;
  bool timeout = false;
  @override
  void initState() {
    BlocProvider.of<CounterCubit>(context).showPresent1(
        role: widget.user.role!,
        token: widget.user.token!,
        id: widget.user.role == 'assistant'
            ? widget.section!.id!
            : widget.lecture!.id!);
    //BlocProvider.of<CounterCubit>(context).closed();
    super.initState();
  }

  // @override
  // void setState(VoidCallback fn) {
  //   time = Timer(
  //       Duration(seconds: 1),
  //       () => BlocProvider.of<CounterCubit>(context).showPresent2(
  //           token: widget.user.token!, id: widget.lecture.course!.id!));
  // }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFFE8EBF2),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(40),
                  ),
                ),
                child: Center(
                  child: Row(
                    children: [
                      IconButton(
                          icon: const Icon(
                            Icons.arrow_back_ios_new,
                            color: Color(0xFF06224D),
                          ),
                          onPressed: () {
                            BlocProvider.of<CounterCubit>(context).closed();

                            Navigator.pop(context);
                          }),
                      const SizedBox(width: 45),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 60),
                        decoration: BoxDecoration(
                          color: const Color(0xFF0D2442),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4,
                            )
                          ],
                        ),
                        child: Text(
                          widget.user.role == 'doctor'
                              ? widget.lecture!.course!.name.toString()
                              : widget.section!.academicSchedule!.course!.name
                                  .toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Text(
              widget.user.role == 'doctor'
                  ? "Start Time: ${widget.lecture!.lectureStartHour.toString().substring(0, 5)}"
                  : "Start Time: ${widget.section!.sectionStartHour.toString().substring(0, 5)}",
              style: Textstyles.font26medinmblue,
            ),
            Text(
              widget.user.role == 'doctor'
                  ? "End Time: ${widget.lecture!.lectureEndHour.toString().substring(0, 5)}"
                  : "End Time: ${widget.section!.sectionEndHour.toString().substring(0, 5)}",
              style: Textstyles.font26medinmblue,
            ),
            Text(
              widget.user.role == 'doctor'
                  ? "Day: ${widget.lecture!.lectureDay.toString()}\nHall: ${widget.lecture!.lectureHall!.name.toString()} "
                  : "Day: ${widget.section!.sectionDay.toString()}\nHall: ${widget.section!.sectionHall!.name.toString()} ",
              //    'Saturday, Nov 7\nIn Hall 1',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF0D2442),
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 40),
            BlocConsumer<AttendanceCubit, AttendanceState>(
                listener: (context, state) {
              if (state is AttendanceLoading) {
                isloading = true;
              } else if (state is AttendanceFailure) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                  state.errMessage.toString(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                )));
                isloading = false;
              } else if (state is AttendanceSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                  state.message.toString(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                )));

                isloading = false;
              }
            }, builder: (context, state) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 40),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12), color: ksecandkey),
                child: SizedBox(
                  height: 300,
                  width: MediaQuery.sizeOf(context).width * 0.7,
                  child: ModalProgressHUD(
                    inAsyncCall: isloading,
                    child: Column(
                      children: [
                        Text(
                          "Choose the minute",
                          style: Textstyles.font26medinmblue,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: kprimarykey),
                                child: Text(
                                  '5',
                                  style: Textstyles.font16boldwithe,
                                )),
                            ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    minute = 10;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: kprimarykey),
                                child: Text(
                                  '10',
                                  style: Textstyles.font16boldwithe,
                                )),
                            ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    minute = 15;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: kprimarykey),
                                child: Text(
                                  '15',
                                  style: Textstyles.font16boldwithe,
                                )),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () {
                                  timeout = !timeout;
                                  BlocProvider.of<CounterCubit>(context)
                                      .closed();
                                  BlocProvider.of<AttendanceCubit>(context)
                                      .closeAttendance(
                                          depname: widget.user.role!,
                                          token: widget.user.token!,
                                          id: widget.user.role == 'assistant'
                                              ? widget.section!.id!
                                              : widget.lecture!.id!);
                                },
                                icon: Icon(
                                  Icons.pause_circle_filled_outlined,
                                  color: kcolorwhite,
                                  size: 35,
                                )),
                            IconButton(
                                onPressed: () {
                                  BlocProvider.of<CounterCubit>(context)
                                      .showPresent2(
                                          role: widget.user.role!,
                                          token: widget.user.token!,
                                          id: widget.user.role == 'assistant'
                                              ? widget.section!.id!
                                              : widget.lecture!.id!);
                                  BlocProvider.of<AttendanceCubit>(context)
                                      .openAttendance(
                                          depname: widget.user.role!,
                                          minute: minute,
                                          token: widget.user.token!,
                                          id: widget.user.role == 'assistant'
                                              ? widget.section!.id!
                                              : widget.lecture!.id!);
                                  print(minute.toString());
                                  // timeout == false
                                  //     ? time = Timer(
                                  //         Duration(minutes: minute),
                                  //         () => BlocProvider.of<CounterCubit>(
                                  //                 context)
                                  //             .closed())
                                  //     : null;
                                },
                                icon: Icon(
                                  Icons.play_circle,
                                  color: kcolorwhite,
                                  size: 35,
                                )),
                          ],
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return AttendanceLecture(
                                        role: widget.user.role!,
                                        token: widget.user.token!,
                                        id: widget.user.role == 'assistant'
                                            ? widget.section!.id!
                                            : widget.lecture!
                                                .id!, //widget.lecture.course!.id!,
                                      );
                                    }));
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: kprimarykey,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12))),
                                  child: Text(
                                    'Attendance Lecture',
                                    style: Textstyles.font16boldwithe,
                                  )),
                              SizedBox(
                                width: 5,
                              ),
                              ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: kprimarykey,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12))),
                                  child:
                                      BlocBuilder<CounterCubit, CounterState>(
                                    builder: (context, state) {
                                      if (state is CounterSucess) {
                                        number = state.present;
                                        return Text(
                                          state.present.toString(),
                                          style: Textstyles.font16boldwithe,
                                        );
                                      } else {
                                        return Text(
                                          number.toString(),
                                          style: Textstyles.font16boldwithe,
                                        );
                                      }
                                    },
                                  )),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Expanded(
                          child: ElevatedButton(
                              //RandomAttendanceScreen
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return RandomAttendanceScreen(
                                    role: widget.user.role!,
                                    token: widget.user.token!,
                                    id: widget.user.role == 'assistant'
                                        ? widget.section!.id!
                                        : widget.lecture!.id!,
                                  );
                                }));
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: kprimarykey,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12))),
                              child: Text(
                                'Random Attendance',
                                style: Textstyles.font16boldwithe,
                              )),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Expanded(
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return Takeattadancec(
                                    role: widget.user.role!,
                                    token: widget.user.token!,
                                    id: widget.user.role == 'assistant'
                                        ? widget.section!.id!
                                        : widget.lecture!
                                            .id!, //widget.lecture.course!.id!,
                                  );
                                }));
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: kprimarykey,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12))),
                              child: Text(
                                'Take Attendance',
                                style: Textstyles.font16boldwithe,
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
