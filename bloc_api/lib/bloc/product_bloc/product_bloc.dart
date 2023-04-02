import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/product_model.dart';
import '../../services/product_service.dart';
import 'product_event.dart';
import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepo;
  ProductBloc(this._productRepo) : super(ProductLoadingState()) {

    on<ProductLoadEvent>((event, emit) async {
      emit(ProductLoadingState());
      try {
        final product = await _productRepo.fetchProduct('100');
        emit(ProductSuccessState(product));
      } catch (e) {
        emit(ProductErrorState(e.toString()));
      }
     
    });

    on<LoadMoreEvent>((event, emit) async {
      emit(ProductLoadingState());
      try {
       
        
      } catch (e) {
        emit(ProductErrorState(e.toString()));
      }
    });
  }
}
