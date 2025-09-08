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
          List numberSection =
              materialmodelslist.schedule!.sections![index].section_numbers!;
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
                  //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Section  ',
                      style: Textstyles.font18boldblue,
                    ),
                     materialmodelslist.schedule!.sections!.length > 1
                        ? Text(
                            "${index + 1}",
                            style: Textstyles.font18boldblue,
                          )
                        : Text(
                            "",
                            style: Textstyles.font18boldblue,
                          ),
                    Spacer(),
                    Text(
                      materialmodelslist.schedule!.sections![index]
                                  .isSectionAttendanceOpen ==
                              1
                          ? 'opened'
                          : "closed",
                      style: materialmodelslist.schedule!.sections![index]
                                  .isSectionAttendanceOpen ==
                              1
                          ? Textstyles.font14medinmblue
                              .copyWith(color: Colors.green)
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
                      materialmodelslist
                          .schedule!.sections![index].sectionStartHour
                          .toString()
                          .substring(0, 5),
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
