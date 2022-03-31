import 'dart:convert';

import 'package:http/http.dart';
import 'package:xpresshealthdev/model/login_response.dart';

import '../model/manager_response.dart';
import '../model/shift_list_response.dart';
import '../model/user_get_response.dart';
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

  // token,first_name, last_name, dob, nationality,
  // home_address, permission_to_work_in_ireland (1->Yes, 0-> No) ,
  // visa_type, phone_number,email, pps_number, bank_iban, bank_bic

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
        },
        body: jsonEncode(<String, String>{
          "token": token,
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
      "token": token,
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

  Future<ManagerScheduleListResponse> fetchViewbooking(String token,String date) async {
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

  Future<ManagerShift>CreateShiftManager(
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
          "user_type":user_type,
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

     print("token"+token);
    print(jsonEncode(<String, String>{

      "type": type,
      "category": category,
      "user_type":user_type,
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
