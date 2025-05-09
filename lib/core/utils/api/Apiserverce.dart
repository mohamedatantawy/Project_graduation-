import 'package:dio/dio.dart';
import 'package:project_greduation/core/utils/api/Apiconstant.dart';
import 'package:project_greduation/core/utils/sharedperfernace.dart';
import 'package:project_greduation/features/Auth/data/models/user/user.dart';
import 'package:project_greduation/features/attendance/data/models/reportattandance/reportattandance.dart';
import 'package:project_greduation/features/home/data/models/material/materialmodel.dart';
import 'package:project_greduation/helper/api.dart';

class Apiserverce {
  final Dio dio;
  Apiserverce(this.dio);
  String getmaterialname =
      'https://attendance-project.up.railway.app/api/student/schedules';
  Future<Usermodels> getloginresonse(
      {required String email, required String password}) async {
    var data = await Api(Dio()).posts(
      path: "https://attendance-project.up.railway.app/api/login",
      data: {
        "email": email,
        "password": password,
      },
    );
    print(data.toString());

    Usermodels user = Usermodels.fromJson(data);
    // String token = data['token'];
    return user;
  }

  Future<dynamic> getresetpassword({required String email}) async {
    var data = await Api(Dio()).posts(
      path: "https://attendance-project.up.railway.app/api/send-otp",
      data: {
        "email": email,
      },
    );

    print(data.toString());
    return data;
  }

  Future<dynamic> logout({required String token}) async {
    var dataa = await Api(Dio()).posts(
      path: Apiconstant.logout,
      token: {
        'Authorization': 'Bearer $token', // Include the token here
      },
    );

    print(dataa.toString());
    // return true;
    if (dataa['message'] == "logged out") {
      return true;
    } else {
      return false;
    }
  }

  Future<dynamic> getotp({required String email, required String otp}) async {
    var data = await Api(Dio()).posts(
      path: "https://attendance-project.up.railway.app/api/verify-otp",
      data: {
        "email": email,
        "otp": otp,
      },
    );

    print(data.toString());
    return data;
  }

  // Future<List<Materialmodels>> getsubject({required String token}) async {
  //   var data = await Api(Dio()).geta(
  //       path:
  //           "https://attendance-production-0ecd.up.railway.app/api/student/schedules",
  //       token: {
  //         'Authorization': 'Bearer $token', // Include the token here
  //       });
  //   List<Materialmodels> subjectList = [];
  //   List datamodels = data["schedules"];
  //   //  print(datamodels.toString());
  //   for (int i = 0; i < datamodels.length; i++) {
  //     subjectList.add(Materialmodels.fromJson(datamodels[i]));
  //   }
  //   await Sharedperfernace.setString('token', token);
  //   // print(subjectList.length.toString());
  //   return subjectList;
  // }

  // Future<bool> Is_available(
  //     {required String session, required String token,required int id}) async {
  //   var data = await Api(Dio()).geta(
  //     token: {
  //       'Authorization': 'Bearer $token', // Include the token here
  //     },
  //     path:
  //         "student/is-attendance-available/$id?session_type=$session",
  //   );

  //   // print(data.toString());
  //   if (data['message'] == "attendance is available for this course now") {
  //     return true;
  //   } else {
  //     return false;
  //   }
  //   // print(subjectList.length.toString());
  //   //return data;
  // }

  Future<dynamic> resetpassword(
      {required String email,
      required String otp,
      required String password,
      required String confirm}) async {
    var data = await Api(Dio()).posts(
      path:
          "https://attendance-project.up.railway.app/api/verify-otp-reset-password",
      data: {
        "email": email,
        "new_password": password,
        "new_password_confirmation": confirm,
        "otp": otp
      },
    );

    print(data.toString());
    return data;
  }

  Future<dynamic> getloaction({
    required String session,
    required String latitude,
    required String longitude,
    required String token,
    required int id,
  }) async {
    var data = await Api(Dio()).petch(
      token: {
        'Authorization': 'Bearer $token', // Include the token here
      },
      path: "https://attendance-project.up.railway.app/api/student/attend/$id",
      data: {
        "session_type": session,
        "latitude": latitude,
        "longitude": longitude,
      },
    );

    print(data.toString());
    return data;
  }

  Future<Reportattandancemodel> getReport(
      {required String session, required int id, required String token}) async {
    var data = await Api(Dio()).geta(
      token: {
        'Authorization': 'Bearer $token', // Include the token here
      },
      path: "student/attendance-history/$id?session_type=$session",
    );

    Reportattandancemodel subjectList;
    var datamodels = data;
    //  print(datamodels.toString());
    // for (int i = 0; i < datamodels.length; i++) {
    subjectList = Reportattandancemodel.fromJson(datamodels);
    // }
    print(subjectList.toString());
    return subjectList;
  }
} //http://nubaria.ddns.net/api/verify-otp-reset-password
