import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_greduation/features/profile/domain/Use_case/Profile_Use_case.dart';

part 'changepassword_state.dart';

class ChangepasswordCubit extends Cubit<ChangepasswordState> {
  ChangepasswordCubit(this.profileUseCase) : super(ChangepasswordInitial());
  final ProfileUseCase profileUseCase;
  changepasswords({
    required String token,
    required String oldpassword,
    required String newpassword,
    required String confirm,
  }) async {
    emit(Changepasswordloading());
    var data = await profileUseCase.call(
      token: token,
      confrim: confirm,
      oldpassword: oldpassword,
      newpassword: newpassword,
    );
    data.fold(((fail) {
      emit(ChangepasswordFailure(emassage: fail.errormassage));
    }), (right) {
      emit(ChangepasswordSucess(data: right));
    });
  }
}
