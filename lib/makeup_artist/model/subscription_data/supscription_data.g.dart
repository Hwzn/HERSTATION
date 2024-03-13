// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supscription_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SupscriptionData _$SupscriptionDataFromJson(Map<String, dynamic> json) =>
    SupscriptionData(
      total: (json['total'] as num?)?.toDouble(),
      coupon_id: json['coupon_id'] as int?,
      discount: (json['discount'] as num?)?.toDouble(),
      subscriptionID: json['subscription_id'] as int?,
    );

Map<String, dynamic> _$SupscriptionDataToJson(SupscriptionData instance) =>
    <String, dynamic>{
      'coupon_id': instance.coupon_id,
      'discount': instance.discount,
      'total': instance.total,
      'subscription_id': instance.subscriptionID,
    };
