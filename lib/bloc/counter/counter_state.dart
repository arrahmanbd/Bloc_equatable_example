import 'package:equatable/equatable.dart';

class CounterState extends Equatable {
  int number;
  CounterState({required this.number});

  @override
  List<Object?> get props => [number];
}

class InitialState extends CounterState {
  InitialState() : super(number:0);
}
