import 'package:rxdart/rxdart.dart';
import 'package:xpresshealthdev/resources/respository.dart';

import '../model/shift_list_response.dart';

class LoginBloc {
  final _repo = Repository();
  final _loginbloc = PublishSubject<SliftListRepso>();

  Stream<SliftListRepso> get allShift => _loginbloc.stream;

  fetchLogin(String username,String  password) async {
    SliftListRepso list = await _repo.fetchLogin(username, password);
    _loginbloc.sink.add(list);
  }

  dispose() {
    _loginbloc.close();
  }
}

final loginBloc = LoginBloc();
