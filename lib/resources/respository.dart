import 'package:xpresshealthdev/model/login_response.dart';
import 'package:xpresshealthdev/model/user_get_response.dart';
import 'package:xpresshealthdev/resources/api_provider.dart';

import '../model/manager_response.dart';
import '../model/remove_manager_schedule.dart';
import '../model/shift_list_response.dart';
import '../model/viewbooking_response.dart';

class Repository {
  final apiProvider = ApiProvider();

  Future<SliftListRepso> fetchAllShift(String date) =>
      apiProvider.fetchShiftList(date);

  Future<SliftListRepso> fetchNotification() => apiProvider.fetchNotification();

  Future<SliftListRepso> fetchComplete() => apiProvider.fetchcomplete();

  Future<SliftListRepso> fetchConfirm() => apiProvider.fetchConfirm();

  Future<ManagerScheduleListResponse> fetchViewbooking(String token,String date) => apiProvider.fetchViewbooking(token,date);

  Future<SliftListRepso> fetchTimesheet() => apiProvider.fetchTimesheet();

  Future<SliftListRepso> fetchHomepage() => apiProvider.fetchHomepage();

  Future<LoginUserRespo> fetchLogin(String username,String password) =>
      apiProvider.loginUser(username, password);

  Future<UserGetResponse> fetchUserInfo(String token) =>
      apiProvider.getUserInfo(token);



  Future<RemoveManagerScheduleResponse> fetchRemoveManager(String token,String row_id) =>
      apiProvider.removeManager(token, row_id);





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





  Future<ManagerShift> CreateShiftManager(
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
  ) =>
      apiProvider.CreateShiftManager(
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
}
