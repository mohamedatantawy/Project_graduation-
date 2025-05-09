// import 'package:flutter/material.dart';
// import 'package:project_greduation/feature_Doc/views/active_sessions/grade.dart';
// import 'package:project_greduation/feature_Doc/views/home/homepage.dart';

// class SessionsView extends StatelessWidget {
//   final List<String> weekDays = ['Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su'];
//   SessionsView({super.key});

//   int getCurrentDayIndex() {
//     int today = DateTime.now().weekday;
//     return today - 1;
//   }

//   @override
//   Widget build(BuildContext context) {
//     int selectedDayIndex = getCurrentDayIndex();
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Center(
//             child: Container(
//               height: 200,
//               width: double.infinity,
//               decoration: const BoxDecoration(
//                 color: Color(0xFFE8EBF2),
//                 borderRadius: BorderRadius.vertical(
//                   bottom: Radius.circular(40),
//                 ),
//               ),
//               child: Center(
//                 child: Row(
//                   children: [
//                     IconButton(
//                         icon: const Icon(
//                           Icons.arrow_back_ios_new,
//                           color: Color(0xFF06224D),
//                         ),
//                         onPressed: () {
//                           // Navigator.pushReplacement(
//                           //   context,
//                           //   MaterialPageRoute(
//                           //     builder: (context) => const HomeScreen(),
//                           //   ),
//                           // );
//                         }),
//                     const SizedBox(width: 50),
//                     Container(
//                       padding: const EdgeInsets.symmetric(
//                           vertical: 10, horizontal: 30),
//                       decoration: BoxDecoration(
//                         color: const Color(0xFF0D2442),
//                         borderRadius: BorderRadius.circular(12),
//                         boxShadow: const [
//                           BoxShadow(color: Colors.black12, blurRadius: 4)
//                         ],
//                       ),
//                       child: const Text(
//                         'Computer Vision',
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(height: 30),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               const Text('Today', style: TextStyle(fontSize: 20)),
//               Text(
//                 '${DateTime.now().month}/${DateTime.now().day}, ${DateTime.now().year}',
//                 style: const TextStyle(color: Color(0xFF0D2442), fontSize: 20),
//               ),
//             ],
//           ),
//           const SizedBox(height: 20),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: weekDays.asMap().entries.map((entry) {
//               int index = entry.key;
//               String day = entry.value;
//               bool isSelected = index == selectedDayIndex;
//               return Container(
//                 padding: const EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                   color:
//                       isSelected ? const Color(0xFF0D2442) : Colors.grey[300],
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Text(
//                   day,
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: isSelected ? Colors.white : const Color(0xFF0D2442),
//                   ),
//                 ),
//               );
//             }).toList(),
//           ),
//           const SizedBox(height: 20),
//           buildGradeTile(context, 'Grade 4', 'Information technology (IT)'),
//           buildGradeTile(context, 'Grade 3', 'Information system (IS)'),
//         ],
//       ),
//     );
//   }

//   Widget buildGradeTile(BuildContext context, String grade, String subtitle) {
//     return Card(
//       margin: const EdgeInsets.symmetric(vertical: 10),
//       elevation: 0,
//       child: ListTile(
//         title: Text(grade,
//             style: const TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 25,
//                 color: Color((0xFF0D2442)))),
//         subtitle: Text(subtitle),
//         trailing: IconButton(
//           iconSize: 45,
//           icon: const Icon(Icons.play_arrow_rounded, color: Color(0xFF0D2442)),
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => const GradeViewScreen()),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
