import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project_greduation/core/assets.dart';
import 'package:project_greduation/core/gorouter.dart';
import 'package:project_greduation/features/splash/presentation/view/widget/splashAnimation.dart';

class Splashviewbody extends StatefulWidget {
  const Splashviewbody({
    super.key,
  });

  @override
  State<Splashviewbody> createState() => _SplashviewbodyState();
}

class _SplashviewbodyState extends State<Splashviewbody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationContainer;
  late Animation<Offset> animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initAnimation();
    navigatorhome();
  }

  void navigatorhome() {
    Future.delayed(
      const Duration(seconds: 5),
      () {
        GoRouter.of(context).pushReplacement(Gorouter.pageViews);
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationContainer.dispose();
  }

  void initAnimation() {
    animationContainer = AnimationController(
        vsync: this,
        duration: const Duration(
          seconds: 3,
        ));
    animation = Tween<Offset>(begin: Offset(0, 4), end: Offset.zero)
        .animate(animationContainer);
    animationContainer.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        decoration: const BoxDecoration(
            color: Colors.blueAccent,
            image: DecorationImage(
                image: AssetImage(
                  Assets.assetsImageUnis,
                ),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Hello',
              style: TextStyle(
                fontSize: 55,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            SplashAnimation(animation: animation)
          ],
        ),
      ),
    );
  }
}
