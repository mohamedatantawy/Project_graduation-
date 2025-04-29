import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:project_greduation/constants.dart';
import 'package:project_greduation/core/assets.dart';
import 'package:project_greduation/core/gorouter.dart';
import 'package:project_greduation/core/styles/textstyles.dart';
import 'package:project_greduation/features/home/data/models/material/materialmodel.dart';
import 'package:project_greduation/features/home/presentation/manger/cubit/cubit/is_availables_cubit.dart';
import 'package:project_greduation/features/home/presentation/view/models/detailsmodels.dart';
import 'package:project_greduation/features/home/presentation/view/widget/homeviewbody.dart';
import 'package:project_greduation/features/home/presentation/view/widget/takeattadanceforLecture.dart';
import 'package:project_greduation/features/home/presentation/view/widget/takeattandanceforsection.dart';

class trailIcontoTakeAttandance extends StatefulWidget {
  const trailIcontoTakeAttandance({
    super.key,
    required this.widget,
    required this.materialmodelslist,
  });

  final Homeviewbody widget;
  final Materialmodels materialmodelslist;

  @override
  State<trailIcontoTakeAttandance> createState() =>
      _trailIcontoTakeAttandanceState();
}

class _trailIcontoTakeAttandanceState extends State<trailIcontoTakeAttandance> {
  bool isloading = false;
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
                height: 120,
                child: BlocConsumer<IsAvailablesCubit, IsAvailablesState>(
                  listener: (context, state) {
                    if (state is IsAvailablesSucuessLecture) {
                      GoRouter.of(context).push(
                        Gorouter.ktake,
                        extra: Detailsmodels(
                            materialmodels: widget.materialmodelslist,
                            user: widget.widget.user),
                      ); if (state.isactive==true) {
                         ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('This Lecture is sucess')));
                       }
                      
                      isloading = false;
                      Navigator.of(context).pop();
                    } else if (state is IsAvailablesSucuessSection) {
                      GoRouter.of(context).push(
                        Gorouter.ktakesection,
                        extra: Detailsmodels(
                            materialmodels: widget.materialmodelslist,
                            user: widget.widget.user),
                      ); if (state.isactive==true) {
                         ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('This section is sucess')));
                       }
                      
                      isloading = false;
                      Navigator.of(context).pop();
                    }else if (state is IsAvailablesloading) {
                      isloading = true;
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('This Lecture is loading')));
                    } else {
                      isloading = false;
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('This Lecture is not allow')));
                    }
                  },
                  builder: (context, state) {
                    return SizedBox(
                      height: 120,
                      child: ModalProgressHUD(
                        inAsyncCall: isloading,
                        child: !isloading
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  takeatandanceforLecture(
                                      widget: widget.widget,
                                      materialmodelslist:
                                          widget.materialmodelslist),
                                  takeattandanceforSection(
                                      widget: widget.widget,
                                      materialmodelslist:
                                          widget.materialmodelslist),
                                ],
                              )
                            : Container(
                                color: Colors.white,
                              ),
                      ),
                    );
                  },
                ),
              ),
              actions: [
                TextButton(
                  child: Text(
                    'Cancel',
                    style: Textstyles.font18boldblue,
                  ),
                  onPressed: () {
                    isloading = false;
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
