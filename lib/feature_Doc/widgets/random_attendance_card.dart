import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:project_greduation/core/styles/textstyles.dart';
import 'package:project_greduation/feature_Doc/logic/absentcubit/absent_cubit.dart';
import 'package:project_greduation/feature_Doc/models/yesattandancemodels/yesattandancemodels.dart';
import 'package:project_greduation/features/Auth/data/models/user/user.dart';

class RandomAttendanceCard extends StatefulWidget {
  final Yesattandancemodels user;
  final String token;
  final int id;
  RandomAttendanceCard({
    super.key,
    required this.user,
    required this.token,
    required this.id,
  });

  @override
  State<RandomAttendanceCard> createState() => _RandomAttendanceCardState();
}

class _RandomAttendanceCardState extends State<RandomAttendanceCard> {
  String? selectedStatus;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<AbsentCubit>(context).absentStudentsmothed(
        token: widget.token, id: widget.id, idst: widget.user.student!.id!);
  }

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
                widget.user.user!.name!.isNotEmpty
                    ? widget.user.user!.name![0]
                    : "?",
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
                  Text(widget.user.user!.name!,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14)),
                  Text(widget.user.user!.email!,
                      style:
                          const TextStyle(color: Colors.white, fontSize: 13)),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      buildStatusButton(
                          isloading, "Absent", Colors.red, Colors.black),
                      const SizedBox(width: 10),
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
        if (label == 'Absent') {
          //show dioyout
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(
                'This student is Absent',
                style: Textstyles.font18boldblue,
              ),
              content: SizedBox(
                height: 120,
                child: BlocConsumer<AbsentCubit, AbsentState>(
                  listener: (context, state) {
                    // if (state is Absentloading) {
                    // } else if (state is IsAvailablesSucuessSection) {
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
                                  TextButton(
                                      onPressed: () {
                                        BlocProvider.of<AbsentCubit>(context)
                                            .absentStudentsmothed(
                                                token: widget.token,
                                                id: widget.id,
                                                idst: widget.user.student!.id!);
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "Yes",
                                        style: Textstyles.font16boldwithe,
                                      )),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "No",
                                        style: Textstyles.font16boldwithe,
                                      ))
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
