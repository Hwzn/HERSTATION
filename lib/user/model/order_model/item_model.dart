import 'package:hwzn_herstation/user/model/order_model/service_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'item_model.g.dart'; 

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class ItemModel {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'service')
  ServiceModel? service;
  @JsonKey(name: 'quantity')
  int? quantity;
  @JsonKey(name: 'retainer')
  int? retainer;
  @JsonKey(name: 'price')
  int? price;

  ItemModel({this.id, this.service, this.quantity, this.retainer, this.price});

   factory ItemModel.fromJson(Map<String, dynamic> json) => _$ItemModelFromJson(json);

   Map<String, dynamic> toJson() => _$ItemModelToJson(this);
}

