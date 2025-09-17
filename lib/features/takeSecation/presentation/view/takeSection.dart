import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:project_greduation/constants.dart';
import 'package:project_greduation/core/styles/textstyles.dart';
import 'package:project_greduation/features/home/presentation/view/models/detailsmodels.dart';
import 'package:project_greduation/features/takeSecation/presentation/widget/takeattendance.dart';
import 'package:project_greduation/features/takeattendance/presentation/manger/cubit/takelocation_cubit.dart';

class Takesection extends StatelessWidget {
  const Takesection({
    super.key,
    required this.user,
  });
  final Detailsmodels user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xffDDDEE5),
      appBar: AppBar(
        backgroundColor:const Color(0xffDDDEE5),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
            context.read<TakelocationCubit>().reset();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xff06224D),
          ),
        ),
        title: ListTile(
            title: Text(
              '${user.user.name}',
              style: Textstyles.font22medinmwithe.copyWith(color: kprimarykey),
            ),
            subtitle: Text(
              '${user.user.email}',
              style: Textstyles.font11lightwithe.copyWith(color: kprimarykey),
            ),
            leading: Container(
              //  margin: EdgeInsets.only(left: 4),
              width: 55,
              decoration: BoxDecoration(
                gradient:const LinearGradient(
                    begin: Alignment.topCenter,
                    colors: [Colors.amber, Colors.red]),
                borderRadius: BorderRadius.circular(16),
                color: Colors.amber,
              ),
            )),
      ),
      body: Container(
        margin:const EdgeInsets.only(top: 20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(70),
            topRight: Radius.circular(70),
          ),
        ),
        child: TakeSectionbody(
          number: user.number ?? -1,
          materialmodels: user.materialmodels,
        ),
      ),
    );
  }
}
