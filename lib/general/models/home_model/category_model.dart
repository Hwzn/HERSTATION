import 'package:hwzn_herstation/general/models/home_model/service_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart'; 

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class CategoryModel {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'image')
  String? image;
  @JsonKey(name: 'services')
  List<ServiceModel>? services;

  CategoryModel({this.id, this.name, this.image, this.services});

   factory CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);

   Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}

