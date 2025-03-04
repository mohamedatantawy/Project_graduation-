import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_greduation/core/assets.dart';
import 'package:project_greduation/features/onboreding/models/pageViewmodels.dart';

class Featureoverview extends StatelessWidget {
  const Featureoverview({super.key, required this.data});
  final Pageviewmodels data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(Assets.assetsImageVector),
          const SizedBox(
            height: 40,
          ),
          Text(
            data.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            data.dateils,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
