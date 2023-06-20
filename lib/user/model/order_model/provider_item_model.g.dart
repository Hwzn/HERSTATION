// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProviderItemModel _$ProviderItemModelFromJson(Map<String, dynamic> json) =>
    ProviderItemModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      image: json['image'] as String?,
      contactPhone: json['contact_phone'] as String?,
    );

Map<String, dynamic> _$ProviderItemModelToJson(ProviderItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'contact_phone': instance.contactPhone,
    };
