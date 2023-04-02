import 'package:animated_shimmer/animated_shimmer.dart';
import 'package:bloc_api/bloc/product_bloc/product_event.dart';
import 'package:bloc_api/components/error_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/product_bloc/product_bloc.dart';
import '../bloc/product_bloc/product_state.dart';
import '../models/product_model.dart';

class ListProduct extends StatefulWidget {
  const ListProduct({super.key});

  @override
  State<ListProduct> createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductSuccessState) {
          return RefreshIndicator(
            onRefresh: () async =>
                context.read<ProductBloc>().add(ProductLoadEvent()),
            child: ListView.separated(
              controller: _scrollController
                ..addListener(() {
                  if (_scrollController.offset ==
                      _scrollController.position.maxScrollExtent) {
                    // context.read<ProductBloc>().add(LoadMoreEvent());
                    //  if (state is !ProductLoadingState) {
                    //     _scrollController.animateTo(
                    //     _scrollController.position.maxScrollExtent-100,
                    //     duration: Duration(seconds: 2),
                    //     curve: Curves.fastOutSlowIn,
                    //   );
                    //  }
            
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //     const SnackBar(content: Text('Fetching Data')));
                  }
                }),
              separatorBuilder: (context, index) => const SizedBox(
                height: 12,
              ),
              itemCount: state.product.length,
              itemBuilder: (_, i) {
                List<ProductModel> product = state.product;
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 16,),
                  padding: const EdgeInsets.all(16),
                  child: ListTile(
                    style: ListTileStyle.list,
                    title: Text(product[i].title.toString()),
                    subtitle: Text(product[i].category.toString()),
                    leading: Image.network(
                      product[i].thumbnail.toString(),
                      width: 72,
                      height: 72,
                      fit: BoxFit.cover,
                    ),
                    trailing: Text(product[i].price.toString()),
                  ),
                );
              },
            ),
          );
        }
        if (state is ProductErrorState) {
          return ErrorPage(
              message: state.err,
              action: () {
                context.read<ProductBloc>().add(ProductLoadEvent());
              });
        }
        return ListView.separated(
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  AnimatedShimmer.round(
                    size: 60,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AnimatedShimmer(
                        height: 10,
                        width: 120,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16)),
                        delayInMilliSeconds:
                            Duration(milliseconds: index * 500),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      AnimatedShimmer(
                        height: 10,
                        width: 180,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16)),
                        delayInMilliSeconds:
                            Duration(milliseconds: index * 500),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
          itemCount: 12,
          separatorBuilder: (context, index) => const SizedBox(
            height: 12,
          ),
        );
      },
    );
  }
}
