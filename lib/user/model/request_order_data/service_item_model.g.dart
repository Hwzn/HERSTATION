// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceItemModel _$ServiceItemModelFromJson(Map<String, dynamic> json) =>
    ServiceItemModel(
      serviceId: json['service_id'] as int?,
      quantity: json['quantity'] as int?,
    );

Map<String, dynamic> _$ServiceItemModelToJson(ServiceItemModel instance) =>
    <String, dynamic>{
      'service_id': instance.serviceId,
      'quantity': instance.quantity,
    };
