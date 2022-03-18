import 'dart:convert';

import 'package:http/http.dart';

import '../model/shift_list_response.dart';
//ref https://medium.com/codechai/architecting-your-flutter-project-bd04e144a8f1

class ApiProvider {
  Client client = Client();


  String BASE_URL = "https://intersmarthosting.in/DEV/ExpressHealth/api";

  Future<SliftListRepso> fetchShiftList(String date) async {
    print("date");
    print(date);
    var uri = Uri.parse(BASE_URL + '/categories.asmx/fillCategories');
    final response = await client.get(uri);
    print(response);
    if (response.statusCode == 200) {
      return SliftListRepso.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }


  // •	Login API
  // url : https://intersmarthosting.in/DEV/ExpressHealth/api/account/login
  // method : POST
  // parametters : email(email/phone number),password
  //
  // Login Credentials ( email : manu@intersmart.in , password : inter123 )


  Future<SliftListRepso> loginUser(String username, String password) async {
    var uri = Uri.parse(BASE_URL + '/account/login');
    final response = await client.get(uri);
    print(response);
    if (response.statusCode == 200) {
      return SliftListRepso.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }

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




}
