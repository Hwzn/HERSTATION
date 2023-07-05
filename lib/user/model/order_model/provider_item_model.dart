import 'package:json_annotation/json_annotation.dart'; 

part 'provider_item_model.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class ProviderItemModel {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'image')
  String? image;
  @JsonKey(name: 'contact_phone')
  String? contactPhone;
  @JsonKey(name: 'rate')
  int? rate;
  @JsonKey(name: 'rate_count')
  int? rateCount;

  ProviderItemModel({this.id, this.name, this.image, this.rate, this.rateCount,this.contactPhone});

   factory ProviderItemModel.fromJson(Map<String, dynamic> json) => _$ProviderItemModelFromJson(json);

   Map<String, dynamic> toJson() => _$ProviderItemModelToJson(this);
}

