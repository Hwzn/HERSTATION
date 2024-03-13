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
  bool? selected;
  bool? open;

  RegionModel({this.id, this.name, this.cities,this.selected=false,this.open=false});

   factory RegionModel.fromJson(Map<String, dynamic> json) => _$RegionModelFromJson(json);

   Map<String, dynamic> toJson() => _$RegionModelToJson(this);
}

