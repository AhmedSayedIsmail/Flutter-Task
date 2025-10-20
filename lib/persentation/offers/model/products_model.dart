import 'package:flutter_task/persentation/offers/model/offer_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'products_model.g.dart';

@JsonSerializable()
class ProductsModel {
  @JsonKey(name: 'product_id')
  final int id;

  @JsonKey(name: 'product_name')
  final String? name;

  @JsonKey(name: 'original_price')
  final double? price;

  final String? image;

  @JsonKey(name: 'category_id')
  final int? categoryId;
  @JsonKey(name: 'offer_id')
  final OfferModel? offer;
  ProductsModel({
    required this.id,
    this.name,
    this.price,
    this.image,
    this.categoryId,
    this.offer,
  });
  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    final offer = json['offer_id'] != null
        ? OfferModel.fromJson({
            'offer_id': json['offer_id'],
            'offer_title': json['offer_title'],
            'offer_description': json['offer_description'],
            'discount_percent': json['discount_percent'],
            'start_date': json['start_date'],
            'end_date': json['end_date'],
          })
        : null;
    return ProductsModel(
      id: json['product_id'],
      name: json['product_name'],
      price: (json['original_price'] as num?)?.toDouble(),
      image: json['image'],
      categoryId: json['category_id'],
      offer: offer,
    );
  }
  Map<String, dynamic> toJson() => _$ProductsModelToJson(this);
}
