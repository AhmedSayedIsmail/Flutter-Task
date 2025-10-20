import 'package:json_annotation/json_annotation.dart';
part 'offer_model.g.dart';
@JsonSerializable()
class OfferModel {
  @JsonKey(name: 'offer_id')
  final int? id;

  @JsonKey(name: 'offer_title')
  final String? title;

  @JsonKey(name: 'offer_description')
  final String? description;

  @JsonKey(name: 'discount_percent')
  final double? discountPercent;

  @JsonKey(name: 'start_date')
  final String? startDate;

  @JsonKey(name: 'end_date')
  final String? endDate;

  OfferModel({
    this.id,
    this.title,
    this.description,
    this.discountPercent,
    this.startDate,
    this.endDate,
  });

  factory OfferModel.fromJson(Map<String, dynamic> json) =>
      _$OfferModelFromJson(json);

  Map<String, dynamic> toJson() => _$OfferModelToJson(this);
}
