import 'package:json_annotation/json_annotation.dart'; 

part 'city_model.g.dart'; 

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class CityModel {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  bool?selected;

  CityModel({this.id, this.name,this.selected=false});

   factory CityModel.fromJson(Map<String, dynamic> json) => _$CityModelFromJson(json);

   Map<String, dynamic> toJson() => _$CityModelToJson(this);
}

