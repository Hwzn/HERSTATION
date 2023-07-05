import 'package:json_annotation/json_annotation.dart'; 

part 'service_item_model.g.dart'; 

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class ServiceItemModel {
  @JsonKey(name: 'service_id')
  int? serviceId;
  @JsonKey(name: 'quantity')
  int? quantity;

  ServiceItemModel({this.serviceId, this.quantity});

   factory ServiceItemModel.fromJson(Map<String, dynamic> json) => _$ServiceItemModelFromJson(json);

   Map<String, dynamic> toJson() => _$ServiceItemModelToJson(this);
}

