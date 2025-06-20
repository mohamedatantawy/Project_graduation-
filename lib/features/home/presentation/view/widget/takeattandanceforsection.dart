import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_greduation/core/styles/textstyles.dart';
import 'package:project_greduation/features/home/data/models/material/materialmodel.dart';
import 'package:project_greduation/features/home/presentation/manger/cubit/cubit/is_availables_cubit.dart';
import 'package:project_greduation/features/home/presentation/view/widget/homeviewbody.dart';

class takeattandanceforSection extends StatelessWidget {
  const takeattandanceforSection({
    super.key,
    required this.widget,
    required this.materialmodelslist,
  });

  final Homeviewbody widget;
  final Materialmodels materialmodelslist;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        materialmodelslist.schedule!.sections!.length,
        (index) {
          return TextButton(
            style: ButtonStyle(
                // shape: ,
                // backgroundColor: WidgetStateProperty.all<Color>(Colors.grey),
                ),
            onPressed: () async {
              var response = await context
                  .read<IsAvailablesCubit>()
                  .getavialablemothed(
                      number: index,
                      id: materialmodelslist.schedule!.sections![index].id!,
                      token: widget.user.token!,
                      session: 'section');
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Section ',
                      style: Textstyles.font18boldblue,
                    ),
                    Text(
                      materialmodelslist.schedule!.sections![index]
                                  .isSectionAttendanceOpen ==
                              1
                          ? 'open'
                          : "close",
                      style: materialmodelslist.schedule!.sections![index]
                                  .isSectionAttendanceOpen ==
                              1
                          ? Textstyles.font14medinmblue
                          : Textstyles.font14medinmblue
                              .copyWith(color: Colors.red),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${materialmodelslist.schedule!.sections![index].sectionDay}',
                      style: Textstyles.font14medinmblue,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '${materialmodelslist.schedule!.sections![index].sectionStartHour.toString().substring(0, 5)}',
                      style: Textstyles.font14medinmblue,
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
