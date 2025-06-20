import 'dart:developer';
import 'package:dio/dio.dart';

class LectureInfoApi {
  LectureInfoApi({required this.dio});

  final Dio dio;

  Future<List<Map<String, dynamic>>> getLecInfo(
      {required String token, required String depname}) async {
    // final prefs = await SharedPreferences.getInstance();
    // String? token = prefs.getString('token');
    var response;
    depname == 'assistant'
        ? {
            response = await dio.get(
              'https://nubaria.ddns.net/api/assistant/sections',
              options: Options(
                headers: {
                  'Authorization': 'Bearer $token',
                },
              ),
            )
          }
        : response = await dio.get(
            'https://nubaria.ddns.net/api/doctor/schedules',
            options: Options(
              headers: {
                'Authorization': 'Bearer $token',
              },
            ),
          );

    log(response.data.toString());
    final data = response.data as Map<String, dynamic>;
    final schedules = List<Map<String, dynamic>>.from(
        depname == 'assistant' ? data['sections'] : data['schedules']);

    return schedules;
  }
}
