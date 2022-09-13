// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final RatingEntity rating;

  const ProductEntity({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  @override
  List<Object> get props {
    return [
      id,
      title,
      price,
      description,
      category,
      image,
      rating,
    ];
  }

  ProductEntity copyWith({
    int? id,
    String? title,
    double? price,
    String? description,
    String? category,
    String? image,
    RatingEntity? rating,
  }) {
    return ProductEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      description: description ?? this.description,
      category: category ?? this.category,
      image: image ?? this.image,
      rating: rating ?? this.rating,
    );
  }
}

class RatingEntity extends Equatable {
  final double? rate;
  final int? count;
  const RatingEntity({
    this.rate,
    this.count,
  });

  @override
  List<Object> get props => [rate ?? 0.0, count ?? 0];

  RatingEntity copyWith({
    double? rate,
    int? count,
  }) {
    return RatingEntity(
      rate: rate ?? this.rate,
      count: count ?? this.count,
    );
  }
}
