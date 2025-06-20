import 'package:flutter/material.dart';

class AttendanceCard extends StatelessWidget {
  final String name;
  final String email;
  final String time;
  final num status;

  const AttendanceCard({
    super.key,
    required this.name,
    required this.email,
    required this.time,
    required this.status,
  });

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
                name.isNotEmpty ? name[0] : "?",
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
                  Text(name,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14)),
                  Text(email,
                      style:
                          const TextStyle(color: Colors.white70, fontSize: 13)),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Text("You are marked",
                          style: TextStyle(color: Colors.white)),
                      const SizedBox(width: 30),
                      Text(status == 1 ? "Present" : "Absent",
                          style: status == 1
                              ? const TextStyle(
                                  color: Color(0xff4FF918),
                                  fontWeight: FontWeight.bold)
                              : const TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),
            Text(
              time.substring(0, 11),
              style: const TextStyle(color: Colors.white, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}
