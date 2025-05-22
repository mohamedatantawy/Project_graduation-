import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:project_greduation/constants.dart';
import 'package:project_greduation/core/styles/textstyles.dart';
import 'package:project_greduation/feature_Doc/logic/attendance/attendance_cubit.dart';
import 'package:project_greduation/feature_Doc/models/lecture_model/lecture_model.dart';
import 'package:project_greduation/feature_Doc/views/attendance/view/attendance_lecturee.dart';
import 'package:project_greduation/feature_Doc/views/attendance/view/random_attendance.dart';
import 'package:project_greduation/features/Auth/data/models/user/user.dart';
import 'package:project_greduation/features/home/presentation/view/models/detailsmodels.dart';

class Attandancetake extends StatefulWidget {
  const Attandancetake({super.key, required this.lecture, required this.user});
  final LectureModel lecture;
  final Usermodels user;
  @override
  State<Attandancetake> createState() => _AttandancetakeState();
}

class _AttandancetakeState extends State<Attandancetake> {
  int minute = 5;

  bool isloading = false;
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
                          widget.lecture.course!.name.toString(),
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
                  ? "Start Time: ${widget.lecture.lectureStartHour.toString().substring(0, 5)}"
                  : "Start Time: ${widget.lecture.sectionStartHour.toString().substring(0, 5)}",
              style: Textstyles.font26medinmblue,
            ),
            Text(
              widget.user.role == 'doctor'
                  ? "End Time: ${widget.lecture.lectureEndHour.toString().substring(0, 5)}"
                  : "End Time: ${widget.lecture.sectionEndHour.toString().substring(0, 5)}",
              style: Textstyles.font26medinmblue,
            ),
            Text(
              widget.user.role == 'doctor'
                  ? "Day: ${widget.lecture.lectureDay.toString()}\nHall: ${widget.lecture.lectureHall!.name.toString()} "
                  : "Day: ${widget.lecture.sectionDay.toString()}\nHall: ${widget.lecture.sectionHall!.name.toString()} ",
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
              } else {
                isloading = false;
              }
            }, builder: (context, state) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 40),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12), color: ksecandkey),
                child: SizedBox(
                  height: 250,
                  width: 250,
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
                                  BlocProvider.of<AttendanceCubit>(context)
                                      .closeAttendance(
                                          token: widget.user.token!,
                                          id: widget.lecture.course!.id!);
                                },
                                icon: Icon(
                                  Icons.pause_circle_filled_outlined,
                                  color: kcolorwhite,
                                  size: 35,
                                )),
                            IconButton(
                                onPressed: () {
                                  BlocProvider.of<AttendanceCubit>(context)
                                      .openAttendance(
                                          minute: minute,
                                          token: widget.user.token!,
                                          id: widget.lecture.course!.id!);
                                  print(minute.toString());
                                },
                                icon: Icon(
                                  Icons.play_circle,
                                  color: kcolorwhite,
                                  size: 35,
                                )),
                          ],
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return AttendanceLecture(
                                  token: widget.user.token!,
                                  id: widget.lecture.course!.id!,
                                );
                              }));
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: kprimarykey,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12))),
                            child: Text(
                              'Attendance Lecture',
                              style: Textstyles.font16boldwithe,
                            )),
                        ElevatedButton(
                            //RandomAttendanceScreen
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return RandomAttendanceScreen(
                                  token: widget.user.token!,
                                  id: widget.lecture.course!.id!,
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
                            ))
                      ],
                    ),
                  ),
                ),
              );
            })

            // BlocBuilder<AttendanceCubit, AttendanceState>(
            //   builder: (context, state) => Container(
            //     margin: const EdgeInsets.only(
            //       right: 30,
            //       left: 30,
            //     ),
            //     width: double.infinity,
            //     padding: const EdgeInsets.all(20),
            //     decoration: BoxDecoration(
            //       color: const Color(0xff557DBB),
            //       borderRadius: BorderRadius.circular(20),
            //     ),
            //     child: Column(
            //       children: [
            //         // Text(
            //         // //  formatTime(_currentTime),
            //         // //  style: const TextStyle(fontSize: 40, color: Colors.white),
            //         // ),
            //         const SizedBox(height: 5),
            //         Row(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: [
            //             // IconButton(
            //             //   iconSize: 35,
            //             //   // onPressed: () async {
            //             //   //   setState(() {
            //             //   //     openLoading = true;
            //             //   //   });
            //             //   //   await BlocProvider.of<AttendanceCubit>(context)
            //             //   //       .openAttendance();
            //             //   // },
            //             //   icon: openLoading
            //             //       ? const CircularProgressIndicator(
            //             //           color: Colors.white,
            //             //         )
            //             //       : const Icon(Icons.pause_circle_filled),
            //             //   color: Colors.white,
            //             // ),
            //             // IconButton(
            //             //   iconSize: 35,
            //             //   onPressed: () async {
            //             //     setState(() {
            //             //       closeLoading = true;
            //             //     });
            //             //     await BlocProvider.of<AttendanceCubit>(context)
            //             //         .closeAttendance();
            //             //   },
            //             //   icon: closeLoading
            //             //       ? const CircularProgressIndicator(
            //             //           color: Colors.white,
            //             //         )
            //             //       : const Icon(Icons.play_circle_fill),
            //             //   color: Colors.white,
            //             // ),
            //           ],
            //         ),
            //         const SizedBox(height: 10),
            //         ElevatedButton(
            //           style: ElevatedButton.styleFrom(
            //             backgroundColor: const Color(0xFF0D2442),
            //             shape: RoundedRectangleBorder(
            //               borderRadius: BorderRadius.circular(10),
            //             ),
            //           ),
            //           onPressed: () {
            //             Navigator.push(
            //               context,
            //               MaterialPageRoute(
            //                 builder: (context) => AttendanceLecture(),
            //               ),
            //             );
            //           },
            //           child: const Text(
            //             "Attendance Lecture",
            //             style: TextStyle(
            //                 fontSize: 18,
            //                 color: Colors.white,
            //                 fontWeight: FontWeight.bold),
            //           ),
            //         ),
            //         const SizedBox(height: 10),
            //         ElevatedButton(
            //           style: ElevatedButton.styleFrom(
            //             backgroundColor: const Color(0xFF0D2442),
            //             shape: RoundedRectangleBorder(
            //               borderRadius: BorderRadius.circular(10),
            //             ),
            //           ),
            //           onPressed: () {
            //             Navigator.push(
            //               context,
            //               MaterialPageRoute(
            //                 builder: (context) => RandomAttendanceScreen(),
            //               ),
            //             );
            //           },
            //           child: const Text(
            //             "Random Attendance",
            //             style: TextStyle(
            //                 fontSize: 18,
            //                 color: Colors.white,
            //                 fontWeight: FontWeight.bold),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
