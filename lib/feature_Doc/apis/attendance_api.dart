import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AttendanceApi {
  AttendanceApi({required this.dio});

  final Dio dio;

  Future<dynamic> openAtendance(
      {required String token, required int id}) async {
    var res = await dio.patch(
      'https://attendance-project.up.railway.app/api/doctor/open-attendance/$id',
      data: {
        'time': '5',
      },
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );
    return res.data;
  }

  Future<dynamic> closeAtendance(
      {required String token, required int id}) async {
    var res = await dio.patch(
      'https://attendance-project.up.railway.app/api/doctor/close-attendance/$id',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );
    return res.data;
  }
}
