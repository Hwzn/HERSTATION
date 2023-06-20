import 'package:hwzn_herstation/user/model/order_model/provider_item_model.dart';
import 'package:json_annotation/json_annotation.dart';

import '../region_model/city_model.dart';
import 'item_model.dart';

part 'order_model.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class OrderModel {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'order_num')
  String? orderNum;
  @JsonKey(name: 'items')
  List<ItemModel>? items;
  @JsonKey(name: 'provider')
  ProviderItemModel? provider;
  @JsonKey(name: 'date')
  String? date;
  @JsonKey(name: 'payment_method')
  String? paymentMethod;
  @JsonKey(name: 'payment_status')
  String? paymentStatus;
  @JsonKey(name: 'status')
  String? status;
  @JsonKey(name: 'retainer')
  double? retainer;
  @JsonKey(name: 'paid_amount')
  double? paidAmount;
  @JsonKey(name: 'reserved')
  double? reserved;
  @JsonKey(name: 'total')
  double? total;
  @JsonKey(name: 'region')
  CityModel? region;
  @JsonKey(name: 'city')
  CityModel? city;

  OrderModel(
      {this.id,
      this.orderNum,
      this.items,
      this.provider,
      this.date,
      this.paymentMethod,
      this.paymentStatus,
      this.status,
      this.retainer,
      this.paidAmount,
      this.reserved,
      this.region,
      this.city,
      this.total});

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderModelToJson(this);
}
