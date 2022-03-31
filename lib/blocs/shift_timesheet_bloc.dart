import 'package:rxdart/rxdart.dart';

import '../model/shift_list_response.dart';
import '../resources/respository.dart';

class ShiftTimeSheetBloc{
  final _repo = Repository();
  final _shiftimeSheet = PublishSubject<SliftListRepso>();
  Stream<SliftListRepso> get allShift => _shiftimeSheet.stream;
  fetchTimesheet() async {
    SliftListRepso list = await _repo.fetchTimesheet();
    _shiftimeSheet.sink.add(list);
  }
  dispose() {
    _shiftimeSheet.close();
  }
}

final  timesheetBloc= ShiftTimeSheetBloc();
