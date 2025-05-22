import 'package:dio/dio.dart';

class Absentstudents {
  final Dio dio;

  Absentstudents({required this.dio});

  Future<dynamic> absent(
      {required String token, required int id, required int idstudent}) async {
    var res = await dio.patch(
      'https://nubaria.ddns.net/api/doctor/mark-absent/$id',
      data: {
        'student_id': '$idstudent',
      },
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );
    return res.data;
  }
}
