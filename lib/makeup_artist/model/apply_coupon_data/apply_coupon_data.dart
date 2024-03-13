import 'package:json_annotation/json_annotation.dart'; 

part 'apply_coupon_data.g.dart'; 

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class ApplyCouponData {
  @JsonKey(name: 'coupon_id')
  int? couponId;
  @JsonKey(name: 'total_cost')
  num? totalCost;
  @JsonKey(name: 'coupon_discount')
  num? couponDiscount;

  ApplyCouponData({this.couponId, this.totalCost, this.couponDiscount});

   factory ApplyCouponData.fromJson(Map<String, dynamic> json) => _$ApplyCouponDataFromJson(json);

   Map<String, dynamic> toJson() => _$ApplyCouponDataToJson(this);
}

