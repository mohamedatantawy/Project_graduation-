import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project_greduation/constants.dart';
import 'package:project_greduation/core/gorouter.dart';

class Choosepage extends StatelessWidget {
  const Choosepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 150,
        ),
        const Text(
          "Enter Start to go the Login",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        ElevatedButton(
          onPressed: () {
            GoRouter.of(context).pushReplacement(Gorouter.klogin);
          },
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
          child: const Text(
            ' Start ',
            style: TextStyle(
                fontSize: 22, color: kprimarykey, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        //   ElevatedButton(
        //     onPressed: () {
        //       GoRouter.of(context).pushReplacement(Gorouter.klogin);
        //     },
        //     style: ElevatedButton.styleFrom(
        //         padding: const EdgeInsets.symmetric(horizontal: 40),
        //         shape: RoundedRectangleBorder(
        //             borderRadius: BorderRadius.circular(12))),
        //     child: const Text(
        //       'Student',
        //       style: TextStyle(
        //           fontSize: 22, color: kprimarykey, fontWeight: FontWeight.bold),
        //     ),
        //   ),
        // ],
      ],
    );
  }
}
