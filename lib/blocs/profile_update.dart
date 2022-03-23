import 'dart:ffi';

import 'package:rxdart/rxdart.dart';
import 'package:xpresshealthdev/model/shift_login.dart';
import 'package:xpresshealthdev/resources/respository.dart';

import '../model/shift_list_response.dart';

class ProfileBloc {
  final _repo = Repository();
  final _profileUser= PublishSubject< void>();

 // Stream<ProfileUser> get loginStream => _profileBloc.stream;
  Stream<void> get profileStream => _profileUser.stream;


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
      String bank_bic


      ) async {
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
        bank_bic

    );
    _profileUser.sink.add(respo);
  }

  dispose() {
    _profileUser.close();
  }
}

final ProfileBlocc = ProfileBloc();


