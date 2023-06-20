// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rate_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RateData _$RateDataFromJson(Map<String, dynamic> json) => RateData(
      rate: json['rate'] as int?,
      comment: json['comment'] as String?,
      providerId: json['provider_id'] as int?,
    );

Map<String, dynamic> _$RateDataToJson(RateData instance) => <String, dynamic>{
      'rate': instance.rate,
      'comment': instance.comment,
      'provider_id': instance.providerId,
    };
