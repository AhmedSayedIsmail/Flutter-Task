// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OfferModel _$OfferModelFromJson(Map<String, dynamic> json) => OfferModel(
  id: (json['offer_id'] as num?)?.toInt(),
  title: json['offer_title'] as String?,
  description: json['offer_description'] as String?,
  discountPercent: (json['discount_percent'] as num?)?.toDouble(),
  startDate: json['start_date'] as String?,
  endDate: json['end_date'] as String?,
);

Map<String, dynamic> _$OfferModelToJson(OfferModel instance) =>
    <String, dynamic>{
      'offer_id': instance.id,
      'offer_title': instance.title,
      'offer_description': instance.description,
      'discount_percent': instance.discountPercent,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
    };
