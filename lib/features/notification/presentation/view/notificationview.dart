import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:project_greduation/core/styles/textstyles.dart';
import 'package:project_greduation/features/notification/presentation/mange/cubit/notificationcubit_cubit.dart';
import 'package:project_greduation/features/notification/presentation/view/widget/notificationviewbody.dart';

class Notificationview extends StatefulWidget {
  const Notificationview({super.key, required this.token});
  final String token;
  @override
  State<Notificationview> createState() => _NotificationviewState();
}

class _NotificationviewState extends State<Notificationview> {
  @override
  void initState() {
    context.read<NotificationcubitCubit>().getworning(
          token: widget.token,
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xff06224D),
          ),
        ),
        title: Text(
          'Notification',
          style: Textstyles.font26medinmblue,
        ),
      ),
      body: BlocBuilder<NotificationcubitCubit, NotificationcubitState>(
        builder: (context, state) {
          if (state is NotificationcubitSucess) {
            return Notificationviewbody(
              keylist: state.keylist,
              data: state.worning,
            );
          } else if (state is Notificationcubitfailure) {
            return Text(state.emassage);
          } else {
            return ModalProgressHUD(
              inAsyncCall: true,
              child: Container(),
            );
          }
        },
      ),
    );
  }
}
