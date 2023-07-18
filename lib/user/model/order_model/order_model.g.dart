// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
      id: json['id'] as int?,
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      orderNum: json['order_num'] as String?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => ItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      provider: json['provider'] == null
          ? null
          : ProviderItemModel.fromJson(
              json['provider'] as Map<String, dynamic>),
      date: json['date'] as String?,
      paymentMethod: json['payment_method'] as String?,
      paymentStatus: json['payment_status'] as String?,
      status: json['status'] as String?,
      retainer: (json['retainer'] as num?)?.toDouble(),
      paidAmount: (json['paid_amount'] as num?)?.toDouble(),
      reserved: (json['reserved'] as num?)?.toDouble(),
      region: json['region'] == null
          ? null
          : CityModel.fromJson(json['region'] as Map<String, dynamic>),
      city: json['city'] == null
          ? null
          : CityModel.fromJson(json['city'] as Map<String, dynamic>),
      statusCode: json['status_code'] as int?,
      total: (json['total'] as num?)?.toDouble(),
      address: json['address'] as String?,
      selected: json['selected'] as bool?,
    );

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order_num': instance.orderNum,
      'items': instance.items,
      'provider': instance.provider,
      'date': instance.date,
      'payment_method': instance.paymentMethod,
      'payment_status': instance.paymentStatus,
      'status': instance.status,
      'address': instance.address,
      'status_code': instance.statusCode,
      'retainer': instance.retainer,
      'paid_amount': instance.paidAmount,
      'reserved': instance.reserved,
      'total': instance.total,
      'region': instance.region,
      'city': instance.city,
      'user': instance.user,
      'selected': instance.selected,
    };
