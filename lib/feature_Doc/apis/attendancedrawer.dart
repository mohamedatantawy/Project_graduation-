import 'package:dio/dio.dart';
import 'package:project_greduation/feature_Doc/models/studentsfordrawermodels.dart';

class Attendancedrawer {
  final Dio dio;

  Attendancedrawer({required this.dio});

  Future<List<Studentsfordrawermodels>> attendancedrawermethod(
      {required String token, required int id}) async {
    var res = await dio.get(
      'https://nubaria.ddns.net/api/doctor/term-attendance/$id',
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
