
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project_greduation/core/gorouter.dart';
import 'package:project_greduation/core/styles/textstyles.dart';
import 'package:project_greduation/core/utils/api/Apiserverce.dart';
import 'package:project_greduation/features/home/data/models/material/materialmodel.dart';
import 'package:project_greduation/features/home/presentation/view/models/detailsmodels.dart';
import 'package:project_greduation/features/home/presentation/view/widget/homeviewbody.dart';

class takeattandanceforSection extends StatelessWidget {
  const takeattandanceforSection({
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
          session: 'section',
          id:materialmodelslist.academicScheduleId! ,
          token: widget.user.token!,
        );
       
        if (datas) {
         
          GoRouter.of(context).push(
            Gorouter.ktakesection,
            extra: Detailsmodels(
                materialmodels:materialmodelslist,
                user: widget.user),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('This Section not avalible now')));
        }
        Navigator.of(context).pop();
      },
      child: Text(
        'Section',
        style: Textstyles.font18boldblue,
      ),
    );
  }
}
