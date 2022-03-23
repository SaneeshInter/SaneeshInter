import 'package:xpresshealthdev/model/login_response.dart';
import 'package:xpresshealthdev/model/user_get_response.dart';
import 'package:xpresshealthdev/resources/api_provider.dart';

import '../model/shift_list_response.dart';

class Repository {
  final apiProvider = ApiProvider();

  Future<SliftListRepso> fetchAllShift(String date) =>
      apiProvider.fetchShiftList(date);

  Future<LoginUserRespo> fetchLogin(String username, password) =>
      apiProvider.loginUser(username, password);

  Future<UserGetResponse> fetchUserInfo(String token) => apiProvider.getUserInfo(token);

  Future<void> ProfileUser(
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
          String bank_bic) =>
      apiProvider.ProfileUser(
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
}
