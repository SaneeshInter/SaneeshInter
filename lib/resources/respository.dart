import 'package:xpresshealthdev/model/login_response.dart';
import 'package:xpresshealthdev/model/user_get_response.dart';
import 'package:xpresshealthdev/model/user_get_shift_details.dart';
import 'package:xpresshealthdev/model/user_home_response.dart';
import 'package:xpresshealthdev/model/user_job_request.dart';
import 'package:xpresshealthdev/resources/api_provider.dart';

import '../model/accept_job_request.dart';
import '../model/get_available_user_by_date.dart';
import '../model/manager_home_response.dart';
import '../model/manager_response.dart';
import '../model/manager_view_request.dart';
import '../model/remove_manager_schedule.dart';
import '../model/shift_list_response.dart';
import '../model/user_getschedule_by_month_year.dart';
import '../model/user_getschedule_bydate.dart';
import '../model/user_home_response.dart';
import '../model/user_profile_update.dart';
import '../model/user_view_request_response.dart';
import '../model/utility_respo.dart';
import '../model/viewbooking_response.dart';

class Repository {
  final apiProvider = ApiProvider();

  Future<SliftListRepso> fetchAllShift(String date) =>
      apiProvider.fetchShiftList(date);

  Future<SliftListRepso> fetchNotification() => apiProvider.fetchNotification();

  Future<SliftListRepso> fetchComplete() => apiProvider.fetchcomplete();

  Future<SliftListRepso> fetchConfirm() => apiProvider.fetchConfirm();

  Future<ManagerScheduleListResponse> fetchUserListByDate(String token,String date) =>
      apiProvider.fetchUserListByDate(token,date);



  Future<ManagerScheduleListResponse> fetchViewbooking(
          String token, String date) =>
      apiProvider.fetchViewbooking(token, date);

  Future<SliftListRepso> fetchTimesheet() => apiProvider.fetchTimesheet();


  Future<LoginUserRespo> fetchLogin(String username, String password) =>
      apiProvider.loginUser(username, password);

  Future<UtilityResop> fetchUtility() => apiProvider.fetchUtility();

  Future<UserGetResponse> fetchUserInfo(String token) =>
      apiProvider.getUserInfo(token);

  Future<RemoveManagerScheduleResponse> fetchRemoveManager(
          String token, String row_id) =>
      apiProvider.removeManager(token, row_id);





  Future<UserGetScheduleByDate> fetchGetUserScheduleByDate(
          String token, String date) =>
      apiProvider.getUserScheduleByDate(token, date);


  Future<UserGetScheduleByMonthYear>fetchGetUserScheduleByMonthYear(
          String token, String month, String year) =>
      apiProvider.getUserScheduleByMonthYear(token, month, year);


  Future<UserJobRequestResponse> fetchUserJobRequest(
      String token, String job_id) =>
      apiProvider.getUserJobRequest(token, job_id);

  Future<ManagerViewRequestResponse> fetchManagerViewRequest(
      String token, String shift_id) =>
      apiProvider.getManagerViewRequest(token, shift_id);


  Future<AcceptJobRequestResponse> fetchAcceptJobRequestResponse(
      String token, String job_request_row_id) =>
      apiProvider.AcceptJobRequest(token, job_request_row_id);


  Future<UserHomeResponse> fetchUserHomeResponse(
      String token) =>
      apiProvider.getUserHome(token);

  Future<ManagerHomeResponse> fetchManagerHomeResponse(
      String token) =>
      apiProvider.getManagerHome(token);

  Future<UserViewRequestResponse> fetchUserViewRequestResponse(
      String token) =>
      apiProvider.getUserViewRequest(token);



  Future<GetUserShiftDetailsResponse> fetchGetUserShiftDetailsResponse(
      String token, String shift_id) =>
      apiProvider.getUserShiftDetails(token,shift_id);





  Future<ProfileUpdateRespo> ProfileUser(
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
          String bank_bic) =>
      apiProvider.ProfileUser(
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

  Future<ManagerShift> CreateShiftManager(
    String token,
      int row_id,
    int type,

      int category,
      int user_type,
    String job_title,
      int hospital,
    String date,
    String time_from,
    String time_to,
    String job_details,
    String price,
      String shift,
  ) =>
      apiProvider.CreateShiftManager(
        token,
        type.toString(),
        row_id,
        category.toString(),
        user_type.toString(),
        job_title,
        hospital.toString(),
        date,
        time_from,
        time_to,
        job_details,
        price,shift
      );



  Future<GetAvailableUserByDate> fetchGetAvailableUserByDate(String token,String date, String shifttype) =>
      apiProvider.fetchGetAvailableUserByDate(token,date,shifttype);


}
