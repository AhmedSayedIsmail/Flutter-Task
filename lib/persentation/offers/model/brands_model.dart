import 'package:json_annotation/json_annotation.dart';
part 'brands_model.g.dart';

@JsonSerializable()
class BrandsModel {
  final int id;
  final String? name;
  final String? image;
  BrandsModel({required this.id, required this.name,this.image,});
  factory BrandsModel.fromJson(Map<String, dynamic> json) =>
      _$BrandsModelFromJson(json);
  Map<String, dynamic> toJson() => _$BrandsModelToJson(this);
}
