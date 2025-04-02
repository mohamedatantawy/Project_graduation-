import 'package:flutter/material.dart';
import 'package:project_greduation/core/assets.dart';
import 'package:project_greduation/features/onboreding/presentation/View/widget/overViewbody.dart';
import 'package:project_greduation/features/onboreding/models/pageViewmodels.dart';

class Pageviews extends StatelessWidget {
  const Pageviews({super.key});
  final List<Pageviewmodels> data = const [
    Pageviewmodels(
      title: 'Features overview',
      dateils:
          'The attendance application is designed To simplify and facilitate the process of tracking student attendance at university lectures.',
    ),
    Pageviewmodels(
      title: 'Benefits of the application',
      dateils:
          'Quick attendance recording withoutthe need for paper rosters,register is reliable based on GPS ',
    ),
    Pageviewmodels(
      title: 'Get started',
      dateils: "Let's get started on how to learn about our attendance app ",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.sizeOf(context).width,
          decoration: const BoxDecoration(
              color: Colors.blueAccent,
              image: DecorationImage(
                  image: AssetImage(
                    Assets.assetsImageUnis,
                  ),
                  fit: BoxFit.cover)),
          child: overViewbody(data: data)),
    );
  }
}
