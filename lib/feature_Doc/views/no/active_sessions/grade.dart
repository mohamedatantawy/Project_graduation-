// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:project_greduation/feature_Doc/logic/attendance/attendance_cubit.dart';
// import 'package:project_greduation/feature_Doc/views/attendance/attendance_lecturee.dart';
// import 'package:project_greduation/feature_Doc/views/attendance/random_attendance.dart';

// class GradeViewScreen extends StatefulWidget {
//   const GradeViewScreen({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _SecondScreenState createState() => _SecondScreenState();
// }

// class _SecondScreenState extends State<GradeViewScreen> {
//   // late Timer _timer;
//   // late DateTime _currentTime;
//   // bool openLoading = false;
//   // bool closeLoading = false;

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   _currentTime = DateTime.now();
//   //   _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//   //     setState(() {
//   //       _currentTime = DateTime.now();
//   //     });
//   //   });
//   // }

//   // @override
//   // void dispose() {
//   //   _timer.cancel();
//   //   super.dispose();
//   // }

//   String formatTime(DateTime time) {
//     return '${time.hour}:${time.minute.toString().padLeft(2, '0')}';
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF7F8FA),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Center(
//               child: Container(
//                 height: 200,
//                 width: double.infinity,
//                 decoration: const BoxDecoration(
//                   color: Color(0xFFE8EBF2),
//                   borderRadius: BorderRadius.vertical(
//                     bottom: Radius.circular(40),
//                   ),
//                 ),
//                 child: Center(
//                   child: Row(
//                     children: [
//                       IconButton(
//                           icon: const Icon(
//                             Icons.arrow_back_ios_new,
//                             color: Color(0xFF06224D),
//                           ),
//                           onPressed: () {
//                             Navigator.pop(context);
//                           }),
//                       const SizedBox(width: 45),
//                       Container(
//                         padding: const EdgeInsets.symmetric(
//                             vertical: 10, horizontal: 60),
//                         decoration: BoxDecoration(
//                           color: const Color(0xFF0D2442),
//                           borderRadius: BorderRadius.circular(12),
//                           boxShadow: const [
//                             BoxShadow(
//                               color: Colors.black12,
//                               blurRadius: 4,
//                             )
//                           ],
//                         ),
//                         child: const Text(
//                           'Grade 4 iT',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 30),
//             const Text(
//               '9:00AM',
//               style: TextStyle(
//                 fontSize: 22,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const Text(
//               'Saturday, Nov 7\nIn Hall 1',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 color: Color(0xFF0D2442),
//                 fontSize: 20,
//               ),
//             ),
//             const SizedBox(height: 40),
//             BlocListener<AttendanceCubit, AttendanceState>(
//               listener: (BuildContext context, state) {
//                 if (state is AttendanceLoading) {
//                 } else if (state is AttendanceSuccess) {
//                   // setState(() {
//                   //   openLoading = false;
//                   //   closeLoading = false;
//                   // });
//                   showAlertDialog(context, state.message);
//                 } else if (state is AttendanceFailure) {
//                   // setState(() {
//                   //   openLoading = false;
//                   //   closeLoading = false;
//                   // });
//                   showAlertDialog(context, state.errMessage);
//                 }
//               },
//               child: Container(
//                 margin: const EdgeInsets.only(
//                   right: 30,
//                   left: 30,
//                 ),
//                 width: double.infinity,
//                 padding: const EdgeInsets.all(20),
//                 decoration: BoxDecoration(
//                   color: const Color(0xff557DBB),
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Column(
//                   children: [
//                     // Text(
//                     // //  formatTime(_currentTime),
//                     // //  style: const TextStyle(fontSize: 40, color: Colors.white),
//                     // ),
//                     const SizedBox(height: 5),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         // IconButton(
//                         //   iconSize: 35,
//                         //   // onPressed: () async {
//                         //   //   setState(() {
//                         //   //     openLoading = true;
//                         //   //   });
//                         //   //   await BlocProvider.of<AttendanceCubit>(context)
//                         //   //       .openAttendance();
//                         //   // },
//                         //   icon: openLoading
//                         //       ? const CircularProgressIndicator(
//                         //           color: Colors.white,
//                         //         )
//                         //       : const Icon(Icons.pause_circle_filled),
//                         //   color: Colors.white,
//                         // ),
//                         // IconButton(
//                         //   iconSize: 35,
//                         //   onPressed: () async {
//                         //     setState(() {
//                         //       closeLoading = true;
//                         //     });
//                         //     await BlocProvider.of<AttendanceCubit>(context)
//                         //         .closeAttendance();
//                         //   },
//                         //   icon: closeLoading
//                         //       ? const CircularProgressIndicator(
//                         //           color: Colors.white,
//                         //         )
//                         //       : const Icon(Icons.play_circle_fill),
//                         //   color: Colors.white,
//                         // ),
//                       ],
//                     ),
//                     const SizedBox(height: 10),
//                     ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: const Color(0xFF0D2442),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                       onPressed: () {
//                         // Navigator.push(
//                         //   context,
//                         //   MaterialPageRoute(
//                         //     builder: (context) => AttendanceLecture(),
//                         //   ),
//                         // );
//                       },
//                       child: const Text(
//                         "Attendance Lecture",
//                         style: TextStyle(
//                             fontSize: 18,
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: const Color(0xFF0D2442),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                       onPressed: () {
//                         // Navigator.push(
//                         //   context,
//                         //   MaterialPageRoute(
//                         //     builder: (context) => RandomAttendanceScreen(),
//                         //   ),
//                         // );
//                       },
//                       child: const Text(
//                         "Random Attendance",
//                         style: TextStyle(
//                             fontSize: 18,
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void showAlertDialog(BuildContext context, String alert) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           backgroundColor: Colors.white,
//           content: Text(
//             alert,
//             style: const TextStyle(
//               fontSize: 16,
//             ),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: const Text(
//                 'OK',
//                 style: TextStyle(
//                   color: Color.fromARGB(255, 21, 60, 112),
//                 ),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
