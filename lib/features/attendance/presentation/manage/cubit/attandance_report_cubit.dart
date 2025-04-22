import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_greduation/core/utils/sharedperfernace.dart';
import 'package:project_greduation/features/attendance/data/models/reportattandance/reportattandance.dart';
import 'package:project_greduation/features/attendance/domain/Use_Case/attendance_Use_Case.dart';

part 'attandance_report_state.dart';

class AttandanceReportCubit extends Cubit<AttandanceReportState> {
  AttandanceReportCubit({required this.attendanceUseCase})
      : super(AttandanceReportInitial());
  final AttendanceUseCase attendanceUseCase;
  getreport(
      {required String session, required int id, required String token}) async {
    emit(AttandanceReportloading());
    // String token = await Sharedperfernace.getString('token') ?? '';
    var data =
        await attendanceUseCase.call(session: session, id: id, token: token);
    data.fold((failure) {
      emit(AttandanceReportFailure(emassage: failure.errormassage));
    }, (right) {
      emit(AttandanceReportSucess(reportattandancemodel: right));
    });
  }
}
