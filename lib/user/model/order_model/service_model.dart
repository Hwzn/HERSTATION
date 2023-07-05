import 'package:json_annotation/json_annotation.dart'; 

part 'service_model.g.dart'; 

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class ServiceModel {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'price')
  int? price;
  @JsonKey(name: 'retainer')
  int? retainer;

  ServiceModel({this.id, this.name, this.price, this.retainer});

   factory ServiceModel.fromJson(Map<String, dynamic> json) => _$ServiceModelFromJson(json);

   Map<String, dynamic> toJson() => _$ServiceModelToJson(this);
}

