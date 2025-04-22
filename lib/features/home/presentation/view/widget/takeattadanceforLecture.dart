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
      child: Text(
        'Lecture',
        style: Textstyles.font18boldblue,
      ),
    );

    //   return BlocConsumer<IsAvailablesCubit, IsAvailablesState>(
    //     listener: (context, state) {
    //       if (state is IsAvailablesSucuess) {
    //         GoRouter.of(context).push(
    //           Gorouter.ktake,
    //           extra: Detailsmodels(
    //               materialmodels: widget.materialmodelslist,
    //               user: widget.widget.user),
    //         );
    //         Navigator.of(context).pop();
    //       } else {
    //         ScaffoldMessenger.of(context).showSnackBar(
    //             SnackBar(content: Text('This Lecture not avalible now')));
    //       }
    //     },
    //     builder: (context, state) {
    //       if (state is IsAvailablesSucuess) {
    //         return TextButton(
    //             onPressed: () {
    //               var response = context
    //                   .read<IsAvailablesCubit>()
    //                   .getavialablemothed(
    //                       id: widget.materialmodelslist.academicScheduleId!,
    //                       token: widget.widget.user.token!,
    //                       session: 'lecture');
    //               // var datas = await Apiserverce(Dio()).Is_available(
    //               //     id: widget.materialmodelslist.academicScheduleId!,
    //               //     token: widget.widget.user.token!,
    //               //     session: 'lecture');
    //             },
    //             child: Text(
    //               'Lecture',
    //               style: Textstyles.font18boldblue,
    //             ));
    //       } else if (state is IsAvailablesloading) {
    //         return ModalProgressHUD(inAsyncCall: true, child: Container());
    //       } else  {
    //         return TextButton(
    //             onPressed: () {
    //               var response = context
    //                   .read<IsAvailablesCubit>()
    //                   .getavialablemothed(
    //                       id: widget.materialmodelslist.academicScheduleId!,
    //                       token: widget.widget.user.token!,
    //                       session: 'lecture');
    //               // var datas = await Apiserverce(Dio()).Is_available(
    //               //     id: widget.materialmodelslist.academicScheduleId!,
    //               //     token: widget.widget.user.token!,
    //               //     session: 'lecture');
    //             },
    //             child: Text(
    //               'Lecture',
    //               style: Textstyles.font18boldblue,
    //             ));
    //       }
    //     },
    //   );
    // }
  }
}
