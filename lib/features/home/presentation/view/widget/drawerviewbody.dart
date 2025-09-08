import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:project_greduation/constants.dart';
import 'package:project_greduation/core/gorouter.dart';
import 'package:project_greduation/core/styles/textstyles.dart';
import 'package:project_greduation/core/utils/api/Apiserverce.dart';
import 'package:project_greduation/core/utils/sharedperfernace.dart';
import 'package:project_greduation/features/home/presentation/view/DrawerView.dart';
import 'package:project_greduation/features/home/presentation/view/models/drawermodels.dart';
import 'package:project_greduation/features/home/presentation/view/widget/customdraweritem.dart';

class Drawerviewbody extends StatelessWidget {
  const Drawerviewbody({
    super.key,
    required this.widget,
    required this.itemsofdrawer,
    // required this.materialmodels,
  });

  final Drawerview widget;
  final List<Drawermodels> itemsofdrawer;
  // final List<Materialmodels> materialmodels;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 60,
        ),
        ListTile(
          title: Text(
            '${widget.user.name}',
            style: Textstyles.font22medinmwithe,
          ),
          subtitle: Text(
            '${widget.user.email}',
            style: Textstyles.font11lightwithe,
          ),
          leading: Icon(
            Icons.person,
            color: Colors.white,
          ),
          // leading: Container(
          //   //  margin: EdgeInsets.only(left: 4),
          //   width: 25,
          //   height: 25,
          //   decoration: BoxDecoration(
          //     gradient: LinearGradient(
          //         begin: Alignment.topCenter,
          //         colors: [Colors.amber, Colors.red]),
          //     borderRadius: BorderRadius.circular(16),
          //     color: Colors.amber,
          //   ),
          //   child: Text(widget.user.name.toString().substring(0, 1)),
          // ),
        ),
        SizedBox(
          height: 60,
        ),
        Column(
          children: List.generate(
            itemsofdrawer.length,
            (index) {
              return customdraweritems(
                  // materialmodels: materialmodels,
                  user: widget.user,
                  title: itemsofdrawer[index].title,
                  index: index,
                  icon: itemsofdrawer[index].icon);
            },
          ),
        ),
        SizedBox(
          height: 100,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: ElevatedButton(
            onPressed: () async {
              bool datas =
                  await Apiserverce(Dio()).logout(token: widget.user.token!);

              print(datas.toString());
              if (datas == true) {
                await Sharedperfernace.setString('email', '');
                await Sharedperfernace.setString('password', '');
                await Sharedperfernace.setbool('isremid', false);
                GoRouter.of(context).pushReplacement(Gorouter.klogin);
              } else {
                print('dont logout ');
              }
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).width *
                    0.2, // 20% of available width
                vertical: 14,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              'Logout',
              style: Textstyles.font16boldwithe.copyWith(color: kthirdcolorkey),
            ),
          ),
        )
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 35),
        //   child: ElevatedButton(
        //     onPressed: () async {
        //       bool datas =
        //           await Apiserverce(Dio()).logout(token: widget.user.token!);

        //       print(datas.toString());
        //       if (datas == true) {
        //         await Sharedperfernace.setString('email', '');
        //         await Sharedperfernace.setString('password', '');
        //         await Sharedperfernace.setbool('isremid', false);
        //         GoRouter.of(context).pushReplacement(Gorouter.klogin);
        //       } else {
        //         print('dont logout ');
        //       }
        //     },
        //     style: ElevatedButton.styleFrom(
        //       padding: EdgeInsets.symmetric(horizontal: 80, vertical: 14),
        //       shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(12),
        //       ),
        //     ),
        //     child: Text(
        //       'Logout',
        //       style: Textstyles.font16boldwithe.copyWith(color: kthirdcolorkey),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
