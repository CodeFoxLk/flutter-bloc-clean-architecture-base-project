import 'package:dio/dio.dart';
import 'package:flutter_bloc_clean_architecture_base_project/data/product/models/product_model.dart';
import 'package:flutter_bloc_clean_architecture_base_project/core/network/network.dart';
import 'package:flutter_bloc_clean_architecture_base_project/core/network/server_exception.dart';
import 'package:flutter_bloc_clean_architecture_base_project/utils/logger.dart';

abstract class ProductRemoteDataSource {
  const ProductRemoteDataSource();
  Future<List<ProductModel>> getAllProducts();
}

class ProductRemoteDataSourceImp extends ProductRemoteDataSource {
  const ProductRemoteDataSourceImp();

  @override
  Future<List<ProductModel>> getAllProducts({String endPoint = allProductsEndPoint}) async {
    var response = await Dio().get<String>(endPoint, options: Options(responseType: ResponseType.json));
    if (response.statusCode == StatusCode.OK) {
      final products = ProductModel.productFromJson(response.data ?? '[]');
      AppLoger.logInfo(products.length);
      return products;
    } else {
      throw ServerException(message: '', statusCode: response.statusCode, url: endPoint);
    }
  }
}
