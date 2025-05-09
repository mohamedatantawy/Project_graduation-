import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:project_greduation/feature_Doc/logic/attandancecubitdreaer/attandancedrewer_cubit.dart';
import 'package:project_greduation/feature_Doc/widgets/CardAttandDrawer.dart';
import 'package:project_greduation/feature_Doc/widgets/attendance_card.dart';

class Attandancedrawer extends StatefulWidget {
  const Attandancedrawer({super.key, required this.token, required this.id});
  final String token;
  final int id;
  @override
  State<Attandancedrawer> createState() => _AttandancedrawerState();
}

class _AttandancedrawerState extends State<Attandancedrawer> {
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<AttandancedrewerCubit>(context)
        .getallStudents(token: widget.token, id: widget.id);
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
                color: Colors.amber,
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
