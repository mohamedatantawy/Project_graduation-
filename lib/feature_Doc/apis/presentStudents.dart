import 'package:dio/dio.dart';

class Presentstudents {
  final Dio dio;

  Presentstudents({required this.dio});

  Future<dynamic> present(
      {required String token,
      required int id,
      required int idstudent,
      required String role}) async {
    var res;
//api/assistant/sections/2/attendance/mark-absent
    role == 'assistant'
        ? {
            res = await dio.patch(
              'https://nubaria.ddns.net/api/assistant/sections/$id/attendance/mark-present',
              data: {
                'student_id': '$idstudent',
              },
              options: Options(
                headers: {
                  'Authorization': 'Bearer $token',
                },
              ),
            )
          }
        : {
            res = await dio.patch(
              'https://nubaria.ddns.net/api/doctor/schedules/$id/attendance/mark-present',
              data: {
                'student_id': '$idstudent',
              },
              options: Options(
                headers: {
                  'Authorization': 'Bearer $token',
                },
              ),
            )
          };
    return res.data;
  }
}
