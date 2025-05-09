import 'package:flutter/material.dart';
import 'package:project_greduation/core/styles/textstyles.dart';
import 'package:project_greduation/feature_Doc/models/studentsfordrawermodels.dart';

class Cardattanddrawer extends StatelessWidget {
  const Cardattanddrawer({super.key, required this.user});
  final Studentsfordrawermodels user;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF6B91C6), // blue background
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: const Color(0xff97BCE8),
              radius: 20,
              child: Text(
                user.name!.isNotEmpty ? user.name![0] : "?",
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(user.name!, style: Textstyles.font16boldwithe),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Total :", style: Textstyles.font16boldwithe),
                            Text(
                                (user.totalAbsent! + user.totalPresent!)
                                    .toString(),
                                style: Textstyles.font16boldwithe),
                            const SizedBox(width: 30),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text("Present :",
                            style: TextStyle(color: Color(0xff4FF918))),
                        const SizedBox(width: 5),
                        Text(user.totalPresent.toString(),
                            style: const TextStyle(
                                color: Color(0xff4FF918),
                                fontWeight: FontWeight.bold)),
                        const SizedBox(width: 30),
                        const Text("Absent :",
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(width: 5),
                        Text(user.totalAbsent.toString(),
                            style: const TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
