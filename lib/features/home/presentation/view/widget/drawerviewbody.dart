import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project_greduation/constants.dart';
import 'package:project_greduation/core/gorouter.dart';
import 'package:project_greduation/core/styles/textstyles.dart';
import 'package:project_greduation/core/utils/api/Apiserverce.dart';
import 'package:project_greduation/features/home/data/models/material/materialmodel.dart';
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
    return Column(
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
            leading: Container(
              //  margin: EdgeInsets.only(left: 4),
              width: 55,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    colors: [Colors.amber, Colors.red]),
                borderRadius: BorderRadius.circular(16),
                color: Colors.amber,
              ),
            )),
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
        ElevatedButton(
          onPressed: () async {
            bool datas =
                await Apiserverce(Dio()).logout(token: widget.user.token!);
            print(datas.toString());
            if (datas == true) {
              GoRouter.of(context).pushReplacement(Gorouter.klogin);
            } else {
              print('dont logout ');
            }
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 80, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            'Logout',
            style: Textstyles.font16boldwithe.copyWith(color: kthirdcolorkey),
          ),
        ),
      ],
    );
  }
}
