import 'package:bloc_api/models/product_model.dart';
import 'package:equatable/equatable.dart';


abstract class ProductState extends Equatable {}

//Iitializing as Loading
class ProductLoadingState extends ProductState {
  @override
  List<Object?> get props => [];
}

//When data
class ProductSuccessState extends ProductState {
  final List<ProductModel> product;

  ProductSuccessState(this.product);
  @override
  List<Object?> get props => [product];
}

//When Error
class ProductErrorState extends ProductState {
  final String err;
  ProductErrorState(this.err);
  @override
  List<Object?> get props => [err];
}

class LoadMoreState extends ProductState {
  final List<ProductModel> product;

  LoadMoreState(this.product);
  @override
  List<Object?> get props => [product];
}