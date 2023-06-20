import 'package:json_annotation/json_annotation.dart'; 

part 'provider_model.g.dart'; 

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class ProviderModel {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'image')
  String? image;

  ProviderModel({this.id, this.name, this.image});

   factory ProviderModel.fromJson(Map<String, dynamic> json) => _$ProviderModelFromJson(json);

   Map<String, dynamic> toJson() => _$ProviderModelToJson(this);
}

