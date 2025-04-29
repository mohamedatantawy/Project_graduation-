import 'package:dio/dio.dart';

class Api {
  final Dio _dio;

  Api(this._dio);
  // {
  //   (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
  //       (client) {
  //     client.badCertificateCallback =
  //         (cert, host, port) => true; // Ignore SSL errors
  //   };
  // }
  //https://graduationa-project-production.up.railway.app/api/
  final String baseurl = 'https://attendance-project.up.railway.app/api/';
  //"https://attendance-production-0ecd.up.railway.app/api/";
  Future<dynamic> posts({
    required String path,
    Map? data,
    Map<String, dynamic>? token,
  }) async {
    try {
      Response response = await _dio.post(
       "$baseurl$path",
        data: data,
        options: Options(
          headers: token,
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
        print(response.data);
      } 
    } on DioException catch (e) {
      return e.response!.data;
    }
  }

  Future<dynamic> petch(
      {required String path,
      required Map data,
      required Map<String, dynamic> token}) async {
    try {
      Response response = await _dio.patch(
       "$baseurl$path",
        data: data,
        options: Options(
          headers: token,
        ),
      );

      print(response.data);
      if (response.statusCode ==200||response.statusCode==201)
    {  return response.data;}
   
    } on DioException catch (e) {
      print(e.response!.data.toString());
      return e.response!.data;
    }

    // if (response.statusCode == 403) {
    //   print(response.data.toString());
    //   return response.data;
    //   print(response.data);
    // } else {
    //   return response.data;
    // }
  }

  Future<dynamic> geta(
      {required String path, required Map<String, dynamic>? token}) async {
    /* Response response = await dio.get("https://nubaria.ddns.net/api/student/schedules",options: Options(
        headers: {
          'Authorization': 'Bearer 1|FMIlQbGStafP6Ea3oIIRiM310kouJjja47iG1BRZ62ad02c8',  // Include the token here
        },
      ), ); */
    try {
      Response response = await _dio.get(
        "https://attendance-project.up.railway.app/api/$path",
        options: Options(
          headers: token,
        ),
      );

      return response.data;
    } on DioException catch (e) {
      return e.response!.data;
    }
  }
}
