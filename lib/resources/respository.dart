import 'package:http/http.dart';
import 'package:xpresshealthdev/resources/api_provider.dart';

import '../model/shift_list_response.dart';

class Repository {
  final apiProvider = ApiProvider();




  Future<SliftListRepso> fetchAllShift(String date) => apiProvider.fetchShiftList(date);
}
