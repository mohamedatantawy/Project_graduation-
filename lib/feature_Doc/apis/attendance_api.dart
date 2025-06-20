import 'package:dio/dio.dart';

class AttendanceApi {
  AttendanceApi({required this.dio});

  final Dio dio;

  Future<dynamic> openAtendance(
      {required String token,
      required int id,
      required int minute,
      required String depname}) async {
    var res;
    depname == 'assistant'
        ? {
            res = await dio.patch(
              'https://nubaria.ddns.net/api/assistant/sections/$id/attendance/open',
              data: {
                ///api/assistant/sections/2/attendance/open
                'time': '$minute',
              },
              options: Options(
                headers: {
                  'Authorization': 'Bearer $token',
                },
              ),
            ),
          }
        : {
            res = await dio.patch(
              'https://nubaria.ddns.net/api/doctor/schedules/$id/attendance/open',
              data: {
                'time': '$minute',
              },
              options: Options(
                headers: {
                  'Authorization': 'Bearer $token',
                },
              ),
            ),
          };
    return res.data;
  }

  Future<dynamic> closeAtendance(
      {required String token, required int id, required String depname}) async {
    var res;
    depname == "assistant"
        ? {
            res = await dio.patch(
              'https://nubaria.ddns.net/api/assistant/sections/$id/attendance/close',
              options: Options(
                headers: {
                  'Authorization': 'Bearer $token',
                },
              ),
            )
          }
        : {
            res = await dio.patch(
              'https://nubaria.ddns.net/api/doctor/schedules/$id/attendance/close',
              options: Options(
                headers: {
                  'Authorization': 'Bearer $token',
                },
              ),
            )
          };
    return res.data;
  } //nubaria.ddns.net
}
