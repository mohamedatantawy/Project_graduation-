import 'package:flutter/material.dart';
import 'package:project_greduation/constants.dart';

class Customelevatedbutton extends StatelessWidget {
  const Customelevatedbutton({super.key, required this.title, this.onpressed});
  final String title;
  final void Function()? onpressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      height: 48,
     //color: Colors.transparent,
      width: double.infinity,
      
      child: ElevatedButton(
        onPressed: onpressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: kprimarykey,
            elevation: 0,
            //  padding: const EdgeInsets.symmetric(horizontal: 100),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
              12,
            ))),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
