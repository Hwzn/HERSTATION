// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apply_coupon_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplyCouponData _$ApplyCouponDataFromJson(Map<String, dynamic> json) =>
    ApplyCouponData(
      couponId: json['coupon_id'] as int?,
      totalCost: json['total_cost'] as num?,
      couponDiscount: json['coupon_discount'] as num?,
    );

Map<String, dynamic> _$ApplyCouponDataToJson(ApplyCouponData instance) =>
    <String, dynamic>{
      'coupon_id': instance.couponId,
      'total_cost': instance.totalCost,
      'coupon_discount': instance.couponDiscount,
    };
