import 'package:flutter/material.dart';
import 'package:project_greduation/constants.dart';
import 'package:project_greduation/features/home/presentation/view/DrawerView.dart';
import 'package:project_greduation/features/home/presentation/view/widget/homeviewbody.dart';

class Homeview extends StatefulWidget {
  const Homeview({super.key});

  @override
  State<Homeview> createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      drawer: Drawerview(),
      body:const Homeviewbody(),
    );
  }
}
