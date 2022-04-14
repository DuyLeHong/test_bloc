import 'dart:async';

import 'package:test_bloc/home_event.dart';
import 'package:test_bloc/home_state.dart';

class HomeBloc {
  final _homeState = HomeState();

  HomeBloc() {
    _countStreamEvent.listen((event) {
      if (event is IncreaseEvent) {
        _homeState.count++;
        _countStateStreamController.sink.add(_homeState.count);
      } else {
        _homeState.count--;
        _countStateStreamController.sink.add(_homeState.count);
      }
    });
  }

  final _countEventStreamController = StreamController<CountEvent>();

  Stream<CountEvent> get _countStreamEvent =>
      _countEventStreamController.stream;

  Sink<CountEvent> get countSinkEvent => _countEventStreamController.sink;

  final _countStateStreamController = StreamController<int>();

  Stream<int> get count => _countStateStreamController.stream;
}
