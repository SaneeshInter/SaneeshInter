import 'package:rxdart/rxdart.dart';
import 'package:xpresshealthdev/model/login_response.dart';
import 'package:xpresshealthdev/resources/respository.dart';

import '../model/manager_view_request.dart';
import '../model/shift_list_response.dart';

class ManagerViewRequestBloc {
  final _repo = Repository();
  final _managerviewrequest = PublishSubject<ManagerViewRequestResponse>();

  Stream<ManagerViewRequestResponse> get managerviewrequest => _managerviewrequest.stream;


  fetchManagerViewBooking(String token,String shift_id ) async {
    ManagerViewRequestResponse respo = await _repo.fetchManagerViewRequest(token, shift_id);
    _managerviewrequest.sink.add(respo);
  }

  dispose() {
    _managerviewrequest.close();
  }
}

final managerviewrequestBloc = ManagerViewRequestBloc();


