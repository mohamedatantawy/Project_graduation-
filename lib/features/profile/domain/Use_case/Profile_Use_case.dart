import 'package:dartz/dartz.dart';
import 'package:project_greduation/core/utils/errors/failure.dart';
import 'package:project_greduation/features/profile/domain/Repos/profileRemote_Source.dart';

class ProfileUseCase {
  final ProfileremoteSource profileremoteSource;

  ProfileUseCase({required this.profileremoteSource});
  @override
  Future<Either<Failure, dynamic>> call({required String token,required String oldpassword,required String newpassword,required String confrim}) {
    return profileremoteSource.changepassword(token: token,oldpassword:oldpassword,newpassword: newpassword,confrim: confrim);
  }
}
