import 'package:flutter/material.dart';
import 'package:project_greduation/core/styles/textstyles.dart';

class Notificationviewbody extends StatelessWidget {
  const Notificationviewbody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'today',
              style: Textstyles.font16medinmbluesetting,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.info_outline,
              size: 30,
            ),
            title: Text(
              'You received a Warning in Computer Vision Subject.',
              style: Textstyles.font15extrlightblue,
            ),
            subtitle: Text(
              '2003/8',
              style: Textstyles.font15extrlightblue,
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'yesterday',
              style: Textstyles.font16medinmbluesetting,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.info_outline,
              size: 30,
            ),
            title: Text(
              'You received a Warning in Computer Vision Subject.',
              style: Textstyles.font15extrlightblue,
            ),
            subtitle: Text(
              '2003/8',
              style: Textstyles.font15extrlightblue,
            ),
          ),
        ],
      ),
    );
  }
}
