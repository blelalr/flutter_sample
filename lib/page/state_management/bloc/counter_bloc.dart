import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0);

  @override
  Stream<int> mapEventToState(
    CounterEvent event,
  ) async* {
    if(event is IncrementEvent) {
      yield state + 1;
    } else if(event is DecrementEvent) {
      yield state - 1;
    }
  }
}
