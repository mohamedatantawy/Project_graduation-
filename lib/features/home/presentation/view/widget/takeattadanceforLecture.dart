import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project_greduation/core/gorouter.dart';
import 'package:project_greduation/core/styles/textstyles.dart';
import 'package:project_greduation/core/utils/api/Apiserverce.dart';
import 'package:project_greduation/features/home/data/models/material/materialmodel.dart';
import 'package:project_greduation/features/home/presentation/view/models/detailsmodels.dart';
import 'package:project_greduation/features/home/presentation/view/widget/homeviewbody.dart';

class takeatandanceforLecture extends StatelessWidget {
  const takeatandanceforLecture({
    super.key,
    required this.widget,
    required this.materialmodelslist,
  });

  final Homeviewbody widget;
  final Materialmodels materialmodelslist;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () async {
          var datas = await Apiserverce(Dio()).Is_available(
              id: materialmodelslist.academicScheduleId!,
              token: widget.user.token!,
              session: 'lecture');

          if (datas) {
            // detailsmodels =

            GoRouter.of(context).push(
              Gorouter.ktake,
              extra: Detailsmodels(
                  materialmodels: materialmodelslist, user: widget.user),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('This Lecture not avalible now')));
          }
          Navigator.of(context).pop();
        },
        child: Text(
          'Lecture',
          style: Textstyles.font18boldblue,
        ));
  }
}
