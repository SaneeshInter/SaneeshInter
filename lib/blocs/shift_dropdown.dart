import 'package:rxdart/rxdart.dart';

class PersonBloc{

List<String> names = ['Male','Female'];

final _name = BehaviorSubject<String>.seeded("");
Stream<String> get outName  => _name.stream;
Function(String) get inName => _name.sink.add;
//TODO - Don't forget to dispose this _name


  dispose() {
    _name.close();
  }
}

final   dropdownBloc= PersonBloc();