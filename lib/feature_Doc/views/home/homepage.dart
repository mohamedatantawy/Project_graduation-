import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:project_greduation/constants.dart';
import 'package:project_greduation/core/styles/textstyles.dart';
import 'package:project_greduation/feature_Doc/apis/lecture_info_api.dart';
import 'package:project_greduation/feature_Doc/logic/counter/counter_cubit.dart';
import 'package:project_greduation/feature_Doc/logic/lecture/lecture_cubit.dart';
import 'package:project_greduation/feature_Doc/logic/lecture/lecture_state.dart';
import 'package:project_greduation/feature_Doc/models/lecture_model/lecture_model.dart';
import 'package:project_greduation/feature_Doc/models/section_models/section_models.dart';
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

  List<LectureModel> lectures = [];
  List<SectionModels> section = [];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LectureCubit(LectureInfoApi(dio: Dio()))
            ..getLecInfo(token: widget.user.token!, depname: widget.user.role!),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF3D6CB4),
        ),
        backgroundColor: const Color(0xFFE8EBF2),
        drawer: CustomDrawer(
          lectures: widget.user.role == 'assistant' ? null : lectures,
          section: widget.user.role == 'assistant' ? section : null,
          user: widget.user,
        ),
        body: ListView(
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
                            color: const Color(0xFFE8EBF2),
                          )),
                    );
                  } else if (state is LectureSuccess) {
                    lectures = state.lectures;
                    return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(state.lectures.length, (index) {
                          //   lectures.add(state.lectures[index]);
                          return SizedBox(
                            height: 80,
                            child: ListTile(
                              subtitle: Text(
                                'Take attandance ',
                                style: Textstyles.font14medinmblue,
                              ),
                              title: Text(
                                state.lectures[index].course!.name.toString(),
                                style: Textstyles.font26medinmblue
                                    .copyWith(color: kprimarykey),
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
                        }));
                  } else if (state is SectionSuccess) {
                    section = state.section;

                    return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(state.section.length, (index) {
                          //   lectures.add(state.lectures[index]);
                          return SizedBox(
                            height: 80,
                            child: ListTile(
                              subtitle: Text(
                                'Take attandance    --> ${state.section[index].academicSchedule!.lectureDay!} \n Start at : ${state.section[index].academicSchedule!.lectureStartHour!.toString().substring(0, 5)}',
                                style: Textstyles.font14medinmblue,
                              ),
                              title: Text(
                                state.section[index].section_numbers!.length > 1
                                    ? '${state.section[index].academicSchedule!.course!.name}  ${state.section[index].section_numbers.toString().substring(1, (state.section[index].section_numbers!.length * 3 - 1))}'
                                    : state.section[index].academicSchedule!
                                        .course!.name
                                        .toString(),
                                style: Textstyles.font26medinmblue
                                    .copyWith(color: kprimarykey),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              trailing: IconButton(
                                iconSize: 50,
                                color: const Color(0xFF06224D),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Attandancetake(
                                              section: state.section[index],
                                              user: widget.user,
                                            )),
                                  );
                                },
                                icon: const Icon(Icons.play_arrow_rounded),
                              ),
                            ),
                          );
                        }));
                  } else {
                    return Expanded(
                      child: Container(
                        color: Colors.white,
                        height: 100,
                        child:const Center(
                          child: Text('not found any Students '),
                        ),
                      ),
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
