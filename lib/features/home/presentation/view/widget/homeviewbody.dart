import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:project_greduation/constants.dart';
import 'package:project_greduation/core/gorouter.dart';
import 'package:project_greduation/features/Auth/data/models/user/user.dart';
import 'package:project_greduation/features/home/data/models/material/materialmodel.dart';
import 'package:project_greduation/features/home/presentation/manger/cubit/materialshow_cubit.dart';
import 'package:project_greduation/features/home/presentation/view/widget/listviewhomeviewbody.dart';
import 'package:project_greduation/features/home/presentation/view/widget/trailIcontotakeAttandance.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class Homeviewbody extends StatefulWidget {
  const Homeviewbody({super.key, required this.user});
  final Usermodels user;

  @override
  State<Homeviewbody> createState() => _HomeviewbodyState();
}

class _HomeviewbodyState extends State<Homeviewbody> {
  bool isloading = false;
  int? subjectnumber;
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    try {
      // Trigger BLoC to fetch fresh data
      context.read<MaterialshowCubit>().getsubjectcu(token: widget.user.token!);

      // Wait for the state to update (you might need to adjust this)
      await Future.delayed(const Duration(milliseconds: 500));

      _refreshController.refreshCompleted();
    } catch (e) {
      _refreshController.refreshFailed();
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Refresh failed: ${e.toString()}')));
    }
  }

  void _onLoading() async {
    // Implement pagination if needed
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MaterialshowCubit, MaterialshowState>(
      listener: (context, state) {
        if (state is Materialshowloading) {
          //   isloading = true;
        } else if (state is MaterialshowSucess) {
          ///  isloading = false;
          subjectnumber = state.data.length;
          //  detailsmodels=Detailsmodels(materialmodels: state.data, user: user)

          // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          //     content: Text(state.data.last.schedule!.course.toString())));
        } else if (state is Materialshowfailure) {
          //  isloading = false;
          // ScaffoldMessenger.of(context)
          //     .showSnackBar(SnackBar(content: Text('bad bar ')));
        }
      },
      builder: (context, state) {
        if (state is Materialshowloading) {
          return ModalProgressHUD(inAsyncCall: true, child: Container());
        } else if (state is MaterialshowSucess) {
          subjectnumber = state.data.length;

          return Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(70),
                topRight: Radius.circular(70),
              ),
            ),
            child: SmartRefresher(
              controller: _refreshController,
              onLoading: _onLoading,
              onRefresh: _onRefresh,
              enablePullDown: true,
              child: ListViewhomeViewbody(
                  listd: state.data,
                  subjectnumber: subjectnumber,
                  widget: widget),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
