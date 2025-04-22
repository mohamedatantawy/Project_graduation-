import 'package:dartz/dartz.dart';
import 'package:project_greduation/core/utils/errors/failure.dart';
import 'package:project_greduation/features/takeattendance/domain/Repos/takeattandance_Remote.dart';

class TakeattandanceUseCase {
  final TakeattandanceDataSoure takeattandanceDataSoure;

  TakeattandanceUseCase({required this.takeattandanceDataSoure});
  Future<dynamic> call({
    required String session,
    required String latitude,
    required String longitude,
    required String token,
    required int id,
  }) {
    return takeattandanceDataSoure.getlocation(
        session: session,
        latitude: latitude,
        longitude: longitude,
        token: token,
        id: id);
  }
}
