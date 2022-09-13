// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:flutter_bloc_clean_architecture_base_project/domain/product/entities/product_entity.dart';
import 'rating_model.dart';

class ProductModel extends ProductEntity {
  const ProductModel(
      {required int id,
      required String title,
      required double price,
      required String description,
      required String category,
      required String image,
      required Rating rating})
      : super(
            id: id,
            title: title,
            price: price,
            description: description,
            category: category,
            image: image,
            rating: rating);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'image': image,
      'rating': {
        'rate' : rating.rate,
        'count' : rating.count
      }
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] as int,
      title: map['title'] as String,
      price: map['price'].toDouble(),
      description: map['description'] as String,
      category: map['category'] as String,
      image: map['image'] as String,
      rating: Rating.fromMap(map['rating'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(Map<String, dynamic> source) =>
      ProductModel.fromMap(source);

  static List<ProductModel> productFromJson(String str) {
    return List<ProductModel>.from(
        json.decode(str).map((x) => ProductModel.fromJson(x)));
  }

  ProductEntity toEntity() {
    return ProductEntity(
        id: id,
        title: title,
        price: price,
        description: description,
        category: category,
        image: image,
        rating: RatingEntity(rate: rating.rate, count: rating.count));
  }

  @override
  String toString() {
    return 'ProductModel(id: $id, title: $title, price: $price, description: $description, category: $category, image: $image, rating: $rating)';
  }
}
