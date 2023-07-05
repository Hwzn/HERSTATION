// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) =>
    NotificationModel(
      id: json['id'] as String?,
      type: json['type'] as String?,
      title: json['title'] as String?,
      body: json['body'] as String?,
      status: json['status'] as String?,
      time: json['time'] as String?,
    );

Map<String, dynamic> _$NotificationModelToJson(NotificationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'title': instance.title,
      'body': instance.body,
      'status': instance.status,
      'time': instance.time,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as int?,
      amount: json['amount'] as String?,
      type: json['type'] as String?,
      gateway: json['gateway'] as String?,
      status: json['status'] as String?,
      onlinePaymentId: json['online_payment_id'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'type': instance.type,
      'gateway': instance.gateway,
      'status': instance.status,
      'online_payment_id': instance.onlinePaymentId,
    };
