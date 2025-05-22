import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AttendanceApi {
  AttendanceApi({required this.dio});

  final Dio dio;

  Future<dynamic> openAtendance(
      {required String token, required int id ,required int minute}) async {
    var res = await dio.patch(
      'https://nubaria.ddns.net/api/doctor/open-attendance/$id',
      data: {
        'time': '$minute',
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
      {required String token, required int id,}) async {
    var res = await dio.patch(
      'https://nubaria.ddns.net/api/doctor/close-attendance/$id',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );
    return res.data;
  }//nubaria.ddns.net
}
