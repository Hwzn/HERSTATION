// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentModel _$PaymentModelFromJson(Map<String, dynamic> json) => PaymentModel(
      amount: (json['amount'] as num?)?.toDouble(),
      type: json['type'] as String?,
      gateway: json['gateway'] as String?,
      status: json['status'] as String?,
      onlinePaymentId: json['online_payment_id'] as String?,
      transactionableId: json['transactionable_id'] as int?,
      transactionableType: json['transactionable_type'] as String?,
    );

Map<String, dynamic> _$PaymentModelToJson(PaymentModel instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'type': instance.type,
      'gateway': instance.gateway,
      'status': instance.status,
      'online_payment_id': instance.onlinePaymentId,
      'transactionable_id': instance.transactionableId,
      'transactionable_type': instance.transactionableType,
    };
