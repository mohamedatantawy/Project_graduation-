import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:project_greduation/features/Auth/data/models/loginmodels.dart';
import 'package:project_greduation/features/Auth/data/models/user/user.dart';
import 'package:project_greduation/features/Auth/presentation/manager/cubit/auths_cubit.dart';
import 'package:project_greduation/features/Auth/presentation/views/forgetResetcode.dart';
import 'package:project_greduation/features/Auth/presentation/views/forgetpasswordView.dart';
import 'package:project_greduation/features/Auth/presentation/views/login.dart';
import 'package:project_greduation/features/Auth/presentation/views/resetpassword.dart';
import 'package:project_greduation/features/attendance/data/models/reportattandance/reportattandance.dart';
import 'package:project_greduation/features/attendance/presentation/view/attendancemothed.dart';
import 'package:project_greduation/features/attendance/presentation/view/attendanceview.dart';
import 'package:project_greduation/features/attendance/presentation/view/setattendance.dart';
import 'package:project_greduation/features/attendance/presentation/view/widget/attendancemothedbody.dart';
import 'package:project_greduation/features/home/data/models/material/materialmodel.dart';
import 'package:project_greduation/features/home/presentation/view/HomeView.dart';
import 'package:project_greduation/features/home/presentation/view/models/detailsmodels.dart';
import 'package:project_greduation/features/notification/presentation/view/notificationview.dart';
import 'package:project_greduation/features/onboreding/presentation/View/pageViews.dart';
import 'package:project_greduation/features/profile/presentation/view/changepassword.dart';
import 'package:project_greduation/features/profile/presentation/view/profileview.dart';
import 'package:project_greduation/features/setting/presentation/view/settingview.dart';
import 'package:project_greduation/features/splash/presentation/view/splashView.dart';
import 'package:project_greduation/features/takeSecation/presentation/view/takeSection.dart';
import 'package:project_greduation/features/takeattendance/presentation/view/takeattendance.dart';

abstract class Gorouter {
  static const homeView = '/homeView';
  static const pageViews = '/pageView';
  static const kresetpassword = '/resetpassword';
  static const forgetReset = '/forgetReset';
  static const profile = '/profile';
  static const attendance = '/attendance';
  static const setting = '/setting';
  static const notification = '/notification';
  static const klogin = '/loginview';
  static const ktake = '/take';
  static const kchangepassword = '/kchangepassword';

  static const ktakesection = '/takesection';
  static const kattendancemothed = '/attendancemothed';
  static const sss = '/taksssssse ';
  static const ksetattendance = '/setattendance';
  static const kforgetpassword = '/forgetpassword';
  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Splashview(),
    ),
    GoRoute(
      path: ktake,
      builder: (context, state) {
        var user = GoRouterState.of(context).extra as Detailsmodels;
        return Takeattendance(
          user: user,
        );
      },
    ),
    GoRoute(
      path: kchangepassword,
      builder: (context, state) {
        var token = GoRouterState.of(context).extra as String;
        return Changepassword(token: token,);
      },
    ),
    GoRoute(
      path: ktakesection,
      builder: (context, state) {
        var user = GoRouterState.of(context).extra as Detailsmodels;
        return Takesection(
          user: user,
        );
      },
    ),
    GoRoute(
      path: kattendancemothed,
      builder: (context, state) {
        var data = GoRouterState.of(context).extra as Reportattandancemodel;
        return Attendancemothed(
          reportattandancemodel: data,
        );
      },
    ),
    GoRoute(
      path: ksetattendance,
      builder: (context, state) {
        var data = GoRouterState.of(context).extra as Materialmodels;
        return Setattendance(
          materialmodels: data,
        );
      },
    ),
    GoRoute(
      path: pageViews,
      builder: (context, state) => const Pageviews(),
    ),
    GoRoute(
      path: profile,
      builder: (context, state) {
        var user = GoRouterState.of(context).extra as User;
        return Profileview(
          user: user,
        );
      },
    ),
    GoRoute(
        path: notification,
        builder: (context, state) {
          var token = GoRouterState.of(context).extra as String;
          return Notificationview(
            token: token,
          );
        }),
    GoRoute(
      path: setting,
      builder: (context, state) {
        var token = GoRouterState.of(context).extra as String;
        return Settingview(
          token: token,
        );
      },
    ),
    GoRoute(
      path: attendance,
      builder: (context, state) {
        var data = GoRouterState.of(context).extra as List<Materialmodels>;
        return Attendanceview(
          materialmodels: data,
        );
      },
    ),
    GoRoute(
      path: homeView,
      builder: (context, state) {
        var user = GoRouterState.of(context).extra as User;
        return Homeview(
          user: user,
        );
      },
    ),
    GoRoute(
      path: klogin,
      builder: (context, state) => const Login(),
    ),
    GoRoute(
      path: kforgetpassword,
      builder: (context, state) => const Forgetpasswordview(),
    ),
    GoRoute(
      path: forgetReset,
      builder: (context, state) {
        var email = GoRouterState.of(context).extra as String;
        return Forgetresetcode(
          email: email,
        );
      },
    ),
    GoRoute(
      path: kresetpassword,
      builder: (context, state) {
        var login = GoRouterState.of(context).extra as Loginmodels;
        return Resetpassword(
          email: login.email,
          otp: login.otp,
        );
      },
    ),
  ]);
}
