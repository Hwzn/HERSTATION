import 'package:json_annotation/json_annotation.dart';

import 'city_model.dart';

part 'region_model.g.dart'; 

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class RegionModel {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'cities')
  List<CityModel>? cities;

  RegionModel({this.id, this.name, this.cities});

   factory RegionModel.fromJson(Map<String, dynamic> json) => _$RegionModelFromJson(json);

   Map<String, dynamic> toJson() => _$RegionModelToJson(this);
}

