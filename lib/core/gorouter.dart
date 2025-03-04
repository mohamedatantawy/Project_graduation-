import 'package:go_router/go_router.dart';
import 'package:project_greduation/features/Auth/presentation/views/forgetResetcode.dart';
import 'package:project_greduation/features/Auth/presentation/views/forgetpasswordView.dart';
import 'package:project_greduation/features/Auth/presentation/views/login.dart';
import 'package:project_greduation/features/Auth/presentation/views/resetpassword.dart';
import 'package:project_greduation/features/home/presentation/view/HomeView.dart';
import 'package:project_greduation/features/onboreding/presentation/View/pageViews.dart';
import 'package:project_greduation/features/splash/presentation/view/splashView.dart';

abstract class Gorouter {
  static const HomeView = '/homeView';
  static const pageViews = '/pageView';
  static const kresetpassword = '/resetpassword';
  static const forgetReset = '/forgetReset';
  static const klogin = '/loginview';
  static const kforgetpassword = '/forgetpassword';
  static final router = GoRouter(routes: [
    GoRoute(
      path: 'ddd',
      builder: (context, state) => const Splashview(),
    ),
    GoRoute(
      path: pageViews,
      builder: (context, state) => const Pageviews(),
    ),
    GoRoute(
      path: '/',
      builder: (context, state) => const Homeview(),
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
      builder: (context, state) => const Forgetresetcode(),
    ),
    GoRoute(
      path: kresetpassword,
      builder: (context, state) => const Resetpassword(),
    ),
  ]);
}
