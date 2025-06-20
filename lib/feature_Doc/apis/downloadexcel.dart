import 'dart:developer';

import 'package:dio/dio.dart';

class Downloadexcel {
  final Dio dio;

  Downloadexcel({required this.dio});

  Future< List<int>> downloadexcel(
      {required String token, required String role, required int id}) async {
    // final prefs = await SharedPreferences.getInstance();
    // String? token = prefs.getString('token');

    Response response;
    role == 'assistant'
        ? response = await dio.get(
            ///api/assistant/sections/2/attendance/today/present-students
            ///api/doctor/schedules/1/attendance/today/present-students

            'https://nubaria.ddns.net/api/assistant/sections/$id/attendance/export/excel',
            options: Options(
              headers: {
                'Authorization': 'Bearer $token',
                //'Accept': 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
              },
              responseType: ResponseType.bytes,
            ),
          )
        : response = await dio.get(
            ///api/assistant/sections/2/attendance/today/present-students
            ///api/doctor/schedules/1/attendance/today/present-students

            'https://nubaria.ddns.net/api/doctor/schedules/$id/attendance/export/excel',
            options: Options(
              headers: {
                'Authorization': 'Bearer $token',
                //'Accept': 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
              },
               responseType: ResponseType.bytes,
            ),
          );

    log(response.data.toString());

    return response.data;

   
  }
}
