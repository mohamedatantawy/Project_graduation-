import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project_greduation/constants.dart';
import 'package:project_greduation/features/home/data/models/material/materialmodel.dart';
import 'package:project_greduation/features/home/presentation/view/widget/homeviewbody.dart';
import 'package:project_greduation/features/home/presentation/view/widget/trailIcontotakeAttandance.dart';

class ListViewhomeViewbody extends StatelessWidget {
  const ListViewhomeViewbody({
    super.key,
    required this.subjectnumber,
    required this.widget,
    required this.listd,
  });

  final int? subjectnumber;
  final Homeviewbody widget;
  final List<Materialmodels> listd;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(
            height: 35,
          ),
        ),
        SliverToBoxAdapter(
          child: custom_my_course(),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 35,
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: subjectnumber ?? 0,
            (context, index) {
              return _custom_ListView(index);
            },
          ),
          // child: Column(
          // children: List.generate(
          //   subjectnumber ?? 0,
          //   (index) => ListTile(
          //     title: Text(
          //       '${listd[index].schedule!.course!.name}',
          //       style: TextStyle(
          //         color: kprimarykey,
          //       ),
          //     ),
          //     subtitle: listd[index].schedule!.isLectureAttendanceOpen == 1
          //         ? Text(
          //             'The Lecture is open',
          //             style: TextStyle(
          //               color: kprimarykey,
          //               fontSize: 14,
          //               fontWeight: FontWeight.bold,
          //             ),
          //           )
          //         : Text(
          //             'The Lecture is not open',
          //             style: TextStyle(
          //               color: kprimarykey,
          //               fontSize: 14,
          //               fontWeight: FontWeight.bold,
          //             ),
          //           ),
          //     trailing: trailIcontoTakeAttandance(
          //       widget: widget,
          //       materialmodelslist: listd[index],
          //     ),
          //   ),
          // ),
        ),
        //),
      ],
    );
  }

  ListTile _custom_ListView(int index) {
    return ListTile(
      title: Text(
        '${listd[index].schedule!.course!.name}',
        style: TextStyle(
          color: kprimarykey,
        ),
      ),
      subtitle: listd[index].schedule!.isLectureAttendanceOpen == 1
          ? Text(
              'The Lecture is open',
              style: TextStyle(
                color: kprimarykey,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            )
          : Text(
              'The Lecture is not open',
              style: TextStyle(
                color: kprimarykey,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
      trailing: trailIcontoTakeAttandance(
        widget: widget,
        materialmodelslist: listd[index],
      ),
    );
  }

  Container custom_my_course() {
    return Container(
      // height: 60,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      margin: EdgeInsets.symmetric(
        horizontal: 100,
      ),
      decoration: BoxDecoration(
        color: kprimarykey,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          "My Cousres",
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
