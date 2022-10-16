
import 'package:flutter_bloc_clean_architecture_base_project/domain/product/entities/product_entity.dart';
import 'package:flutter_bloc_clean_architecture_base_project/domain/product/repositories/product_repository.dart';
import 'package:flutter_bloc_clean_architecture_base_project/utils/data_status.dart';

class GetAllProductsUseCase{
  final ProductRepository _productRepository;
  const GetAllProductsUseCase({required ProductRepository productRepository}) : _productRepository = productRepository;

  Future<DataState<List<ProductEntity>>> getAllProducts(){
    return _productRepository.getAllProducts();
  }
}