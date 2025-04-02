
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_greduation/constants.dart';
import 'package:project_greduation/core/assets.dart';
import 'package:project_greduation/core/styles/textstyles.dart';
import 'package:project_greduation/features/home/data/models/material/materialmodel.dart';
import 'package:project_greduation/features/home/presentation/view/widget/homeviewbody.dart';
import 'package:project_greduation/features/home/presentation/view/widget/takeattadanceforLecture.dart';
import 'package:project_greduation/features/home/presentation/view/widget/takeattandanceforsection.dart';

class trailIcontoTakeAttandance extends StatelessWidget {
  const trailIcontoTakeAttandance({
    super.key,
    required this.widget, required this.materialmodelslist,
  });

  final Homeviewbody widget;
  final Materialmodels materialmodelslist;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                'Choose Your Attandance',
                style: Textstyles.font18boldblue,
              ),
              content: SizedBox(
                height: 100,
                child: Column(
                  children: [
                    takeatandanceforLecture(widget: widget, materialmodelslist: materialmodelslist),
                    takeattandanceforSection(widget: widget, materialmodelslist: materialmodelslist),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  child: Text(
                    'Cancel',
                    style: Textstyles.font18boldblue,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                ),
              ],
            );
            
          },
        );
      },
      child: SvgPicture.asset(
        Assets.assetsImageVector,
        height: 40,
        width: 40,
        color: kbluesetting,
      ),
    );
  }
}
