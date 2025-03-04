import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:project_greduation/features/onboreding/presentation/View/widget/choosepage.dart';
import 'package:project_greduation/features/onboreding/presentation/View/widget/dot_indicator.dart';
import 'package:project_greduation/features/onboreding/presentation/View/widget/featureoverView.dart';
import 'package:project_greduation/features/onboreding/models/pageViewmodels.dart';

class overViewbody extends StatefulWidget {
  const overViewbody({
    super.key,
    required this.data,
  });

  final List<Pageviewmodels> data;

  @override
  State<overViewbody> createState() => _overViewbodyState();
}

class _overViewbodyState extends State<overViewbody> {
  PageController pageController = PageController();
  int currentindex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController.addListener(
      () {
        currentindex = pageController.page!.toInt();
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(
          child: SizedBox(
            height: 50,
          ),
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.6,
          child: ExpandablePageView(
              controller: pageController,
              children: List.generate(
                4,
                (index) {
                  if (index != 3) {
                    return Featureoverview(data: widget.data[index]);
                  } else {
                    return const Choosepage();
                  }
                },
              )),
        ),
        const Expanded(
          child: SizedBox(
            height: 50,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            currentindex != 3
                ? dotiondcator(
                    num: currentindex,
                  )
                : const SizedBox(),
          ],
        ),
        const Expanded(
          child: SizedBox(
            height: 50,
          ),
        ),
      ],
    );
  }
}

class dotiondcator extends StatelessWidget {
  const dotiondcator({super.key, required this.num});
  final int num;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        3,
        (index) => Padding(
          padding: const EdgeInsets.only(right: 8),
          child: customDotIndicator(
            isactive: index == num,
          ),
        ),
      ),
    );
  }
}
