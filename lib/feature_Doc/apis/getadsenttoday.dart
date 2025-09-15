import 'dart:developer';

import 'package:dio/dio.dart';

class Getadsenttoday {
  final Dio dio;

  Getadsenttoday({required this.dio});

  Future< dynamic> getadsent(
      {required String token, required String role, required int id}) async {
    // final prefs = await SharedPreferences.getInstance();
    // String? token = prefs.getString('token');

    Response response;
    role == 'assistant'
        ? response = await dio.get(
            ///api/assistant/sections/2/attendance/today/present-students
            ///api/doctor/schedules/1/attendance/today/present-students

            'https://nubaria.ddns.net/api/assistant/sections/$id/attendance/today/absent-students',
            options: Options(
              headers: {
                'Authorization': 'Bearer $token',
                //'Accept': 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
              },
             
            ),
          )
        : response = await dio.get(
            ///api/assistant/sections/2/attendance/today/present-students
            ///api/doctor/schedules/1/attendance/today/present-students

            'https://nubaria.ddns.net/api/doctor/schedules/$id/attendance/today/absent-students',
            options: Options(
              headers: {
                'Authorization': 'Bearer $token',
                //'Accept': 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
              },
              
            ),
          );

    log(response.data.toString());

    return response.data;

   
  }
}
