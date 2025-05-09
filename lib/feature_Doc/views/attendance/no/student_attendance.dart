import 'package:flutter/material.dart';
import 'package:project_greduation/feature_Doc/views/attendance/no/registered_student.dart';

class StudentAttendance extends StatelessWidget {
  const StudentAttendance({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding:
                const EdgeInsets.only(top: 60, left: 25, right: 20, bottom: 50),
            decoration: const BoxDecoration(
              color: Color(0xFFE8EBF2),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(40),
              ),
            ),
            child: Row(
              children: [
                IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Color(0xFF06224D),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: const Color(0xFFE8EBF2),
                child: Image.asset(
                  'images/image 2.png',
                  width: 60,
                  height: 60,
                ),
              ),
            ],
          ),
          const Center(
            child: Text("Mohammed Adel",
                style: TextStyle(fontSize: 20, color: Color(0xFF06224D))),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Name',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 3),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Mohammed Adel",
                    hintStyle: const TextStyle(color: Color(0xFF000D3C)),
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Text('Grade',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 3),
                TextField(
                  decoration: InputDecoration(
                    hintText: "4",
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Text('Department',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 3),
                TextField(
                  decoration: InputDecoration(
                    hintText: "iT",
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return RegisteredStudent();
                }));
              },
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 80),
                backgroundColor: const Color(0xFF000D3C),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Text('View Attendance',
                  style: TextStyle(fontSize: 16, color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
