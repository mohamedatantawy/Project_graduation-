import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:project_greduation/core/utils/errors/failure.dart';
import 'package:project_greduation/features/profile/domain/Repos/profileRemote_Source.dart';
import 'package:project_greduation/helper/api.dart';

class ProfileRemoteSourceImpl implements ProfileremoteSource {
  final Api api;

  ProfileRemoteSourceImpl({required this.api});
  @override
  Future<Either<Failure, dynamic>> changepassword(
      {required String token,
      required String oldpassword,
      required String newpassword,
      required String confrim}) async {
    try {
      var data = await api.posts(
          data: {
            "old_password": oldpassword,
            "new_password": newpassword,
            "new_password_confirmation": confrim,
          },
          path: "https://attendance-project.up.railway.app/api/change-password",
          token: {
            'Authorization': 'Bearer $token', // Include the token here
          });

      return right(data);
    } catch (e) {
      if (e is DioException)
        return left(Serverfailure.fromdioerror(e));
      else {
        return left(Serverfailure(
          errormassage: e.toString(),
        ));
      }
    }
  }
}
