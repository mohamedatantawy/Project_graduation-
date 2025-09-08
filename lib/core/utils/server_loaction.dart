import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:project_greduation/features/Auth/data/AuthRemote_source/auth_SendEmail_Remote_source_imple.dart';
import 'package:project_greduation/features/Auth/data/AuthRemote_source/auth_SendOTP_Remote_Imple.dart';
import 'package:project_greduation/features/Auth/data/AuthRemote_source/auth_login_Remote_source_imple.dart';
import 'package:project_greduation/features/Auth/data/AuthRemote_source/auth_sendNewPassword_imple.dart';
import 'package:project_greduation/features/Auth/domain/Use_case/Auth_Use_Case_SendNewPassword.dart';
import 'package:project_greduation/features/Auth/domain/Use_case/Auths_Use_Case_SendEmail.dart';
import 'package:project_greduation/features/Auth/domain/Use_case/Auths_Use_Case_SendOTP.dart';
import 'package:project_greduation/features/Auth/domain/Use_case/Auths_Use_Case_login.dart';
import 'package:project_greduation/features/attendance/data/data_source/attendance_Remote_source.dart';
import 'package:project_greduation/features/attendance/domain/Use_Case/attendance_Use_Case.dart';
import 'package:project_greduation/features/home/data/ReposImple/RepoImpleHome.dart';
import 'package:project_greduation/features/home/data/data_sources/home_Remote_data_source.dart';
import 'package:project_greduation/features/home/domain/Repos/homeRepos.dart';
import 'package:project_greduation/features/notification/data/notification_Remote_source/notification_Remote_source_imple.dart';
import 'package:project_greduation/features/notification/domain/Use_case/notification_Use_case.dart';
import 'package:project_greduation/features/profile/data/Profile_Remote_source/profile_Remote_source_Impl.dart';
import 'package:project_greduation/features/profile/domain/Use_case/Profile_Use_case.dart';
import 'package:project_greduation/features/takeattendance/data/data_source/takeattendance_data_source.dart';
import 'package:project_greduation/features/takeattendance/domain/Repos/takeattandance_Remote.dart';
import 'package:project_greduation/features/takeattendance/domain/Use_case/takeattandance_Use_case.dart';
import 'package:project_greduation/helper/api.dart';

final getIt = GetIt.instance;
void setupO() {
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<Api>(() => Api(getIt<Dio>()));
  getIt.registerLazySingleton<HomeRemoteDataSourceImple>(
    () => HomeRemoteDataSourceImple(api: getIt<Api>()),
  );
  getIt.registerLazySingleton<Repoimplehome>(
    () => Repoimplehome( getIt<HomeRemoteDataSourceImple>()),
  );
  getIt.registerLazySingleton<AttendanceRemoteSourceImple>(
      () => AttendanceRemoteSourceImple(api: Api(getIt<Dio>())));
  getIt.registerLazySingleton<AttendanceUseCase>(
    () => AttendanceUseCase(
        attendance_data_source: getIt<AttendanceRemoteSourceImple>()),
  );
  getIt.registerLazySingleton<NotificationUseCase>(
    () => NotificationUseCase(
        notificationRemoteSource: getIt<NotificationRemoteSourceImple>()),
  );
  getIt.registerLazySingleton<NotificationRemoteSourceImple>(
    () => NotificationRemoteSourceImple(api: getIt<Api>()),
  );
  getIt.registerLazySingleton<TakeattendanceDataSourceimple>(
    () => TakeattendanceDataSourceimple(api: getIt<Api>()),
  );
  getIt.registerLazySingleton<TakeattandanceUseCase>(
    () => TakeattandanceUseCase(
        takeattandanceDataSoure: getIt<TakeattendanceDataSourceimple>()),
  );
  getIt.registerLazySingleton<ProfileRemoteSourceImpl>(
    () => ProfileRemoteSourceImpl(api: getIt<Api>()),
  );
  getIt.registerLazySingleton<ProfileUseCase>(
    () => ProfileUseCase(profileremoteSource: getIt<ProfileRemoteSourceImpl>()),
  );
  getIt.registerLazySingleton<AuthLoginRemoteSourceImple>(
    () => AuthLoginRemoteSourceImple(api: getIt<Api>()),
  );
  getIt.registerLazySingleton<AuthsUseCaseLogin>(
    () =>
        AuthsUseCaseLogin(authsreposlogin: getIt<AuthLoginRemoteSourceImple>()),
  );
  getIt.registerLazySingleton<AuthSendemailRemoteSourceImple>(
    () => AuthSendemailRemoteSourceImple(api: getIt<Api>()),
  );
  getIt.registerLazySingleton<AuthsUseCaseSendemail>(
    () => AuthsUseCaseSendemail(
        authsreposSendemail: getIt<AuthSendemailRemoteSourceImple>()),
  );

  getIt.registerLazySingleton<AuthSendotpRemoteImple>(
    () => AuthSendotpRemoteImple(api: getIt<Api>()),
  );
  getIt.registerLazySingleton<AuthsUseCaseSendotp>(
    () =>
        AuthsUseCaseSendotp(authreposSendotp: getIt<AuthSendotpRemoteImple>()),
  );
  getIt.registerLazySingleton<AuthSendnewpasswordImple>(
    () => AuthSendnewpasswordImple(api: getIt<Api>()),
  );
  getIt.registerLazySingleton<AuthUseCaseSendnewpassword>(
    () => AuthUseCaseSendnewpassword(
        authreposSendnewpassword: getIt<AuthSendnewpasswordImple>()),
  );
}
//        create: (context) => TakelocationCubit(TakeattandanceUseCase (takeattandanceDataSoure: TakeattendanceDataSourceimple(api: ))),
//
