import 'package:dio/dio.dart';
import 'package:project_greduation/feature_Doc/models/studentsfordrawermodels.dart';

class Attendancedrawer {
  final Dio dio;

  Attendancedrawer({required this.dio});

  Future<List<Studentsfordrawermodels>> attendancedrawermethod(
      {required String token, required String role, required int id}) async {
    var res;
    role == 'assistant'
        ? res = await dio.get(
            'https://nubaria.ddns.net/api/assistant/sections/$id/attendance/term',
            options: Options(
              headers: {
                'Authorization': 'Bearer $token',
              },
            ),
          )
        : res = await dio.get(
            'https://nubaria.ddns.net/api/doctor/schedules/$id/attendance/term',
            options: Options(
              headers: {
                'Authorization': 'Bearer $token',
              },
            ),
          );
    List<Studentsfordrawermodels> dataAll = [];
    for (var element in res.data['term_attendance']) {
      dataAll.add(Studentsfordrawermodels.fromJson(element));
    }
    return dataAll;
  }
}
