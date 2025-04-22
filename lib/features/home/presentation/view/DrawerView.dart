import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_greduation/constants.dart';
import 'package:project_greduation/features/Auth/data/models/user/user.dart';
import 'package:project_greduation/features/home/data/models/material/materialmodel.dart';
import 'package:project_greduation/features/home/presentation/manger/cubit/materialshow_cubit.dart';
import 'package:project_greduation/features/home/presentation/view/models/drawermodels.dart';
import 'package:project_greduation/features/home/presentation/view/widget/drawerviewbody.dart';

class Drawerview extends StatefulWidget {
  const Drawerview({super.key, required this.user});

  final User user;

  @override
  State<Drawerview> createState() => _DrawerviewState();
}

class _DrawerviewState extends State<Drawerview> {
  final List<Drawermodels> itemsofdrawer = const [
    Drawermodels(title: 'Home', icon: Icons.home),
    Drawermodels(title: 'Profile', icon: Icons.person),
    Drawermodels(title: 'Notification', icon: Icons.notifications),
    Drawermodels(
        title: 'Attendance', icon: Icons.insert_chart_outlined_outlined),
    Drawermodels(
      title: 'Setting',
      icon: Icons.settings,
    ),
  ];
  // late List<Materialmodels> materialmodels;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //materialmodels = BlocProvider.of<MaterialshowCubit>(context)
    //   .getsubjectcu(token: widget.user.token!);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.75,
      decoration: BoxDecoration(
          //color: Colors.blue,
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            kbackgrounddrawer,
            kbackgrounddrawer,
            kbackgrounddrawer,
            kbackgrounddrawershard
          ])),
      child: Drawerviewbody(
        widget: widget,
        itemsofdrawer: itemsofdrawer,
        // materialmodels: materialmodels
      ),
    );
  }
}
