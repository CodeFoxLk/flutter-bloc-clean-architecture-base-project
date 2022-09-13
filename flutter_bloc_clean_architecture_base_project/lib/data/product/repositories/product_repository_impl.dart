import 'dart:io';
import 'package:flutter_bloc_clean_architecture_base_project/core/network/server_exception.dart';

import 'package:flutter_bloc_clean_architecture_base_project/data/product/data_sources/product_remote_data_source.dart';
import 'package:flutter_bloc_clean_architecture_base_project/domain/product/entities/product_entity.dart';
import 'package:flutter_bloc_clean_architecture_base_project/domain/product/repositories/product_repository.dart';
import 'package:flutter_bloc_clean_architecture_base_project/utils/data_status.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource productRemoteDataSource;

  const ProductRepositoryImpl({required this.productRemoteDataSource});

  @override
  Future<DataState<List<ProductEntity>>> getAllProducts() async {
    try {
      final productmodels = await productRemoteDataSource.getAllProducts();
      final products = List<ProductEntity>.from(productmodels.map((e) => e.toEntity()));
      return DataSuccess(products);
    } on ServerException catch (exp) {
      return DataFailed(exp);
    } on SocketException catch (exp) {
      return DataFailed(exp);
    } catch (e) {
      return DataFailed(Exception());
    }
  }
}
