import 'package:flutter/material.dart';

class RegisteredStudent extends StatelessWidget {
  final List<Map<String, String>> students = [
    {'name': 'Ahmed Fathi', 'email': 's2021784515448@cis.dmu.edu.eg'},
    {'name': 'Omar Ashraf', 'email': 's4522184785448@cis.dmu.edu.eg'},
    {'name': 'Youssef Ahmed', 'email': 's4526543285448@cis.dmu.edu.eg'},
    {'name': 'Merna Ahmed', 'email': 's1236547825898@cis.dmu.edu.eg'},
    {'name': 'Ahmed Fathi', 'email': 's2021784515448@cis.dmu.edu.eg'},
    {'name': 'Omar Ashraf', 'email': 's4522184785448@cis.dmu.edu.eg'},
  ];

  String _getInitials(String name) {
    final parts = name.split(' ');
    if (parts.length >= 2) {
      return parts.first[0].toUpperCase();
    } else if (name.isNotEmpty) {
      return name[0].toUpperCase();
    }
    return '';
  }

  RegisteredStudent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff557DBB),
      body: SafeArea(
          child: Column(children: [
        const SizedBox(height: 30),
        Row(
          children: [
            IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Color(0xFF06224D),
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
            const SizedBox(width: 35),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
              decoration: BoxDecoration(
                color: const Color(0xFF0D2442),
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(color: Colors.black12, blurRadius: 4)
                ],
              ),
              child: const Text(
                'Registered Student',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: students.length,
            itemBuilder: (context, index) {
              final student = students[index];
              final name = student['name']!;
              final email = student['email']!;
              final initials = _getInitials(name);
              return Card(
                color: const Color(0xff557DBB),
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: Colors.white,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: const Color(0xFF97BCE8),
                        radius: 25,
                        child: Text(
                          initials,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            const SizedBox(height: 4.0),
                            Text(
                              email,
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ])),
    );
  }
}
