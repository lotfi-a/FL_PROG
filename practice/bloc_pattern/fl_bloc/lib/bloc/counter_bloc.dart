import 'dart:async';

import 'package:fl_bloc/bloc/bloc.dart';

class CounterBloc extends Bloc {
  int counter = 0;
  final StreamController<int> _streamController = StreamController<int>();
  Sink<int> get sink => _streamController.sink;
  Stream<int> get stream => _streamController.stream;

  void increment() {
    sink.add(counter += 1);
  }

  void decrement() {
    sink.add(counter -= 1);
  }

  CounterBloc() {
    sink.add(counter);
  }

  @override
  void dispose() {
    _streamController.close();
  }
}
