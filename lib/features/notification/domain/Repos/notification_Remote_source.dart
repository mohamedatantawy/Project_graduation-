import 'package:dartz/dartz.dart';
import 'package:project_greduation/core/utils/errors/failure.dart';
import 'package:project_greduation/features/notification/data/models/worningmodels.dart';

abstract class NotificationRemoteSource {
  Future<Either<Failure, dynamic>> fetchNotification({required String token,});
}
