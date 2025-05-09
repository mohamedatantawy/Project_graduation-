import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LectureInfoApi {
  LectureInfoApi({required this.dio});

  final Dio dio;

  Future<List<Map<String, dynamic>>> getLecInfo({required String token}) async {
    // final prefs = await SharedPreferences.getInstance();
    // String? token = prefs.getString('token');

    var response = await dio.get(
      'https://attendance-project.up.railway.app/api/doctor/schedules',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );

    log(response.data.toString());

    final data = response.data as Map<String, dynamic>;
    final schedules = List<Map<String, dynamic>>.from(data['schedules']);
    print(schedules.toString());
    return schedules;
  }
}
