import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_clean_architecture_base_project/domain/entities.dart';
import 'package:flutter_bloc_clean_architecture_base_project/domain/use_cases.dart'
    show GetAllProductsUseCase;
import 'package:flutter_bloc_clean_architecture_base_project/utils/utils.dart';
// import 'package:rxdart/transformers.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetAllProductsUseCase _getAllProductsUseCase;

  ProductBloc(GetAllProductsUseCase getAllProductsUseCase) : _getAllProductsUseCase = getAllProductsUseCase,
        super(const ProductsInitialState()) {
     on<ProductLoadStarted>(loadProducts);
  }

  void loadProducts(ProductLoadStarted event, Emitter<ProductState> emit) async {
   final productData = await _getAllProductsUseCase.getAllProducts();
    
    if (productData.error != null) {
      emit(const ProductLoadFaliurState());
    } else {
      emit(ProducstLoadScuccessState(products: productData.data ?? []));
    }
  }
}


// EventTransformer<Event> debounceSequential<Event>(Duration duration) {
//   return (events, mapper) => events.debounceTime(duration).asyncExpand(mapper);
// }