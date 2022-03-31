import 'package:rxdart/rxdart.dart';
import 'package:xpresshealthdev/resources/respository.dart';

import '../model/manager_response.dart';

class CreateShiftmanagerBloc {
  final _repo = Repository();
  final _manager = PublishSubject<void>();
  final _getmanager = PublishSubject<ManagerShift>();

  Stream<void> get managerStream => _manager.stream;

  Stream<ManagerShift> get getmanagerStream => _getmanager.stream;

  createShiftManager(
    String token,
    String type,
    String category,
    String user_type,
    String job_title,
    String hospital,
    String date,
    String time_from,
    String time_to,
    String job_details,
    String price,
  ) async {
    ManagerShift respo = await _repo.CreateShiftManager(
      token,
      type,
      category,
      user_type,
      job_title,
      hospital,
      date,
      time_from,
      time_to,
      job_details,
      price,
    );
    _manager.sink.add(respo);
  }

  dispose() {
    _manager.close();
  }
}

final managerBloc = CreateShiftmanagerBloc();
