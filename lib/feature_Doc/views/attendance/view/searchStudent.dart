import 'package:flutter/material.dart';
import 'package:project_greduation/core/styles/textstyles.dart';
import 'package:project_greduation/feature_Doc/models/studentsfordrawermodels.dart';
import 'package:project_greduation/feature_Doc/widgets/takeattendancesecend.dart';

class Searchstudent extends StatefulWidget {
  const Searchstudent(
      {super.key,
      required this.students,
      required this.token,
      required this.id,
      required this.role});
  final List<Studentsfordrawermodels> students;
  final String token;
  // final Studentsfordrawermodels user;
  final int id;
  final String role;
  @override
  State<Searchstudent> createState() => _SearchstudentState();
}

class _SearchstudentState extends State<Searchstudent> {
  List<Studentsfordrawermodels> studentit = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    studentit = widget.students;
  }

  filtersearch(String q) {
    setState(() {
      if (q.isEmpty) {
        studentit = widget.students;
      } else {
        studentit = widget.students
            .where(
              (element) =>
                  element.name!.toLowerCase().contains(q.toLowerCase()),
            )
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            child: TextField(
              onChanged: filtersearch,
              decoration: InputDecoration(
                labelText: 'Search',
                labelStyle: Textstyles.font15semiboldwite,
                hintText: 'Search students...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: Colors.white,
                    width: 1.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: Colors.white,
                    width: 2.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: Colors.white,
                    width: 1.0,
                  ),
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.white70,
                ),
                filled: true,
                fillColor: Colors.white.withOpacity(0.1),
              ),
            ),
          ),
          // Expanded to take remaining space
          studentit.isEmpty
              ? const Center(
                  child: Text(
                    'No students found',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                )
              // : Expanded(
              //     child: Column(
              //       children: List.generate(
              //         studentit.length,
              //         (index) => TakeAttendancefeatue(
              //           role: widget.role,
              //           token: widget.token,
              //           id: widget.id,
              //           user: studentit[index],
              //         ),
              //       ),
              //     ),
              //   )
              : Expanded(
                  child: SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.7,
                    child: ListView.builder(
                      //shrinkWrap: true,
                      itemCount: studentit.length,
                      itemBuilder: (context, index) {
                        return TakeAttendancefeatue(
                          role: widget.role,
                          token: widget.token,
                          id: widget.id,
                          user: studentit[index],
                        );
                      },
                    ),
                  ),
                ),
        ],
      ),
    );
  }
  //   return CustomScrollView(
  //     slivers: [
  //       SliverToBoxAdapter(
  //         child: SizedBox(
  //           height:100,
  //           child: Padding(
  //             padding: const EdgeInsets.all(12),
  //             child: TextField(
  //               scrollPadding: EdgeInsets.all(12),
  //               onChanged: filtersearch,
  //               decoration: InputDecoration(
  //                 labelText: 'Search',
  //                 labelStyle: Textstyles.font15semiboldwite,
  //                 border: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(12),
  //                   borderSide: BorderSide(
  //                     color: Colors.white, // Default border color
  //                     width: 1.0, // Border width
  //                   ),
  //                 ),
  //                 focusedBorder: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(12),
  //                   borderSide: BorderSide(
  //                     color: Colors.white, // Border color when focused
  //                     width: 2.0, // Border width when focused
  //                   ),
  //                 ),
  //                 enabledBorder: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(12),
  //                   borderSide: BorderSide(
  //                     color: Colors.white, // Border color when enabled
  //                     width: 1.0,
  //                   ),
  //                 ),
  //                 prefixIcon: Icon(Icons.search),
  //               ),
  //             ),
  //           ),
  //         ),
  //       ),
  //       // Use a Container to provide constraints
  //       SliverFillRemaining(
  //         child: SizedBox(
  //           height:
  //               MediaQuery.of(context).size.height - 350, // Adjust as needed
  //           child: ListView.builder(

  //             itemCount: studentit.length,
  //             itemBuilder: (context, index) {
  //               return TakeAttendancefeatue(
  //                 role: widget.role,
  //                 token: widget.token,
  //                 id: widget.id,
  //                 user: studentit[index],
  //               );
  //             },
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
