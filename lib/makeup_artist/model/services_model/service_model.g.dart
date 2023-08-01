// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceModel _$ServiceModelFromJson(Map<String, dynamic> json) => ServiceModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      price: json['price'] as num?,
      retainer: json['retainer'] as num?,
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ServiceModelToJson(ServiceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'retainer': instance.retainer,
      'category': instance.category,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      id: json['id'] as int?,
      name: json['name'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };
