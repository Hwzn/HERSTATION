import 'package:json_annotation/json_annotation.dart'; 

part 'apply_coupon_model.g.dart'; 

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class ApplyCouponModel {
  @JsonKey(name: 'cost')
  String? cost;
  @JsonKey(name: 'coupon')
  String? coupon;

  ApplyCouponModel({this.cost, this.coupon});

   factory ApplyCouponModel.fromJson(Map<String, dynamic> json) => _$ApplyCouponModelFromJson(json);

   Map<String, dynamic> toJson() => _$ApplyCouponModelToJson(this);
}

