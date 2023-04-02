import 'package:block_equtable/bloc/text/play_bloc.dart';
import 'package:block_equtable/bloc/text/play_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../component/showtext.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Equatale Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(children: [
          TextField(
            onSubmitted: (value) {
              print('Event Triggred');
              final event = PlayAction(value);
              context.read<PlayBloc>().add(event);
            },
          ),
          const SizedBox(height: 45,),
          const ShowText()
        ]),
      ),
    );
  }
}
