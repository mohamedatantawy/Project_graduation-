import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:project_greduation/core/styles/textstyles.dart';
import 'package:project_greduation/feature_Doc/apis/absentStudents.dart';
import 'package:project_greduation/feature_Doc/apis/attendance_api.dart';
import 'package:project_greduation/feature_Doc/apis/lecture_info_api.dart';
import 'package:project_greduation/feature_Doc/logic/absentcubit/absent_cubit.dart';
import 'package:project_greduation/feature_Doc/logic/attendance/attendance_cubit.dart';
import 'package:project_greduation/feature_Doc/logic/lecture/lecture_cubit.dart';
import 'package:project_greduation/feature_Doc/logic/lecture/lecture_state.dart';
import 'package:project_greduation/feature_Doc/views/no/active_sessions/grade.dart';
import 'package:project_greduation/feature_Doc/views/no/active_sessions/sessions.dart';
import 'package:project_greduation/feature_Doc/views/attandancetake.dart';
import 'package:project_greduation/feature_Doc/widgets/custom_drawer.dart';
import 'package:project_greduation/feature_Doc/widgets/home_appbar.dart';
import 'package:project_greduation/features/Auth/data/models/user/user.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.user});
  final Usermodels user;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LectureCubit(LectureInfoApi(dio: Dio()))
            ..getLecInfo(token: widget.user.token!),
        ),
       
      ],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF3D6CB4),
        ),
        backgroundColor: const Color(0xFFE8EBF2),
        drawer: CustomDrawer(
          user: widget.user,
        ),
        body: Column(
          key: scaffoldkey,
          children: [
            HomeAppbar(
              user: widget.user,
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: BlocBuilder<LectureCubit, LectureState>(
                builder: (context, state) {
                  if (state is LectureLoading) {
                    return SizedBox(
                      height: 100,
                      child: ModalProgressHUD(
                          inAsyncCall: true,
                          child: Container(
                            color: Colors.white,
                          )),
                    );
                  } else if (state is LectureSuccess) {
                    return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(state.lectures.length, (index) {
                          return SizedBox(
                            height: 80,
                            child: ListTile(
                              title: Text(
                                state.lectures[index].course!.name.toString(),
                                style: Textstyles.font26medinmblue,
                              ),
                              trailing: IconButton(
                                iconSize: 50,
                                color: const Color(0xFF06224D),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Attandancetake(
                                              lecture: state.lectures[index],
                                              user: widget.user,
                                            )),
                                  );
                                },
                                icon: const Icon(Icons.play_arrow_rounded),
                              ),
                            ),
                          );
                        })
                        // [
                        //   TextButton(
                        //     onPressed: () {
                        //       Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //           builder: (context) => SessionsView(),
                        //         ),
                        //       );
                        //     },
                        //     child: const Text(
                        //       'Active sessions',
                        //       style: TextStyle(
                        //         decoration: TextDecoration.underline,
                        //         fontWeight: FontWeight.bold,
                        //         fontSize: 25,
                        //         color: Color(0xFF06224D),
                        //       ),
                        //     ),
                        //   ),
                        //   IconButton(
                        //     iconSize: 50,
                        //     color: const Color(0xFF06224D),
                        //     onPressed: () {
                        //       Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //             builder: (context) => SessionsView()),
                        //       );
                        //     },
                        //     icon: const Icon(Icons.play_arrow_rounded),
                        //   ),
                        // ],
                        );
                  } else {
                    return Container(
                      color: Colors.red,
                      height: 100,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
