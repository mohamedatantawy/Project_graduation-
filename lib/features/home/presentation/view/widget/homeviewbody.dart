//import 'dart:ui_web';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_greduation/constants.dart';
import 'package:project_greduation/core/assets.dart';

class Homeviewbody extends StatelessWidget {
  const Homeviewbody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(70),
          topRight: Radius.circular(70),
        ),
      ),
      child: ListView(
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
                'My Courses',
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
          ListTile(
            title: Text(
              'E-commerce',
              style: TextStyle(
                color: kprimarykey,
              ),
            ),
            subtitle: Text(
              'take attandance',
              style: TextStyle(
                color: kprimarykey,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: SvgPicture.asset(
              Assets.assetsImagecourse,
              height: 40,
              width: 40,
              color: Colors.amber,
            ),
          ),
        ],
      ),
    );
  }
}
