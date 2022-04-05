import 'dart:convert';

import 'package:http/http.dart';
import 'package:xpresshealthdev/model/login_response.dart';

import '../model/accept_job_request.dart';
import '../model/manager_response.dart';
import '../model/manager_view_request.dart';
import '../model/remove_manager_schedule.dart';
import '../model/shift_list_response.dart';
import '../model/user_get_response.dart';
import '../model/utility_respo.dart';
import '../model/user_getschedule_bydate.dart';
import '../model/user_getschedule_by_month_year.dart';
import '../model/user_job_request.dart';
import '../model/viewbooking_response.dart';

class ApiProvider {
  Client client = Client();
  String BASE_URL = "https://intersmarthosting.in/DEV/ExpressHealth/api";

  Future<LoginUserRespo> loginUser(String username, String password) async {
    var uri = Uri.parse(BASE_URL + '/account/login');
    final response = await client.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': username,
          'password': password,
        }));

    print(jsonEncode(<String, String>{
      'email': username,
      'password': password,
    }).toString());
    print(response.body);

    if (response.statusCode == 200) {
      return LoginUserRespo.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<UtilityResop> fetchUtility() async {
    var uri = Uri.parse(BASE_URL + '/account/get-utilities');
    final response = await client.get(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      return UtilityResop.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }

  ///// manager remove schedule////
  Future<RemoveManagerScheduleResponse> removeManager(
      String token, String rowId) async {
    var uri = Uri.parse(BASE_URL + '/manager/remove-schedule');
    final response = await client.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'token': token,
        },
        body: jsonEncode(<String, String>{
          'row_id': rowId,
        }));

    print("PRINT TOKEN" + token);

    print(jsonEncode(<String, String>{
      'row_id': rowId,
    }).toString());
    print(response.body);

    if (response.statusCode == 200) {
      return RemoveManagerScheduleResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }

  // USER GET SCHEDULE BY DATE ////

  Future<UserGetScheduleByDate> getUserScheduleByDate(
      String token, String date) async {
    var uri = Uri.parse(BASE_URL + '/get-schedule-by-date');
    final response = await client.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'token': token,
        },
        body: jsonEncode(<String, String>{
          'date': date,
        }));

    print("PRINT DATE" + token);

    print(jsonEncode(<String, String>{
      'date': date,
    }).toString());
    print(response.body);

    if (response.statusCode == 200) {
      return UserGetScheduleByDate.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }

  /// USER GET SCHEDULE MONTH AND YEAR ///


  Future<UserGetScheduleByMonthYear> getUserScheduleByMonthYear(

      String token, String month,String year) async {
    var uri = Uri.parse(BASE_URL + '/get-schedule-by-month');
    final response = await client.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'token': token,
        },
        body: jsonEncode(<String, String>{
          'month': month,
          'year': year,

        }));

    print("PRINT MONTH YEAR" + token);

    print(jsonEncode(<String, String>{
       'month':month,
      'year': year,
    }).toString());
    print(response.body);

    if (response.statusCode == 200) {
      return UserGetScheduleByMonthYear.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }




             ///ACEEPT JOB REQUEST ////

  Future<AcceptJobRequestResponse> AcceptJobRequest(String token,
      String job_request_row_id ) async {
    var uri = Uri.parse(BASE_URL + "/manager/accept-job-request");
    final response = await client.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'token': token,
        },
        body: jsonEncode(<String, String>{
          'job_request_row_id': job_request_row_id,
        }));

    print("PRINT ACCEPT VIEW JOB REQUEST" + token);

    print(jsonEncode(<String, String>{
      'job_request_row_id': job_request_row_id,
    }).toString());
    print(response.body);

    if (response.statusCode == 200) {
      return AcceptJobRequestResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }

              ////GET USER  JOB REQUEST /////


  Future<UserJobRequestResponse> getUserJobRequest(

      String token, String job_id) async {
    var uri = Uri.parse(BASE_URL + "/user/job-request");
    final response = await client.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'token': token,
        },
        body: jsonEncode(<String, String>{
          'job_id': job_id,


        }));

    print("PRINT JOB REQUEST" + token);

    print(jsonEncode(<String, String>{
      'job_id': job_id,

    }).toString());
    print(response.body);

    if (response.statusCode == 200) {
      return UserJobRequestResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }


/// MANAGER VIEW REQUEST RESPONSES /////



  Future<ManagerViewRequestResponse> getManagerViewRequest(

      String token, String shift_id) async {
    var uri = Uri.parse(BASE_URL + "/manager/view-request");
    final response = await client.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'token': token,
        },
        body: jsonEncode(<String, String>{
          'shift_id': shift_id,


        }));

    print("PRINT VIEW REQUEST" + token);

    print(jsonEncode(<String, String>{
      'shift_id': shift_id,

    }).toString());
    print(response.body);

    if (response.statusCode == 200) {
      return ManagerViewRequestResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }





  Future<void> loginUsertst(String username, String password) async {
    var uri = Uri.parse(BASE_URL + '/account/login');
    final response = await client.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': username,
          'password': password,
        }));

    print(response.body);
  }





  Future<UserGetResponse> getUserInfo(String token) async {
    print("token");
    print(token);
    var uri = Uri.parse(BASE_URL + '/account/get-user-info');
    print(uri);
    final response = await client.get(
      uri,
      headers: <String, String>{
        'Token': token,
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      return UserGetResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }


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
      String bank_bic) async {
    var uri = Uri.parse(BASE_URL + '/account/update-profile');
    final response = await client.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          "token": token,
        },
        body: jsonEncode(<String, String>{
          "first_name": first_name,
          "last_name": last_name,
          "dob": dob,
          "nationality": nationality,
          "home_address": home_address,
          "permission_to_work_in_ireland": permission_to_work_in_ireland,
          "visa_type": visa_type,
          "phone_number": phone_number,
          "email": email,
          "pps_number": pps_number,
          "bank_bic": bank_bic,
        }));

    print(jsonEncode(<String, String>{
      "first_name": first_name,
      "last_name": last_name,
      "dob": dob,
      "nationality": nationality,
      "home_address": home_address,
      "permission_to_work_in_ireland": permission_to_work_in_ireland,
      "visa_type": visa_type,
      "phone_number": phone_number,
      "email": email,
      "pps_number": pps_number,
      "bank_bic": bank_bic,
    }).toString());
    print(response.body);
    print(response.statusCode);
    print(response.toString());
  }

  Future<SliftListRepso> fetchShiftList(String date) async {
    print("date");
    print(date);
    var uri = Uri.parse(BASE_URL + '/account/login');
    final response = await client.get(uri);
    print(response);
    if (response.statusCode == 200) {
      return SliftListRepso.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<SliftListRepso> fetchNotification() async {
    print("date");

    var uri = Uri.parse(
        'https://agasthyapix.yodser.com/api/categories.asmx/fillCategories');
    final response = await client.get(uri);
    print(response);
    if (response.statusCode == 200) {
      return SliftListRepso.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<SliftListRepso> fetchcomplete() async {
    print("COMPLETE");

    var uri = Uri.parse(
        'https://agasthyapix.yodser.com/api/categories.asmx/fillCategories');
    final response = await client.get(uri);
    print(response);
    if (response.statusCode == 200) {
      return SliftListRepso.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<SliftListRepso> fetchConfirm() async {
    print("CONFIRMED");

    var uri = Uri.parse(
        'https://agasthyapix.yodser.com/api/categories.asmx/fillCategories');
    final response = await client.get(uri);
    print(response);
    if (response.statusCode == 200) {
      return SliftListRepso.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }

  /////////      MANAGER API LISTS       ///////

  Future<ManagerScheduleListResponse> fetchViewbooking(
      String token, String date) async {
    print("View Booking");

    var uri = Uri.parse(BASE_URL + '/manager/get-schedule-by-date');
    final response = await client.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          "token": token,
        },
        body: jsonEncode(<String, String>{
          "date": date,
        }));

    print(response.body);
    print(response.statusCode);
    print(response.toString());
    if (response.statusCode == 200) {
      return ManagerScheduleListResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<SliftListRepso> fetchTimesheet() async {
    print("Time sheet");

    var uri = Uri.parse(
        'https://agasthyapix.yodser.com/api/categories.asmx/fillCategories');
    final response = await client.get(uri);
    print(response);
    if (response.statusCode == 200) {
      return SliftListRepso.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<SliftListRepso> fetchHomepage() async {
    print("HomePage");

    var uri = Uri.parse(
        'https://agasthyapix.yodser.com/api/categories.asmx/fillCategories');
    final response = await client.get(uri);
    print(response);
    if (response.statusCode == 200) {
      return SliftListRepso.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }

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
  ) async {
    var uri = Uri.parse(BASE_URL + '/manager/add-schedule');
    final response = await client.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          "token": token,
        },
        body: jsonEncode(<String, String>{
          "type": type,
          "category": category,
          "user_type": user_type,
          "job_title": job_title,
          "hospital": hospital,
          "date": date,
          "time_from": time_from,
          "time_to": time_to,
          "job_details": job_details,
          "price": price,
          "allowances": "",
          "assigned_to": ""
        }));

    print("token" + token);
    print(jsonEncode(<String, String>{
      "type": type,
      "category": category,
      "user_type": user_type,
      "job_title": job_title,
      "hospital": hospital,
      "date": date,
      "time_from": time_from,
      "time_to": time_to,
      "job_details": job_details,
      "price": price,
      "allowances": "",
      "assigned_to": ""
    }));

    if (response.statusCode == 200) {
      return ManagerShift.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }

    print(response.body);
    print(response.statusCode);
    print(response.toString());
  }
}
