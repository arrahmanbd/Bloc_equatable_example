import 'package:equatable/equatable.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();
}

class ProductLoadEvent extends ProductEvent {
  @override
  List<Object?> get props => [];
}

class LoadMoreEvent extends ProductEvent {
  @override
  List<Object?> get props => [];
}
