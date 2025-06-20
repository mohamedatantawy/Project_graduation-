import 'dart:developer';

import 'package:dio/dio.dart';

class Getstudentattendance {
  final Dio dio;

  Getstudentattendance({required this.dio});

  Future<Map<String, dynamic>> getStudants(
      {required String token, required int id, required String role}) async {
    // final prefs = await SharedPreferences.getInstance();
    // String? token = prefs.getString('token');

    var response;

    role == 'assistant'
        ? response = await dio.get(
            ///api/doctor/schedules/1/attendance/today
            ///api/assistant/sections/2/attendance/today

            'https://nubaria.ddns.net/api/assistant/sections/$id/attendance/today',
            options: Options(
              headers: {
                'Authorization': 'Bearer $token',
              },
            ),
          )
        : response = await dio.get(
            ///api/doctor/schedules/1/attendance/today
            ///api/assistant/sections/2/attendance/today

            'https://nubaria.ddns.net/api/doctor/schedules/$id/attendance/today',
            options: Options(
              headers: {
                'Authorization': 'Bearer $token',
              },
            ),
          );

    log(response.data.toString());

    final data = response.data as Map<String, dynamic>;

    print(data.toString());
    return data;
  }
}
