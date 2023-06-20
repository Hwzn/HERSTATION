// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceModel _$ServiceModelFromJson(Map<String, dynamic> json) => ServiceModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      categoryId: json['category_id'] as int?,
      price: (json['price'] as num?)?.toDouble(),
      retainer: (json['retainer'] as num?)?.toDouble(),
      selected: json['selected'] as bool? ?? false,
      attachmentsNumber: json['attachmentsNumber'] as int? ?? 0,
      isBride: json['isBride'] as bool?,
      bridemadesID: json['bridemadesID'] as int?,
      bridemadesPrice: (json['bridemadesPrice'] as num?)?.toDouble(),
      bridemadesRetainer: (json['bridemadesRetainer'] as num?)?.toDouble(),
      totalPrice: (json['totalPrice'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$ServiceModelToJson(ServiceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category_id': instance.categoryId,
      'name': instance.name,
      'price': instance.price,
      'retainer': instance.retainer,
      'selected': instance.selected,
      'attachmentsNumber': instance.attachmentsNumber,
      'isBride': instance.isBride,
      'totalPrice': instance.totalPrice,
      'bridemadesPrice': instance.bridemadesPrice,
      'bridemadesID': instance.bridemadesID,
      'bridemadesRetainer': instance.bridemadesRetainer,
    };
