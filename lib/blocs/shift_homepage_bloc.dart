import 'package:rxdart/rxdart.dart';

import '../model/shift_list_response.dart';
import '../resources/respository.dart';

class ShiftHomepageBloc{
  final _repo = Repository();
  final _shifthomepage= PublishSubject<SliftListRepso>();
  Stream<SliftListRepso> get allShift => _shifthomepage.stream;
  fetchHomepage() async {
    SliftListRepso list = await _repo.fetchHomepage();
    _shifthomepage.sink.add(list);
  }
  dispose() {
    _shifthomepage.close();
  }
}

final  homepageBloc= ShiftHomepageBloc();
