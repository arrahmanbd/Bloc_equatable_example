import 'package:block_equtable/bloc/text/play_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/counter/counter_bloc.dart';
import 'screen/counter_page.dart';
import 'screen/home_page.dart';

void main() {
  runApp(const MyApp());
}

//Equatable are used not to trigger same state change
//Try them printing onsubmit & show text

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: CounterPage(),
      ),
    );
  }
}
