import 'package:json_annotation/json_annotation.dart';
part 'categories_model.g.dart';
@JsonSerializable()
class CategoriesModel {
   final int id;
  final String? name;
  CategoriesModel({required this.id, required this.name});
  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      _$CategoriesModelFromJson(json);
  Map<String, dynamic> toJson() => _$CategoriesModelToJson(this);

}