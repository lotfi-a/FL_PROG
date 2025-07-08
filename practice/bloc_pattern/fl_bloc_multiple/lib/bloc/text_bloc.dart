import 'dart:async';

import 'package:fl_bloc_multiple/bloc/bloc.dart';

class TextBloc extends Bloc {
  final StreamController<String> _streamController = StreamController<String>();

  Sink<String> get sink => _streamController.sink;
  Stream<String> get stream => _streamController.stream;

  void mutate(String value) {
    sink.add(value);
  }

  TextBloc() {
    sink.add("");
  }

  @override
  void dispose() {
    _streamController.close();
  }
}
