import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:project_greduation/core/utils/errors/failure.dart';
import 'package:project_greduation/features/takeattendance/domain/Repos/takeattandance_Remote.dart';
import 'package:project_greduation/helper/api.dart';

class TakeattendanceDataSourceimple implements TakeattandanceDataSoure {
  final Api api;

  TakeattendanceDataSourceimple({required this.api});
  @override
  Future< dynamic> getlocation(
      {required String session,
      required String latitude,
      required String longitude,
      required String token,
      required int id}) async {
    try {
      var data = await api.petch(
        token: {
          'Authorization': 'Bearer $token', // Include the token here
        },
        path:
            "https://graduationa-project-production.up.railway.app/api/student/attend/$id",
        data: {
          "session_type": session,
          "latitude": latitude,
          "longitude": longitude,
        },
      );
      print(data.toString());
        return data;
      
    }on DioException catch (e) {
      return e.response!.data['message'];
    }
  }
}
