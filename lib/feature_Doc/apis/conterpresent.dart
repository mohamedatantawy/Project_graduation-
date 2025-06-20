import 'dart:developer';

import 'package:dio/dio.dart';

class Conterpresent {
  final Dio dio;

  Conterpresent({required this.dio});

  Future<Map<String, dynamic>> Conterpresentmothed(
      {required String token, required String role, required int id}) async {
    // final prefs = await SharedPreferences.getInstance();
    // String? token = prefs.getString('token');

    var response;
    role == 'assistant'
        ? response = await dio.get(
            ///api/assistant/sections/2/attendance/today/present-students
            ///api/doctor/schedules/1/attendance/today/present-students

            'https://nubaria.ddns.net/api/assistant/sections/$id/attendance/today/present-students',
            options: Options(
              headers: {
                'Authorization': 'Bearer $token',
              },
            ),
          )
        : response = await dio.get(
            ///api/assistant/sections/2/attendance/today/present-students
            ///api/doctor/schedules/1/attendance/today/present-students

            'https://nubaria.ddns.net/api/doctor/schedules/$id/attendance/today/present-students',
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
