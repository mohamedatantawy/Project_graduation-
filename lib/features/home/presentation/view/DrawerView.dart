import 'package:flutter/material.dart';
import 'package:project_greduation/constants.dart';
import 'package:project_greduation/core/styles/textstyles.dart';

class Drawerview extends StatelessWidget {
  const Drawerview({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: kprimarykey,
      
      child: Column(
        children: [
          SizedBox(
            height: 60,
          ),
          ListTile(
              title: Text(
                'mohamed tantawy',
                style: Textstyles.font22medinmwithe,
              ),
              subtitle: Text(
                '321569722222222222',
                style: Textstyles.font11lightwithe,
              ),
              leading: Container(
                margin: EdgeInsets.only(left: 10),
                width: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.amber,
                ),
              )),
          SizedBox(
            height: 60,
          ),
        ],
      ),
    );
  }
}
