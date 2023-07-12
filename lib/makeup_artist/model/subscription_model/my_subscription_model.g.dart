// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_subscription_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MySubscriptionModel _$MySubscriptionModelFromJson(Map<String, dynamic> json) =>
    MySubscriptionModel(
      id: json['id'] as int?,
      subscription: json['subscription'] == null
          ? null
          : SubscriptionModel.fromJson(
              json['subscription'] as Map<String, dynamic>),
      startDate: json['start_date'] as String?,
      expireDate: json['expire_date'] as String?,
      status: json['status'] as String?,
      remaining: json['remaining'] as int?,
    );

Map<String, dynamic> _$MySubscriptionModelToJson(
        MySubscriptionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'subscription': instance.subscription,
      'start_date': instance.startDate,
      'expire_date': instance.expireDate,
      'status': instance.status,
      'remaining': instance.remaining,
    };
