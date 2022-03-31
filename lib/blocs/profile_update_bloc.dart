import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xpresshealthdev/model/user_get_response.dart';
import 'package:xpresshealthdev/resources/respository.dart';

import '../Constants/sharedPrefKeys.dart';

class ProfileBloc {
  final _repo = Repository();
  final _profileUser = PublishSubject<void>();
  final _getUser = PublishSubject<UserGetResponse>();




  Stream<void> get profileStream => _profileUser.stream;

  Stream<UserGetResponse> get getProfileStream => _getUser.stream;

  getUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString(SharedPrefKey.AUTH_TOKEN);
    if (null != token) {
      UserGetResponse response = await _repo.fetchUserInfo(token);
      _getUser.sink.add(response);
    } else {
      print("Not loged in ");
    }
  }

  ProfileUser(
      String token,
      String first_name,
      String last_name,
      String dob,
      String nationality,
      String home_address,
      String permission_to_work_in_ireland,
      String visa_type,
      String phone_number,
      String email,
      String pps_number,
      String bank_iban,
      String bank_bic) async {
    void respo = await _repo.ProfileUser(
        token,
        first_name,
        last_name,
        dob,
        nationality,
        home_address,
        permission_to_work_in_ireland,
        visa_type,
        phone_number,
        email,
        pps_number,
        bank_iban,
        bank_bic);
    _profileUser.sink.add(respo);
  }

  dispose() {
    _profileUser.close();
  }
}

final profileBloc = ProfileBloc();
