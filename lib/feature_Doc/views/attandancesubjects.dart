import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project_greduation/constants.dart';
import 'package:project_greduation/core/styles/textstyles.dart';
import 'package:project_greduation/feature_Doc/models/lecture_model/lecture_model.dart';
import 'package:project_greduation/feature_Doc/models/section_models/section_models.dart';
import 'package:project_greduation/feature_Doc/views/attandanceDrawer.dart';

class Attandancesubjects extends StatelessWidget {
  const Attandancesubjects({
    super.key,
    this.lectures,
    required this.token,
    required this.role,
    this.section,
  });
  final List<LectureModel>? lectures;
  final List<SectionModels>? section;

  final String token;
  final String role;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      appBar: AppBar(
        title: Text(
          'Attendance  ',
          style: Textstyles.font26medinmblue.copyWith(color: kcolorwhite),
        ),
        centerTitle: true,
        shape:const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(100),
                bottomRight: Radius.circular(100))),
        toolbarHeight: MediaQuery.sizeOf(context).height * 0.26,
        backgroundColor: ksecandkey,
        leading: Align(
          alignment: Alignment.topLeft,
          child: IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon:const Padding(
              padding:  EdgeInsets.only(top: 30),
              child: const Icon(
                Icons.arrow_back_ios,
                color: kcolorwhite,
              ),
            ),
          ),
        ),
      ),
      body: Attandancebody(
        role: role,
        token: token,
        section: role == 'assistant' ? section : null,
        lectures: role == 'assistant' ? null : lectures,
      ),
    );
  }
}

class Attandancebody extends StatelessWidget {
  const Attandancebody({
    super.key,
    this.lectures,
    required this.token,
    required this.role,
    this.section,
  });
  final List<LectureModel>? lectures;
  final String token;
  final String role;
  final List<SectionModels>? section;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
       const SizedBox(
          height: 20,
        ),
        Text(
          'Choose the Subject :',
          style:
              Textstyles.font18boldblue.copyWith(fontWeight: FontWeight.w400),
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.62,
          child: GridView.builder(
            itemCount: role == 'assistant' ? section!.length : lectures!.length,
            gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 30,
                childAspectRatio: 1.3),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  if (index == index) {
                    //  Apiserverce(Dio()).getReport(session: session, id: id, token: token)
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Attandancedrawer(
                        role: role,
                        id: role == 'assistant'
                            ? section![index].id!
                            : lectures![index].id!,
                        token: token,
                      );
                    }));
                  }
                },
                child: Container(
                  margin:const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                     const   BoxShadow(
                          color: Colors.black,
                          offset: Offset(10, 10),
                          blurRadius: 1,
                          spreadRadius: -5,
                        )
                      ]),
                  child: Card(
                    shadowColor: Colors.black,
                    color: kcolorcard,
                    child: Center(
                        child: Text(
                      '${role == 'assistant' ? section![index].academicSchedule!.course!.name : lectures![index].course!.name}',
                      style: Textstyles.font15semiboldwite,
                    )),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
