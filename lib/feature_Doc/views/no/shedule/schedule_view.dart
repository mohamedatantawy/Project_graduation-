import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:project_greduation/feature_Doc/logic/lecture/lecture_cubit.dart';
import 'package:project_greduation/feature_Doc/logic/lecture/lecture_state.dart';
import 'package:project_greduation/feature_Doc/models/lecture_model/lecture_model.dart';
import 'package:project_greduation/feature_Doc/views/no/shedule/add_lec_view.dart';

class Scheduleview extends StatelessWidget {
  const Scheduleview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage('images/profile.png'),
            ),
            SizedBox(width: 10),
            Text(
              'Hello, Alaa Mostafa',
              style: TextStyle(
                fontSize: 20,
                color: Color(0xFF000D3C),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            iconSize: 40,
            icon: const Icon(
              Icons.add_circle_outline_outlined,
              color: Color(0xFF000D3C),
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const AddLectureScreen();
              }));
            },
          ),
        ],
      ),
      body: SafeArea(
        child: BlocBuilder<LectureCubit, LectureState>(
          builder: (context, state) {
            if (state is LectureLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is LectureFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.red,
                ),
              );
            } else if (state is LectureSuccess) {
              final List<LectureModel> lectures = state.lectures;
              String formatTime(String timeString) {
                final DateFormat inputFormat = DateFormat('HH:mm:ss');
                final DateFormat outputFormat =
                    DateFormat('HH:mm'); // or 'hh:mm a' for AM/PM

                final DateTime dateTime = inputFormat.parse(timeString);
                return outputFormat.format(dateTime); // e.g. 14:00
              }

              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Color(0xFF000D3C),
                          ),
                          label: const Text(
                            'Oct',
                            style: TextStyle(
                              color: Color(0xFF000D3C),
                            ),
                          ),
                        ),
                        const Text(
                          'November',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF000D3C)),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Dec",
                                style: TextStyle(
                                  color: Color(
                                    0xFF000D3C,
                                  ),
                                ),
                              ),
                              SizedBox(width: 8),
                              Icon(Icons.arrow_forward),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: lectures.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          color: Colors.grey[100],
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 40, horizontal: 10),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF000D3C),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      // Text(
                                      //   role == 'doctor'
                                      //       ? lectures[index].lectureDay ??
                                      //           'Not Available'
                                      //       : lectures[index].sectionDay ??
                                      //           'Not Available',
                                      //   style: const TextStyle(
                                      //       color: Colors.white,
                                      //       fontWeight: FontWeight.bold,
                                      //       fontSize: 16),
                                      // ),
                                      const Text(
                                        '12/5/2024',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'IT (group 1)',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF000D3C),
                                        ),
                                      ),
                                      Divider(
                                        color: Colors.grey[400],
                                        thickness: 1,
                                        height: 20,
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        lectures[index].course!.name!,
                                        style: const TextStyle(
                                          color: Color(
                                            0xFF000D3C,
                                          ),
                                        ),
                                      ),
                                      // Text(
                                      //   role == 'doctor'
                                      //       ? lectures[index].lectureHall!.name!
                                      //       : lectures[index]
                                      //           .sectionHall!
                                      //           .name!,
                                      //   style: const TextStyle(
                                      //     color: Color(
                                      //       0xFF000D3C,
                                      //     ),
                                      //   ),
                                      // ),
                                      const SizedBox(height: 8),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.timer_outlined,
                                            size: 22,
                                            color: Color(0xFF000D3C),
                                          ),
                                          const SizedBox(width: 5),
                                          // Text(
                                          //   formatTime(
                                          //     role == 'doctor'
                                          //         ? lectures[index]
                                          //             .lectureStartHour!
                                          //         : lectures[index]
                                          //             .sectionStartHour!,
                                          //   ),
                                          //   style: const TextStyle(
                                          //     color: Color(0xFF000D3C),
                                          //   ),
                                          // ),
                                          // Text(
                                          //   '   -   ${formatTime(
                                          //     role == 'doctor'
                                          //         ? lectures[index]
                                          //             .lectureEndHour!
                                          //         : lectures[index]
                                          //             .sectionEndHour!,
                                          //   )}',
                                          //   style: const TextStyle(
                                          //     color: Color(0xFF000D3C),
                                          //   ),
                                          // ),
                                          const Spacer(),
                                          const Icon(
                                            Icons.people_outline,
                                            size: 22,
                                            color: Color(0xFF000D3C),
                                          ),
                                          const SizedBox(width: 5),
                                          // Text(
                                          //   role == 'doctor'
                                          //       ? lectures[index]
                                          //           .lectureHall!
                                          //           .numberOfChairsOrBenchesOrComputers
                                          //           .toString()
                                          //       : lectures[index]
                                          //           .sectionHall!
                                          //           .numberOfChairsOrBenchesOrComputers
                                          //           .toString(),
                                          //   style: const TextStyle(
                                          //     color: Color(0xFF000D3C),
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            }
            return const Center(
              child: Text('No lectures available'),
            );
          },
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: const Color(0xFF000D3C).withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: const Color(0xFF557DBB),
          selectedItemColor: const Color(0xFF000D3C),
          unselectedItemColor: Colors.white,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.view_list),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              label: 'Setting',
            ),
          ],
        ),
      ),
    );
  }
}
