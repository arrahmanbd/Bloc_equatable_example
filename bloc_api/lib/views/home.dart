import 'package:bloc_api/services/product_service.dart';
import 'package:bloc_api/views/product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/product_bloc/product_bloc.dart';
import '../bloc/product_bloc/product_event.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc(
        RepositoryProvider.of<ProductRepository>(context)
      )..add(ProductLoadEvent()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Fetch Product'),elevation: 0,),
        body: const ListProduct(),
      ),
    );
  }
}
