import 'dart:async';

import 'package:block_equtable/bloc/text/play_event.dart';
import 'package:block_equtable/bloc/text/play_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlayBloc extends Bloc<PlayEvet, PlayState> {
  PlayBloc() : super(PlayState('')) {
    on<PlayAction>(_playAction);
  }

  FutureOr<void> _playAction(
    PlayAction event,
    Emitter<PlayState> emit,
  ) {
    final value = event.value;
    emit(PlayState(value));
  }
}
