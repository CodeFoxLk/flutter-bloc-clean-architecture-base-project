import 'dart:convert';

import 'package:flutter_bloc_clean_architecture_base_project/domain/entities.dart';

class Rating extends RatingEntity{
  
  const Rating({
    required double rate,
    required int? count,
  });

  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'rate': rate,
      'count': count,
    };
  }

  factory Rating.fromMap(Map<String, dynamic> map) {
    return Rating(
      rate: map['rate'] != null ? map['rate'].toDouble() : 0.0,
      count: map['count'] != null ? map['count'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Rating.fromJson(String source) =>
      Rating.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Rating(rate: $rate, count: $count)';
}
