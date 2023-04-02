import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_event.dart';
import 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(InitialState()) {
    on<Incriment>((event, emit) {
      final int num = state.number;
     
      emit(CounterState(number: state.number + 1));
      if (num == 5) {
        print('Number is 5');
      }
    });
    on<Decriment>((event, emit) {
      emit(CounterState(number: state.number - 1));
    });
  }
}
