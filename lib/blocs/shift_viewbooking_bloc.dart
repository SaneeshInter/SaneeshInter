import 'package:rxdart/rxdart.dart';

import '../model/shift_list_response.dart';
import '../model/viewbooking_response.dart';
import '../resources/respository.dart';

class ShiftViewBookingBloc{
  final _repo = Repository();
  final _shiftViewBooking = PublishSubject<ManagerScheduleListResponse>();
  Stream<ManagerScheduleListResponse> get allShift=> _shiftViewBooking.stream;
  fetchViewbooking(String token,String date) async {



    ManagerScheduleListResponse list = await _repo.fetchViewbooking(token,date);





    _shiftViewBooking.sink.add(list);
  }
  dispose() {
    _shiftViewBooking.close();
  }
}

final  viewbookingBloc= ShiftViewBookingBloc();
