import 'dart:convert';

import 'package:http/http.dart';
import 'package:xpresshealthdev/model/shift_login.dart';

import '../model/shift_list_response.dart';
//ref https://medium.com/codechai/architecting-your-flutter-project-bd04e144a8f1

class ApiProvider {
  Client client = Client();


  String BASE_URL = "https://intersmarthosting.in/DEV/ExpressHealth/api";

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

  // •	Login API
  // url

  // method : POST
  // parametters : email(email/phone number),password
  //
  // Login Credentials ( email : manu@intersmart.in , password : inter123 )


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

    print(jsonEncode(<String, String>{
      'email': username,
      'password': password,
    }));
    print(response.body);
    print(response.statusCode);
    print(response.toString());
  }

  Future<LoginShift> loginUser(String username, String password) async {

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
      return LoginShift.fromJson(json.decode(response.body));
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
      String permission_to_work_in_ireland ,
      String visa_type,
      String phone_number,
      String email,
      String pps_number,
      String  bank_iban,
      String bank_bic
  ) async {

    var uri = Uri.parse(BASE_URL + '/account/update-profile');
    final response = await client.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "token":token,
          "first_name": first_name,
        "last_name":last_name,
          "dob":dob,
          "nationality":nationality,
       "home_address":home_address,
          "permission_to_work_in_ireland":permission_to_work_in_ireland,
          "visa_type":visa_type,
          "phone_number":phone_number,
          "email":email,
          "pps_number":pps_number,
          "bank_bic":bank_bic,


        }));

    print(jsonEncode(<String, String>{
      "token":token,
      "first_name": first_name,
      "last_name":last_name,
      "dob":dob,
      "nationality":nationality,
      "home_address":home_address,
      "permission_to_work_in_ireland":permission_to_work_in_ireland,
      "visa_type":visa_type,
      "phone_number":phone_number,
      "email":email,
      "pps_number":pps_number,
      "bank_bic":bank_bic,


    }).toString());
    print(response.body);
    print(response.statusCode);
    print(response.toString());

    // if (response.statusCode == 200) {
    //   return LoginShift.fromJson(json.decode(response.body));
    //   return ;
    // } else {
    //   throw Exception('Failed to load post');
    // }
  }
}









// if (response.statusCode == 200) {
//   return SliftListRepso.fromJson(json.decode(response.body));
// } else {
//   throw Exception('Failed to load post');
// }


//
// Future<SliftListRepso> loginUser(String username, String password) async {
//   loginUsertst(username, password);
//   var uri = Uri.parse(BASE_URL + '/account/login');
//   final response = await client.get(uri);
//   print(response);
//   if (response.statusCode == 200) {
//     return SliftListRepso.fromJson(json.decode(response.body));
//   } else {
//     throw Exception('Failed to load post');
//   }
// // }

// •	Update Profile
// url :  https://intersmarthosting.in/DEV/ExpressHealth /api/account/update-profile
// method : POST
// parameters : token,first_name, last_name, dob, nationality, home_address, permission_to_work_in_ireland (1->Yes, 0-> No) , visa_type, phone_number,email, pps_number, bank_iban, bank_bic
//
// •	Get User Details
// url : https://intersmarthosting.in/DEV/ExpressHealth/api/account/get-user-info
// method : GET
// parameters : token
//
// •	Get Country list
// url : https://intersmarthosting.in/DEV/ExpressHealth/api/account/get-country-list
// method : GET
//
// •	Get gender list
// url : https://intersmarthosting.in/DEV/ExpressHealth/api/account/get-gender-list
// method : GET
//
// •	Get Locations
// url : https://intersmarthosting.in/DEV/ExpressHealth/api/account/get-location-list
// method : GET
//
// •	Get Visa Types
// url : https://intersmarthosting.in/DEV/ExpressHealth/api/account/get-visa-type
// method : GET
// •	Get User Types
// url : https://intersmarthosting.in/DEV/ExpressHealth/api/account/get-user-type
// method : GET
