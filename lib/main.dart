import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_greduation/core/gorouter.dart';
import 'package:project_greduation/core/utils/server_loaction.dart';
import 'package:project_greduation/feature_Doc/apis/absentStudents.dart';
import 'package:project_greduation/feature_Doc/apis/attendance_api.dart';
import 'package:project_greduation/feature_Doc/apis/attendancedrawer.dart';
import 'package:project_greduation/feature_Doc/apis/conterpresent.dart';
import 'package:project_greduation/feature_Doc/apis/getStudentAttendance.dart';
import 'package:project_greduation/feature_Doc/apis/getadsenttoday.dart';
import 'package:project_greduation/feature_Doc/apis/presentStudents.dart';
import 'package:project_greduation/feature_Doc/logic/absentcubit/absent_cubit.dart';
import 'package:project_greduation/feature_Doc/logic/attandancecubitdreaer/attandancedrewer_cubit.dart';
import 'package:project_greduation/feature_Doc/logic/attendance/attendance_cubit.dart';
import 'package:project_greduation/feature_Doc/logic/counter/counter_cubit.dart';
import 'package:project_greduation/feature_Doc/logic/getAbsent/get_absent_cubit.dart';
import 'package:project_greduation/feature_Doc/logic/presentStudentCubit/present_student_cubit.dart';
import 'package:project_greduation/feature_Doc/logic/yesattandancecubit/yesattandance_cubit.dart';
import 'package:project_greduation/features/Auth/domain/Use_case/Auth_Use_Case_SendNewPassword.dart';
import 'package:project_greduation/features/Auth/domain/Use_case/Auths_Use_Case_SendEmail.dart';
import 'package:project_greduation/features/Auth/domain/Use_case/Auths_Use_Case_SendOTP.dart';
import 'package:project_greduation/features/Auth/domain/Use_case/Auths_Use_Case_login.dart';
import 'package:project_greduation/features/Auth/presentation/manager/Auth_SendEmail/auth_send_email_cubit.dart';
import 'package:project_greduation/features/Auth/presentation/manager/Auth_login/auth_login_cubit.dart';
import 'package:project_greduation/features/Auth/presentation/manager/auth_SendNewPassword/auth_send_new_password_cubit.dart';
import 'package:project_greduation/features/Auth/presentation/manager/auth_SendOTP/auth_send_otp_cubit.dart';
import 'package:project_greduation/features/attendance/domain/Use_Case/attendance_Use_Case.dart';
import 'package:project_greduation/features/attendance/presentation/manage/cubit/attandance_report_cubit.dart';
import 'package:project_greduation/features/home/data/ReposImple/RepoImpleHome.dart';
import 'package:project_greduation/features/home/data/data_sources/home_Remote_data_source.dart';
import 'package:project_greduation/features/home/presentation/manger/cubit/cubit/is_availables_cubit.dart';
import 'package:project_greduation/features/notification/domain/Use_case/notification_Use_case.dart';
import 'package:project_greduation/features/notification/presentation/mange/cubit/notificationcubit_cubit.dart';
import 'package:project_greduation/features/profile/domain/Use_case/Profile_Use_case.dart';
import 'package:project_greduation/features/profile/presentation/mange/cubit/changepassword_cubit.dart';
import 'package:project_greduation/features/takeattendance/domain/Use_case/takeattandance_Use_case.dart';
import 'package:project_greduation/features/takeattendance/presentation/manger/cubit/takelocation_cubit.dart';

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
        //AttandancedrewerCubit//GetAbsentCubit
        BlocProvider(
          create: (context) =>
              AuthLoginCubit(getIt.get<AuthsUseCaseLogin>())..alreadylogin(),
        ),
        BlocProvider(
          create: (context) => CounterCubit(Conterpresent(dio: Dio())),
        ),
         BlocProvider(
          create: (context) => GetAbsentCubit(Getadsenttoday (dio: Dio())),
        ),
        BlocProvider(
          create: (context) => PresentStudentCubit(Presentstudents(dio: Dio())),
        ),
        BlocProvider(
          create: (context) =>
              YesattandanceCubit(Getstudentattendance(dio: Dio())),
        ),
        BlocProvider(
          create: (context) =>
              AttandancedrewerCubit(Attendancedrawer(dio: Dio())),
        ),
        BlocProvider(
          create: (context) =>
              AuthSendEmailCubit(getIt.get<AuthsUseCaseSendemail>()),
        ),
        BlocProvider(
          create: (context) =>
              AuthSendOtpCubit(getIt.get<AuthsUseCaseSendotp>()),
        ),
        BlocProvider(
          create: (context) =>
              AuthSendNewPasswordCubit(getIt.get<AuthUseCaseSendnewpassword>()),
        ),
        BlocProvider(
          create: (context) => AttandanceReportCubit(
              attendanceUseCase: getIt.get<AttendanceUseCase>()),
        ),
        BlocProvider(
          create: (context) => AttendanceCubit(AttendanceApi(dio: Dio())),
        ),
        BlocProvider(
          create: (context) => ChangepasswordCubit(getIt.get<ProfileUseCase>()),
        ),
        BlocProvider(
          create: (context) =>
              NotificationcubitCubit(getIt.get<NotificationUseCase>()),
        ),
        BlocProvider(
          create: (context) => IsAvailablesCubit(getIt.get<Repoimplehome>()),
        ),
        BlocProvider<TakelocationCubit>(
          create: (context) =>
              TakelocationCubit(getIt.get<TakeattandanceUseCase>()),
        ),
        BlocProvider(
          create: (context) => AbsentCubit(Absentstudents(dio: Dio())),
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
