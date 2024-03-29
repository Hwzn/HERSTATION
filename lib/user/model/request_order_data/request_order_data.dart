import 'dart:convert';

import 'package:hwzn_herstation/user/model/request_order_data/service_item_model.dart';
import 'package:json_annotation/json_annotation.dart';
//
// part 'request_order_data.g.dart';
//
// @JsonSerializable(nullable: false, ignoreUnannotated: false)
class RequestOrderData {
  @JsonKey(name: 'date')
  String? date;
  @JsonKey(name: 'provider_id')
  int? providerId;
  @JsonKey(name: 'category_id')
  int? categoryId;
  @JsonKey(name: 'region_id')
  int? regionId;
  @JsonKey(name: 'city_id')
  int? cityId;
  @JsonKey(name: 'address')
  String? address;
  @JsonKey(name: 'services')
  // List<ServiceItemModel>?
  List<Map<String, dynamic>>? services;

  RequestOrderData(
      {this.date,
      this.providerId,
      this.categoryId,
      this.regionId,
      this.cityId,
      this.address,
      this.services});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "date": date,
      "provider_id": providerId,
      "category_id": categoryId,
      "region_id": regionId,
      "city_id": cityId,
      "address": address,
      "services": json.encode(services),
    };
    map.removeWhere((key, value) => value == null);
    return map;
  }
}
