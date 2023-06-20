import 'package:json_annotation/json_annotation.dart';

part 'dropdown_model.g.dart'; 

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class DropdownModel {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;

  DropdownModel({this.id, this.name});

   factory DropdownModel.fromJson(Map<String, dynamic> json) => _$DropdownModelFromJson(json);

   Map<String, dynamic> toJson() => _$DropdownModelToJson(this);
}

