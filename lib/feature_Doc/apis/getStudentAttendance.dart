import 'dart:developer';

import 'package:dio/dio.dart';

class Getstudentattendance {
  final Dio dio;

  Getstudentattendance({required this.dio});

  Future<Map<String, dynamic>> getStudants(
      {required String token, required int id}) async {
    // final prefs = await SharedPreferences.getInstance();
    // String? token = prefs.getString('token');

    var response = await dio.get(
      'https://attendance-project.up.railway.app/api/doctor/today-attendance/$id',
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
