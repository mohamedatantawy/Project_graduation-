import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:project_greduation/core/gorouter.dart';
import 'package:project_greduation/core/styles/textstyles.dart';
import 'package:project_greduation/features/Auth/data/models/user/user.dart';
import 'package:project_greduation/features/home/data/models/material/materialmodel.dart';
import 'package:project_greduation/features/home/presentation/manger/cubit/materialshow_cubit.dart';
import 'package:project_greduation/features/notification/presentation/mange/cubit/notificationcubit_cubit.dart';

class customdraweritems extends StatelessWidget {
  const customdraweritems({
    super.key,
    required this.title,
    required this.icon,
    required this.index,
    required this.user,
    //   required this.materialmodels,
  });
  final String title;
  final IconData icon;
  final int index;
  final User user;
//  final List<Materialmodels> materialmodels;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MaterialshowCubit, MaterialshowState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is MaterialshowSucess) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListTile(
                    leading: Icon(
                      icon,
                      color: Colors.white,
                    ),
                    title: Center(
                      child: Text(
                        title,
                        style: Textstyles.font16boldwithe,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: ()async {
                        if(index==2)
                        {
                         
                        }
                        if (index == 0) {
                          GoRouter.of(context).pop();
                        } else if (index == 1) {
                          GoRouter.of(context)
                              .push(Gorouter.profile, extra: user);
                        } else if (index == 2) {
                          GoRouter.of(context).push(Gorouter.notification,extra: user.token);
                        } else if (index == 3) {
                          GoRouter.of(context)
                              .push(Gorouter.attendance, extra: state.data);
                        } else if (index == 4) {
                          GoRouter.of(context)
                              .push(Gorouter.setting, extra: user.token);
                        }
                      },
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                    )),
              ),
              Divider(
                color: Colors.white,
                thickness: 0.9,
                indent: 45,
                endIndent: 60,
              ),
            ],
          );
        } else if (state is Materialshowloading) {
          return ModalProgressHUD(inAsyncCall: true, child: Container());
        } else {
          return Container();
        }
      },
    );
  }
}
