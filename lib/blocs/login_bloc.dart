import 'package:rxdart/rxdart.dart';
import 'package:xpresshealthdev/model/shift_login.dart';
import 'package:xpresshealthdev/resources/respository.dart';

import '../model/shift_list_response.dart';

class LoginBloc {
  final _repo = Repository();
  final _loginbloc = PublishSubject<LoginShift>();

  Stream<LoginShift> get loginStream => _loginbloc.stream;

  fetchLogin(String username,String  password) async {
    LoginShift respo = await _repo.fetchLogin(username, password);
    _loginbloc.sink.add(respo);
  }

  dispose() {
    _loginbloc.close();
  }
}

final loginBloc = LoginBloc();


