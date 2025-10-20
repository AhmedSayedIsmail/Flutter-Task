import 'package:json_annotation/json_annotation.dart';
part 'rooms_model.g.dart';
@JsonSerializable()
class RoomsModel {
   final int id;
  final String? name;
  RoomsModel({required this.id, required this.name});
  factory RoomsModel.fromJson(Map<String, dynamic> json) =>
      _$RoomsModelFromJson(json);
  Map<String, dynamic> toJson() => _$RoomsModelToJson(this);

}