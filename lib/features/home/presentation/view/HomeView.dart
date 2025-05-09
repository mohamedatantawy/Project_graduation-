import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:project_greduation/constants.dart';
import 'package:project_greduation/core/utils/server_loaction.dart';
import 'package:project_greduation/features/Auth/data/models/user/user.dart';
import 'package:project_greduation/features/home/data/data_sources/home_Remote_data_source.dart';
import 'package:project_greduation/features/home/presentation/manger/cubit/cubit/is_availables_cubit.dart';
import 'package:project_greduation/features/home/presentation/manger/cubit/materialshow_cubit.dart';
import 'package:project_greduation/features/home/presentation/view/DrawerView.dart';
import 'package:project_greduation/features/home/presentation/view/widget/homeviewbody.dart';
import 'package:project_greduation/helper/api.dart';

class Homeview extends StatelessWidget {
  const Homeview({super.key, required this.user});
  final Usermodels user;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              MaterialshowCubit(getIt.get<HomeRemoteDataSourceImple>())
                ..getsubjectcu(token: user.token!),
        ),
        BlocProvider(
          create: (context) =>
              IsAvailablesCubit(getIt.get<HomeRemoteDataSourceImple>()),
        ),
      ],
      child: Scaffold(
        backgroundColor: kbackgroundcolor,
        appBar: AppBar(
          leading: Builder(builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(
                Icons.menu,
                size: 40,
                color: kprimarykey,
              ),
            );
          }),
          toolbarHeight: 122,
          backgroundColor: kbackgroundcolor,
        ),
        drawer: Drawerview(
          user: user,
        ),
        body: Homeviewbody(
          user: user,
        ),
      ),
    );
  }
}
