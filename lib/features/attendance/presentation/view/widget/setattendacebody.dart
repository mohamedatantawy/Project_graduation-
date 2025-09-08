import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:project_greduation/constants.dart';
import 'package:project_greduation/core/gorouter.dart';
import 'package:project_greduation/core/styles/textstyles.dart';
import 'package:project_greduation/core/utils/sharedperfernace.dart';
import 'package:project_greduation/features/attendance/presentation/manage/cubit/attandance_report_cubit.dart';
import 'package:project_greduation/features/home/data/models/material/materialmodel.dart';

class Setattendacebody extends StatelessWidget {
  const Setattendacebody({super.key, required this.materialmodels});
  final Materialmodels materialmodels;
  final List<String> items = const [
    'Attendance for Lecture',
    'Attendance for Section',
    //  'Last 2 Week',
    // 'Select A specific Day',
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          SizedBox(
            height: 60,
          ),
          Row(
            children: [
              Icon(Icons.calendar_month),
              Text(
                'Choose Date :',
                style: Textstyles.font18boldblue,
              )
            ],
          ),
          SizedBox(
            height: 50,
          ),
          attandanceItemsCardBloc(items: items, materialmodels: materialmodels),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

class attandanceItemsCardBloc extends StatefulWidget {
  const attandanceItemsCardBloc({
    super.key,
    required this.items,
    required this.materialmodels,
  });

  final List<String> items;
  final Materialmodels materialmodels;

  @override
  State<attandanceItemsCardBloc> createState() =>
      _attandanceItemsCardBlocState();
}

class _attandanceItemsCardBlocState extends State<attandanceItemsCardBloc> {
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AttandanceReportCubit, AttandanceReportState>(
      listener: (context, state) {
        if (state is AttandanceReportSucess) {
          isloading = false;
          GoRouter.of(context).push(Gorouter.kattendancemothed,
              extra: state.reportattandancemodel);
        } else if (state is AttandanceReportloading) {
          isloading = true;
        }
      },
      builder: (context, state) {
        return Container(
            height: 350,
            margin: EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: kcolorwhite, borderRadius: BorderRadius.circular(12)),
            child: Center(
              child: ModalProgressHUD(
                  inAsyncCall: isloading,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 50),
                    decoration: BoxDecoration(
                        color: kcolorwhite,
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                        children: List.generate(
                      widget.items.length,
                      (index) => Card(
                        color: Color(0xffDDDEE5),
                        margin: EdgeInsets.all(13),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Text(widget.items[index]),
                            ),
                            IconButton(
                                onPressed: () async {
                                  if (index == 0) {
                                    String token =
                                        await Sharedperfernace.getString(
                                                'token') ??
                                            '';
                                    print(
                                        "${token + widget.materialmodels.academicScheduleId!.toString()}");
                                    if (token != '') {
                                      await context
                                          .read<AttandanceReportCubit>()
                                          .getreport(
                                              session: 'lecture',
                                              id: widget.materialmodels
                                                  .academicScheduleId!,
                                              token: token);
                                      // var data = await Apiserverce(Dio()).getReport(
                                      //     session: 'lecture',
                                      //     id: materialmodels.academicScheduleId!,
                                      //     token: token);
                                      // GoRouter.of(context).push(
                                      //     Gorouter.kattendancemothed,
                                      //     extra: data);
                                    } else {
                                      print(
                                          'Error in token for go calendaer00');
                                    }
                                  } else if (index == 1) {
                                    String token =
                                        await Sharedperfernace.getString(
                                                'token') ??
                                            '';
                                    print(
                                        "${token + widget.materialmodels.id!.toString()}");
                                    if (token != '') {
                                      await context
                                          .read<AttandanceReportCubit>()
                                          .getreport(
                                              session: 'section',
                                              id: widget.materialmodels
                                                  .academicScheduleId!,
                                              token: token);
                                    } else {
                                      print(
                                          'Error in token for go calendaer00');
                                    }
                                  }
                                },
                                icon: Icon(Icons.arrow_forward_ios_outlined))
                          ],
                        ),
                      ),
                    )),
                  )),
            ));
      },
    );
  }
}
