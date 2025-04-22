import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:project_greduation/core/gorouter.dart';
import 'package:project_greduation/core/styles/textstyles.dart';
import 'package:project_greduation/core/utils/api/Apiserverce.dart';
import 'package:project_greduation/features/home/data/models/material/materialmodel.dart';
import 'package:project_greduation/features/home/presentation/manger/cubit/cubit/is_availables_cubit.dart';
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
        var response = await context
            .read<IsAvailablesCubit>()
            .getavialablemothed(
                id: materialmodelslist.academicScheduleId!,
                token: widget.user.token!,
                session: 'section');
      },
      child: Text(
        'Section',
        style: Textstyles.font18boldblue,
      ),
    );
  }
}
