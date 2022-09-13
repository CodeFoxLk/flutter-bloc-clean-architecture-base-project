part of 'products_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductsInitialState extends ProductState {
  const ProductsInitialState();
}

class ProductsLoadingState extends ProductState {
  const ProductsLoadingState();
}

class ProductLoadFaliurState extends ProductState {
  const ProductLoadFaliurState();
}

class ProducstLoadScuccessState extends ProductState {
  final List<ProductEntity> products;
  const ProducstLoadScuccessState({required this.products});

  @override
  List<Object> get props => [products];
}
