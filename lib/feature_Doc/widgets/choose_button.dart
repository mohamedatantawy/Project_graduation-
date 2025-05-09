import 'package:flutter/material.dart';

class ChooseButton extends StatelessWidget {
  const ChooseButton({super.key, required this.text, this.ontap});
  final String text;
  final VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 5,
      minWidth: 150,
      height: 50,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      onPressed: () {
        ontap?.call();
      },
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Color(0xFF0A3981),
        ),
      ),
    );
  }
}
