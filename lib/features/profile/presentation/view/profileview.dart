import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:project_greduation/constants.dart';
import 'package:project_greduation/core/gorouter.dart';
import 'package:project_greduation/features/Auth/data/models/user/user.dart';
import 'package:project_greduation/features/profile/presentation/mange/cubit/changepassword_cubit.dart';
import 'package:project_greduation/features/profile/presentation/view/widget/profileviewbody.dart';

class Profileview extends StatelessWidget {
  const Profileview({super.key, required this.user});
  final Usermodels user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kbackgroundcolor,
        appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () async {
                    GoRouter.of(context)
                        .push(Gorouter.kchangepassword, extra: user.token);
                  },
                  icon: Icon(
                    Icons.password,
                    size: 38,
                    color: kprimarykey,
                  ))
            ],
            toolbarHeight: 122,
            backgroundColor: kbackgroundcolor,
            leading: IconButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Color(0xff06224D),
              ),
            )),
        body: Profileviewbody(
          user: user,
        ));
  }
}
