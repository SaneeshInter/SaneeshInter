import 'package:rxdart/rxdart.dart';

import '../model/shift_list_response.dart';
import '../resources/respository.dart';

class ShiftConfirmedBloc{
  final _repo = Repository();
  final _shiftConfirm = PublishSubject<SliftListRepso>();
  Stream<SliftListRepso> get allShift => _shiftConfirm.stream;
  fetchConfirm() async {
    SliftListRepso list = await _repo.fetchConfirm();
    _shiftConfirm.sink.add(list);
  }
  dispose() {
    _shiftConfirm.close();
  }
}

final  confirmBloc= ShiftConfirmedBloc();
