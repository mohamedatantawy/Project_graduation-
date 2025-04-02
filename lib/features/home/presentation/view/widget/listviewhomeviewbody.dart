

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project_greduation/constants.dart';
import 'package:project_greduation/core/gorouter.dart';
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
    return ListView(
      children: [
        SizedBox(
          height: 35,
        ),
        Container(
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
        ),
        SizedBox(
          height: 35,
        ),
        Column(
          children: List.generate(
            subjectnumber ?? 0,
            (index) => ListTile(
              title: Text(
                '${listd[index].schedule!.course!.name}',
                style: TextStyle(
                  color: kprimarykey,
                ),
              ),
              subtitle: GestureDetector(
                onTap: () => GoRouter.of(context).push(Gorouter.sss),
                child: Text(
                  'take attandance',
                  style: TextStyle(
                    color: kprimarykey,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              trailing: trailIcontoTakeAttandance(
                widget: widget,
                materialmodelslist: listd[index],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
