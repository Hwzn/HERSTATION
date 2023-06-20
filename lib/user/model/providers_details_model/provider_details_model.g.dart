// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProviderDetailsModel _$ProviderDetailsModelFromJson(
        Map<String, dynamic> json) =>
    ProviderDetailsModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      gallery: (json['gallery'] as List<dynamic>?)
          ?.map((e) => GalleryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      instructions: json['instructions'] as String?,
      rates: (json['rates'] as List<dynamic>?)
          ?.map((e) => RateModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      rate: json['rate'] as String?,
      rateCount: json['rate_count'] as int?,
      ratesAvg: (json['rates_avg'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ProviderDetailsModelToJson(
        ProviderDetailsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'gallery': instance.gallery,
      'instructions': instance.instructions,
      'rates': instance.rates,
      'rate': instance.rate,
      'rate_count': instance.rateCount,
      'rates_avg': instance.ratesAvg,
    };
