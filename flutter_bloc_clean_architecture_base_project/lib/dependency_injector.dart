import 'package:flutter_bloc_clean_architecture_base_project/data/product/data_sources/product_remote_data_source.dart';
import 'package:flutter_bloc_clean_architecture_base_project/data/product/repositories/product_repository_impl.dart';
import 'package:flutter_bloc_clean_architecture_base_project/domain/product/repositories/product_repository.dart';
import 'package:flutter_bloc_clean_architecture_base_project/domain/product/usecases/get_all_products_uc.dart';
import 'package:flutter_bloc_clean_architecture_base_project/presentations/blocs/products/products_bloc.dart';
import 'package:get_it/get_it.dart';

GetIt injector = GetIt.instance;

void initializeDependencies() {
  injector.registerLazySingleton<ProductRemoteDataSource>(() => const ProductRemoteDataSourceImp());
  injector.registerLazySingleton<ProductRepository>(() => ProductRepositoryImpl(productRemoteDataSource: injector()));
  injector.registerLazySingleton<GetAllProductsUseCase>(() => GetAllProductsUseCase(productRepository : injector()));
  injector.registerFactory<ProductBloc>(() => ProductBloc(injector()));
}
