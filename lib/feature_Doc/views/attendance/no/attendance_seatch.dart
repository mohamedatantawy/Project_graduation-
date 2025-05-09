import 'package:flutter/material.dart';
import 'package:project_greduation/feature_Doc/views/attendance/no/student_attendance.dart';

class AttendanceSearch extends StatelessWidget {
  const AttendanceSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          Center(
            child: Container(
              height: 150,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(40),
                ),
              ),
              child: Center(
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
                    const SizedBox(width: 45),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 60),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0D2442),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: const [
                          BoxShadow(color: Colors.black12, blurRadius: 4)
                        ],
                      ),
                      child: const Text(
                        'Attendance',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(right: 20, left: 20),
            margin: const EdgeInsets.all(5),
            height: 480,
            width: double.infinity,
            child: ListView(
              children: [
                const Text('',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 3),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    filled: true,
                    prefixIcon: const Icon(Icons.search),
                    prefixIconColor: const Color(0xFF000D3C),
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Text('Name :',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 3),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Mohamed Adel",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Text('Department :',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 3),
                TextField(
                  decoration: InputDecoration(
                    hintText: "iT",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Text('Grade :',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 3),
                TextField(
                  decoration: InputDecoration(
                    hintText: "4",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Text('Semester :',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 3),
                TextField(
                  decoration: InputDecoration(
                    hintText: "2",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const StudentAttendance();
                },
              ));
            },
            style: ElevatedButton.styleFrom(
              padding:
                  const EdgeInsets.symmetric(vertical: 12, horizontal: 100),
              backgroundColor: const Color(0xFF000D3C),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: const Text('Search',
                style: TextStyle(fontSize: 16, color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
