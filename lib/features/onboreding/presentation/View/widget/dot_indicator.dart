import 'package:flutter/material.dart';

class customDotIndicator extends StatelessWidget {
  const customDotIndicator({super.key, required this.isactive});
  final bool isactive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      height: 10,
      width: 10,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: isactive ? Colors.blue[900] : Colors.white,
      ),
    );
  }
}
