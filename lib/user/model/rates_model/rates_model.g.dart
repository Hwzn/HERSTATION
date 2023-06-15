// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rates_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RatesModel _$RatesModelFromJson(Map<String, dynamic> json) => RatesModel(
      rate: json['rate'] as String?,
      rateCount: json['rate_count'] as int?,
      commentCount: json['comment_count'] as int?,
      rates: (json['rates'] as List<dynamic>?)
          ?.map((e) => RateModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RatesModelToJson(RatesModel instance) =>
    <String, dynamic>{
      'rate': instance.rate,
      'rate_count': instance.rateCount,
      'comment_count': instance.commentCount,
      'rates': instance.rates,
    };
