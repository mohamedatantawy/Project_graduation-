import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_greduation/core/styles/textstyles.dart';
import 'package:project_greduation/features/home/data/models/material/materialmodel.dart';
import 'package:project_greduation/features/home/presentation/manger/cubit/cubit/is_availables_cubit.dart';
import 'package:project_greduation/features/home/presentation/view/widget/homeviewbody.dart';

class takeatandanceforLecture extends StatefulWidget {
  const takeatandanceforLecture({
    super.key,
    required this.widget,
    required this.materialmodelslist,
  });

  final Homeviewbody widget;
  final Materialmodels materialmodelslist;

  @override
  State<takeatandanceforLecture> createState() =>
      _takeatandanceforLectureState();
}

class _takeatandanceforLectureState extends State<takeatandanceforLecture> {
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        var response = await context
            .read<IsAvailablesCubit>()
            .getavialablemothed(
                id: widget.materialmodelslist.academicScheduleId!,
                token: widget.widget.user.token!,
                session: 'lecture');
      },
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Lecture',
                style: Textstyles.font18boldblue,
              ),
              Text(
                widget.materialmodelslist.schedule!.isLectureAttendanceOpen == 1
                    ? 'opened'
                    : 'closed',
                style: widget.materialmodelslist.schedule!
                            .isLectureAttendanceOpen ==
                        1
                    ? Textstyles.font14medinmblue.copyWith(color:Colors.green)
                    : Textstyles.font14medinmblue.copyWith(color: Colors.red),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                " ${widget.materialmodelslist.schedule!.lectureDay}",
                style: Textstyles.font14medinmblue,
              ),
              Text(
                " ${widget.materialmodelslist.schedule!.lectureStartHour.toString().substring(0, 5)}",
                style: Textstyles.font14medinmblue,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
