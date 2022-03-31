import 'package:rxdart/rxdart.dart';

import '../model/shift_list_response.dart';
import '../resources/respository.dart';

class ShiftCompletedBloc{
  final _repo = Repository();
  final _shiftComplete = PublishSubject<SliftListRepso>();
  Stream<SliftListRepso> get allShift => _shiftComplete.stream;
  fetchcomplete() async {
    SliftListRepso list = await _repo.fetchComplete();
    _shiftComplete.sink.add(list);
  }
  dispose() {
    _shiftComplete.close();
  }
}

final  completeBloc= ShiftCompletedBloc();
