import 'package:rxdart/rxdart.dart';

import '../model/user_add_availability.dart';
import '../resources/respository.dart';

class UserAvailiability{
  final _repo = Repository();
  final _useravailability = PublishSubject<AddUserAvailabilityResponse>();

  Stream<AddUserAvailabilityResponse> get useravailabilitiy => _useravailability.stream;

  addUserAvailability(String token, String date,String availability) async {

    print("TOKEN");
    print("DATE");
    print("AVAILABILITY");

    print(token);
    print(date);
    print(availability);
    AddUserAvailabilityResponse list = await _repo.addUserAvailability(token,  date, availability);
    _useravailability.sink.add(list);
  }

  dispose() {
    _useravailability.close();
  }
}

final availabilitybloc= UserAvailiability();
