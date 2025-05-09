import 'package:dartz/dartz.dart';
import 'package:project_greduation/core/utils/errors/failure.dart';

abstract class TakeattandanceDataSoure {
  Future<Either<Failure, dynamic>> getlocation({
    required String session,
    required String latitude,
    required String longitude,
    required String token,
    required int id,
  });
}
