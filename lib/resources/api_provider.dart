import 'dart:convert';
import 'package:http/http.dart';
import '../model/shift_list_response.dart';
//ref https://medium.com/codechai/architecting-your-flutter-project-bd04e144a8f1

class ApiProvider {
  Client client = Client();

  Future<SliftListRepso> fetchShiftList(String date) async {
    print("date");
    print(date);
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
}
