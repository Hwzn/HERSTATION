import 'package:json_annotation/json_annotation.dart'; 

part 'service_model.g.dart'; 

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class ServiceModel {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'price')
  num? price;
  @JsonKey(name: 'retainer')
  num? retainer;
  @JsonKey(name: 'category')
  Category? category;

  ServiceModel({this.id, this.name, this.price, this.retainer, this.category});

   factory ServiceModel.fromJson(Map<String, dynamic> json) => _$ServiceModelFromJson(json);

   Map<String, dynamic> toJson() => _$ServiceModelToJson(this);
}

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class Category {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'image')
  String? image;

  Category({this.id, this.name, this.image});

   factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

   Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

