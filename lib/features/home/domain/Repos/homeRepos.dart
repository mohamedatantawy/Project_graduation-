import 'package:dartz/dartz.dart';
import 'package:project_greduation/core/utils/errors/failure.dart';
import 'package:project_greduation/features/home/data/models/material/materialmodel.dart';

abstract class HomeRepoDataSource {
  Future<Either<Failure, List<Materialmodels>>> fetchsubjects(
      {required String token});
  Future<Either<Failure, bool>> isavailablesubject(
      {required String token, required int id, required String session});
}
