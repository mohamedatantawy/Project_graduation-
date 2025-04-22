import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:project_greduation/core/gorouter.dart';
import 'package:project_greduation/core/utils/server_loaction.dart';
import 'package:project_greduation/features/Auth/presentation/manager/cubit/auths_cubit.dart';
import 'package:project_greduation/features/attendance/data/data_source/attendance_Remote_source.dart';
import 'package:project_greduation/features/attendance/domain/Use_Case/attendance_Use_Case.dart';
import 'package:project_greduation/features/attendance/domain/repos/attendanceRepos.dart';
import 'package:project_greduation/features/attendance/presentation/manage/cubit/attandance_report_cubit.dart';
import 'package:project_greduation/features/home/data/data_sources/home_Remote_data_source.dart';
import 'package:project_greduation/features/home/presentation/manger/cubit/cubit/is_availables_cubit.dart';
import 'package:project_greduation/features/notification/domain/Use_case/notification_Use_case.dart';
import 'package:project_greduation/features/notification/presentation/mange/cubit/notificationcubit_cubit.dart';
import 'package:project_greduation/features/profile/domain/Use_case/Profile_Use_case.dart';
import 'package:project_greduation/features/profile/presentation/mange/cubit/changepassword_cubit.dart';
import 'package:project_greduation/features/takeattendance/data/data_source/takeattendance_data_source.dart';
import 'package:project_greduation/features/takeattendance/domain/Use_case/takeattandance_Use_case.dart';
import 'package:project_greduation/features/takeattendance/presentation/manger/cubit/takelocation_cubit.dart';
import 'package:project_greduation/helper/api.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //  await Sharedperfernace.setString('token', 'token');

  setupO();
  runApp(const PorjectGreduation());
}

class PorjectGreduation extends StatelessWidget {
  const PorjectGreduation({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthsCubit(),
        ),
        BlocProvider(
          create: (context) => AttandanceReportCubit(
              attendanceUseCase: getIt.get<AttendanceUseCase>()),
        ),
 BlocProvider(
          create: (context) => ChangepasswordCubit(
              getIt.get<ProfileUseCase>()),
        ),

        BlocProvider(
          create: (context) => NotificationcubitCubit(
              getIt.get<NotificationUseCase>()),
        ),
        BlocProvider(
          create: (context) =>
              IsAvailablesCubit(getIt.get<HomeRemoteDataSourceImple>()),
        ),
        BlocProvider<TakelocationCubit>(
          create: (context) =>
              TakelocationCubit(getIt.get<TakeattandanceUseCase>()),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: Gorouter.router,
        theme: ThemeData(fontFamily: 'Inter'),
      ),
    );
  }
}
