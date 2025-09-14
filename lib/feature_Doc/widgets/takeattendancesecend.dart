import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:project_greduation/core/styles/textstyles.dart';
import 'package:project_greduation/feature_Doc/logic/absentcubit/absent_cubit.dart';
import 'package:project_greduation/feature_Doc/logic/presentStudentCubit/present_student_cubit.dart';
import 'package:project_greduation/feature_Doc/models/studentsfordrawermodels.dart';

class TakeAttendancefeatue extends StatefulWidget {
  const TakeAttendancefeatue(
      {super.key,
      required this.token,
      required this.id,
      required this.role,
      required this.user});
  final String token;
  final Studentsfordrawermodels user;
  final int id;
  final String role;
  @override
  State<TakeAttendancefeatue> createState() => _TakeAttendancefeatueState();
}

class _TakeAttendancefeatueState extends State<TakeAttendancefeatue> {
  String? selectedStatus;
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF6B91C6),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: const BorderSide(color: Colors.white),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: const Color(0xFF97BCE8),
              radius: 20,
              child: Text(
                widget.user.name!.isNotEmpty ? widget.user.name![0] : "?",
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.user.name!,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14)),
                  //       Text(widget.user.,
                  // style: const TextStyle(
                  //     color: Colors.white,
                  //     fontWeight: FontWeight.bold,
                  //     fontSize: 14)),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      buildStatusButton(isloading, "Present",
                          const Color(0xFF0D2442), Colors.white),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildStatusButton(
      bool isloading, String label, Color bgColor, Color textColor) {
    bool isSelected = selectedStatus == label.toLowerCase();
    return ElevatedButton(
      onPressed: () {
        if (label == 'Present') {
          //show dioyout
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(
                'This student is present',
                style: Textstyles.font18boldblue,
              ),
              content: SizedBox(
                height: 120,
                child: BlocConsumer<PresentStudentCubit, PresentStudentState>(
                  listener: (context, state) {
                    if (state is Absentloading) {
                      isloading = true;
                    } else if (state is AbsentSucess) {
                      isloading = false;
                      // BlocProvider.of<YesattandanceCubit>(context).reset();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('This student is present now ')));
                      Navigator.pop(context);
                    } else {
                      isloading = false;
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text('Try again')));
                      Navigator.pop(context);
                    }
                    //else if (state is IsAvailablesSucuessSection) {
                    // } else if (state is IsAvailablesloading) {
                    //   //   isloading = true;
                    //   //   ScaffoldMessenger.of(context).showSnackBar(
                    //   //       SnackBar(content: Text('This Lecture is loading')));
                    //   // } else {
                    //   //   isloading = false;
                    //   //   ScaffoldMessenger.of(context).showSnackBar(
                    //   //       SnackBar(content: Text('This Lecture is not allow')));
                    // }
                  },
                  builder: (context, state) {
                    return SizedBox(
                      height: 120,
                      child: ModalProgressHUD(
                        inAsyncCall: isloading,
                        child: !isloading
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 45,
                                    width: MediaQuery.sizeOf(context).width,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          BlocProvider.of<PresentStudentCubit>(
                                                  context)
                                              .PresentStudentsmothed(
                                                  role: widget.role,
                                                  token: widget.token,
                                                  id: widget.id,
                                                  idst: widget.user.studentId!);

                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content: Text(
                                                      'This student is Present Now ')));
                                          Navigator.pop(context);
                                        },
                                        style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12)),
                                            backgroundColor: Colors.blueGrey),
                                        child: Text(
                                          "Yes",
                                          style: Textstyles.font26medinmblue,
                                        )),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 12),
                                    height: 45,
                                    width: MediaQuery.sizeOf(context).width,
                                    child: TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12)),
                                            backgroundColor: Colors.blueGrey),
                                        child: Text(
                                          "No",
                                          style: Textstyles.font26medinmblue,
                                        )),
                                  )
                                ],
                              )
                            : Container(
                                color: Colors.white,
                              ),
                      ),
                    );
                  },
                ),
              ),
              actions: [
                TextButton(
                  child: Text(
                    'Cancel',
                    style: Textstyles.font18boldblue,
                  ),
                  onPressed: () {
                    //  isloading = false;
                    Navigator.of(context).pop(); // Close the dialog
                  },
                ),
              ],
            ),
          );
        }
        setState(() {
          selectedStatus = label.toLowerCase();
        });
      },
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(30, 5),
        backgroundColor: isSelected ? bgColor : Colors.transparent,
        foregroundColor: isSelected ? textColor : Colors.white,
        side: const BorderSide(color: Colors.white),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3),
        ),
        elevation: isSelected ? 2 : 0,
      ),
      child: Text(label),
    );
  }
}
