import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project_greduation/core/gorouter.dart';
import 'package:project_greduation/feature_Doc/views/attandanceDrawer.dart';
import 'package:project_greduation/feature_Doc/views/attendance/no/student_attendance.dart';
import 'package:project_greduation/features/Auth/data/models/user/user.dart';
import 'package:project_greduation/features/home/presentation/view/models/drawermodels.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key, required this.user});
  final Usermodels user;
  final List<Drawermodels> itemsdrawer = const [
    Drawermodels(title: 'Home', icon: Icons.home),
    Drawermodels(title: 'Profile', icon: Icons.person),
    Drawermodels(
        title: 'Attendance', icon: Icons.insert_chart_outlined_outlined),
    Drawermodels(title: 'Setting', icon: Icons.settings),
  ];
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF2354A0), Color(0xFF020C1B)],
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
          children: [
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    title: Text(
                      user.name.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      user.email.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 40),
            Container(
              padding: const EdgeInsets.only(left: 26, right: 26),
              child: Column(
                  children: List.generate(itemsdrawer.length, (index) {
                return Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      title: Center(
                        child: Text(
                          itemsdrawer[index].title,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      leading: Icon(itemsdrawer[index].icon),
                      trailing: const Icon(Icons.arrow_forward_ios_rounded),
                      textColor: Colors.white,
                      iconColor: Colors.white,
                      onTap: () {
                        if (index == 0) {
                          Navigator.pop(context);
                        } else if (index == 1) {
                          GoRouter.of(context)
                              .push(Gorouter.profile, extra: user);
                        } else if (index == 2) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Attandancedrawer(
                              token: user.token!,
                              id: 2,
                            );
                          }));
                        } else if (index == 3) {
                          GoRouter.of(context)
                              .push(Gorouter.setting, extra: user.token);
                        }
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    const Divider(
                      height: 5,
                      color: Colors.white,
                      indent: 15,
                      endIndent: 20,
                    ),
                  ],
                );
              })
                  //   ListTile(
                  //     title: const Text(
                  //       "\t\t\t\tHome",
                  //       style: TextStyle(fontWeight: FontWeight.bold),
                  //     ),
                  //     leading: const Icon(Icons.home_outlined),
                  //     trailing: const Icon(Icons.arrow_forward_ios_rounded),
                  //     textColor: Colors.white,
                  //     iconColor: Colors.white,
                  //     onTap: () {
                  //       Navigator.pop(context);
                  //     },
                  //   ),
                  //   const Divider(
                  //     height: 5,
                  //     color: Colors.white,
                  //   ),
                  //   ListTile(
                  //     title: const Text(
                  //       "\t\t\t\tProfile",
                  //       style: TextStyle(fontWeight: FontWeight.bold),
                  //     ),
                  //     leading: const Icon(Icons.person_2_outlined),
                  //     trailing: const Icon(Icons.arrow_forward_ios_rounded),
                  //     textColor: Colors.white,
                  //     iconColor: Colors.white,
                  //     onTap: () {
                  //       Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //           builder: (context) => const ProfileScreen(),
                  //         ),
                  //       );
                  //     },
                  //   ),
                  //   const Divider(
                  //     height: 6,
                  //     color: Colors.white,
                  //   ),
                  //   ListTile(
                  //     title: const Text(
                  //       "\t\t\t\tShedule",
                  //       style: TextStyle(fontWeight: FontWeight.bold),
                  //     ),
                  //     leading: const Icon(Icons.table_chart),
                  //     trailing: const Icon(Icons.arrow_forward_ios_rounded),
                  //     textColor: Colors.white,
                  //     iconColor: Colors.white,
                  //     onTap: () {
                  //       Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //           builder: (context) => const Scheduleview(),
                  //         ),
                  //       );
                  //     },
                  //   ),
                  //   const Divider(
                  //     height: 6,
                  //     color: Colors.white,
                  //   ),
                  //   ListTile(
                  //     title: const Text(
                  //       "Attendance",
                  //       style: TextStyle(fontWeight: FontWeight.bold),
                  //     ),
                  //     leading: const Icon(Icons.analytics_outlined),
                  //     trailing: const Icon(Icons.arrow_forward_ios_rounded),
                  //     textColor: Colors.white,
                  //     iconColor: Colors.white,
                  //     onTap: () {
                  //       Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //           builder: (context) => const AttendanceSearch(),
                  //         ),
                  //       );
                  //     },
                  //   ),
                  //   const Divider(
                  //     height: 5,
                  //     color: Colors.white,
                  //   ),
                  //   ListTile(
                  //     title: const Text(
                  //       "\t\t\t\tSetting",
                  //       style: TextStyle(fontWeight: FontWeight.bold),
                  //     ),
                  //     leading: const Icon(Icons.settings_outlined),
                  //     trailing: const Icon(Icons.arrow_forward_ios_rounded),
                  //     textColor: Colors.white,
                  //     iconColor: Colors.white,
                  //     onTap: () {
                  //       GoRouter.of(context)
                  //           .push(Gorouter.setting, extra: user.token);
                  //       // Navigator.push(
                  //       //   context,
                  //       //   MaterialPageRoute(
                  //       //     builder: (context) => const settin(),
                  //       //   ),
                  //       // );
                  //     },
                  //   ),
                  //   const Divider(
                  //     height: 5,
                  //     color: Colors.white,
                  //   ),
                  // ],
                  ),
            ),
            const SizedBox(height: 120),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Navigator.pushReplacement(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const SignInScreen(),
                  //   ),
                  // );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 70, vertical: 14),
                ),
                child: const Text(
                  'Logout',
                  style: TextStyle(
                      color: Color(0xFF000D3C),
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
