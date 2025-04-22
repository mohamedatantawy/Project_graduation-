import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:project_greduation/features/attendance/data/data_source/attendance_Remote_source.dart';
import 'package:project_greduation/features/attendance/domain/Use_Case/attendance_Use_Case.dart';
import 'package:project_greduation/features/home/data/data_sources/home_Remote_data_source.dart';
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
    () => ProfileUseCase(
        profileremoteSource: getIt<ProfileRemoteSourceImpl>()),
  );
}
//        create: (context) => TakelocationCubit(TakeattandanceUseCase (takeattandanceDataSoure: TakeattendanceDataSourceimple(api: ))),
//
