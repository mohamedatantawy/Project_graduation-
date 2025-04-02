import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:project_greduation/features/home/data/data_sources/home_Remote_data_source.dart';
import 'package:project_greduation/helper/api.dart';

final getIt = GetIt.instance;
void setupO() {
  getIt.registerSingleton<HomeRemoteDataSourceImple>(
    HomeRemoteDataSourceImple(
      api: getIt.get<Api>(),
    ),
  );
  getIt.registerSingleton<Api>(
    Api(
      Dio(),
    ),
  );
}
