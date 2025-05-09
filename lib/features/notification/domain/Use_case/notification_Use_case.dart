import 'package:dartz/dartz.dart';
import 'package:project_greduation/core/utils/errors/failure.dart';
import 'package:project_greduation/features/notification/data/models/worningmodels.dart';
import 'package:project_greduation/features/notification/domain/Repos/notification_Remote_source.dart';

class NotificationUseCase {
  final NotificationRemoteSource notificationRemoteSource;

  NotificationUseCase({required this.notificationRemoteSource});
  Future<Either<Failure, Map<String, dynamic>>> call({
    required String token,
  }) {
    return notificationRemoteSource.fetchNotification(
      token: token,
    );
  }
}
