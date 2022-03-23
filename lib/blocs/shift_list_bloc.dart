
import 'package:rxdart/rxdart.dart';
import 'package:xpresshealthdev/resources/respository.dart';

import '../model/shift_list_response.dart';

class ShiftListBloc {
  final _repo = Repository();
  final _shiftList = PublishSubject<SliftListRepso>();
  Stream<SliftListRepso> get allShift => _shiftList.stream;
  fetchAllList(String date) async {
    SliftListRepso list = await _repo.fetchAllShift(date);
    _shiftList.sink.add(list);
  }
  dispose() {
    _shiftList.close();
  }
}

final bloc = ShiftListBloc();
