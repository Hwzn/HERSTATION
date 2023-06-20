// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProviderModel _$ProviderModelFromJson(Map<String, dynamic> json) =>
    ProviderModel(
      id: json['id"'] as int?,
      image: json['image'] as String?,
      walletBalance: json['wallet_balance'] as String?,
      instructions: json['instructions'] as String?,
      contactPhone: json['contact_phone'] as String?,
      rate: (json['rate'] as num?)?.toDouble(),
      rateCount: json['rate_count'] as int?,
      ratesAvg: json['rates_avg'] as int?,
      isApproved: json['is_approved'] as int?,
    );

Map<String, dynamic> _$ProviderModelToJson(ProviderModel instance) =>
    <String, dynamic>{
      'id"': instance.id,
      'image': instance.image,
      'wallet_balance': instance.walletBalance,
      'instructions': instance.instructions,
      'rate': instance.rate,
      'rate_count': instance.rateCount,
      'rates_avg': instance.ratesAvg,
      'is_approved': instance.isApproved,
      'contact_phone': instance.contactPhone,
    };
