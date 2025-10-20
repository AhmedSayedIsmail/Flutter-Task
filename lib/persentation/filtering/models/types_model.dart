import 'package:json_annotation/json_annotation.dart';
part 'types_model.g.dart';
@JsonSerializable()
class TypesModel {
   final int id;
  final String? name;
  TypesModel({required this.id, required this.name});
  factory TypesModel.fromJson(Map<String, dynamic> json) =>
      _$TypesModelFromJson(json);
  Map<String, dynamic> toJson() => _$TypesModelToJson(this);

}