import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/counter/counter_bloc.dart';
import '../bloc/counter/counter_event.dart';
import '../component/countertext.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CounterText(),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                context.read<CounterBloc>().add(Decriment());
              },
              child: const Icon(Icons.exposure_minus_1),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            context.read<CounterBloc>().add(Incriment());
            print('event triggered');
          }),
    );
  }
}
