import 'package:flutter/material.dart';
import 'package:project_greduation/core/assets.dart';
import 'package:project_greduation/features/Auth/data/models/user/user.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key, required this.user});
  final Usermodels user;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 40),
      decoration: const BoxDecoration(
        color: Color(0xFF3D6CB4),
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(60),
        ),
      ),
      child: Row(
        children: [
          SizedBox(width: 16),
          // CircleAvatar(
          //   radius: 30,
          //   backgroundImage: AssetImage(
          //       Assets.assetsImageVector), // replace with actual image path
          // ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello, ${user.name}',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text(
                'Have a nice day !',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
