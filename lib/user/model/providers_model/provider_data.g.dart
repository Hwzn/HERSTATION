// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProviderData _$ProviderDataFromJson(Map<String, dynamic> json) => ProviderData(
      categoryId: json['categoryId'] as String?,
      word: json['word'] as String?,
      order: json['order'] as String?,
      page: json['page'] as int?,
      refresh: json['refresh'] as String?,
    );

Map<String, dynamic> _$ProviderDataToJson(ProviderData instance) =>
    <String, dynamic>{
      'categoryId': instance.categoryId,
      'word': instance.word,
      'order': instance.order,
      'refresh': instance.refresh,
      'page': instance.page,
    };
