import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xpresshealthdev/model/user_get_response.dart';
import 'package:xpresshealthdev/resources/respository.dart';

import '../Constants/sharedPrefKeys.dart';
import '../db/database.dart';
import '../model/country_list.dart';
import '../model/gender_list.dart';
import '../model/user_profile_update.dart';
import '../model/visa_type_list.dart';

class ProfileBloc {
  final _repo = Repository();
  final _profileUser = PublishSubject<ProfileUpdateRespo>();
  final _getUser = PublishSubject<UserGetResponse>();
  final _db = Db();


  List<String> genders = [];
  final _gender = PublishSubject<List<GenderList>>();
  Stream<List<GenderList>> get genderStream => _gender.stream;

  List<String> country = [];
  final _country= PublishSubject<List<CountryList>>();
  Stream<List<CountryList>> get countryStream => _country.stream;

  List<String> visatype = [];
  final _visatype= PublishSubject<List<VisaTypeList>>();
  Stream<List<VisaTypeList>> get visatypeStream => _visatype.stream;



  final _updateProfile = PublishSubject<void>();

  Stream<void>? get updateProfileSteam => _updateProfile.stream;



  getDropDownValues() async {
    var genderList = await _db.getGenderList();
    _gender.add(genderList);


    var country = await _db.getGetCountryList();
    _country.add(country);

    var  visatypelist= await _db.getGetVisaTypeList();
    _visatype.add(visatypelist);

  }



  Stream<ProfileUpdateRespo> get profileStream => _profileUser.stream;

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
      String gender,
      String nationality,
      String home_address,
      String permission_to_work_in_ireland,
      String visa_type,
      String phone_number,
      String email,
      String pps_number,
      String bank_iban,
      String bank_bic, ) async {
    ProfileUpdateRespo respo = await _repo.ProfileUser(
        token,
        first_name,
        last_name,
        dob,
        gender,
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
