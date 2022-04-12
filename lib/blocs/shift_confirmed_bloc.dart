import 'package:rxdart/rxdart.dart';
import 'package:xpresshealthdev/model/user_view_request_response.dart';

import '../model/shift_list_response.dart';
import '../resources/respository.dart';

class ShiftConfirmedBloc{
  final _repo = Repository();
  final   _viewrequest=PublishSubject<UserViewRequestResponse>();
  Stream<UserViewRequestResponse> get viewrequest => _viewrequest.stream;
  fetchUserViewRequest(String token) async {
    UserViewRequestResponse list = await _repo.fetchUserViewRequestResponse(token);
    _viewrequest.sink.add(list);
  }
  dispose() {
    _viewrequest.close();
  }
}


final  confirmBloc= ShiftConfirmedBloc();
