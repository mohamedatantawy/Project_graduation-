
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_greduation/core/assets.dart';

class SplashAnimation extends StatelessWidget {
  const SplashAnimation({
    super.key,
    required this.animation,
  });

  final Animation<Offset> animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, _) {
        return SlideTransition(
          position: animation,
          child: SvgPicture.asset(
            Assets.assetsImageVector,
          ),
        );
      },
    );
  }
}
