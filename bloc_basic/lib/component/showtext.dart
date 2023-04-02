import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/text/play_bloc.dart';
import '../bloc/text/play_state.dart';

class ShowText extends StatelessWidget {
  const ShowText({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayBloc, PlayState>(
      builder: (context, state) {
        print('State Triggred');
        return Text(
          state.value,
          style: const TextStyle(fontSize: 64),
        );
      },
    );
  }
}
