import 'package:flutter_bloc_clean_architecture_base_project/domain/product/entities/product_entity.dart';
import 'package:flutter_bloc_clean_architecture_base_project/utils/data_status.dart';

abstract class ProductRepository{
  const ProductRepository();
  Future<DataState<List<ProductEntity>>> getAllProducts(); 
}
