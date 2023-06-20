// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterModel _$RegisterModelFromJson(Map<String, dynamic> json) =>
    RegisterModel(
      phone: json['phone'] as String?,
      userType: json['user_type'] as String?,
      deviceId: json['device_id'] as String?,
      deviceType: json['device_type'] as String?,
    );

Map<String, dynamic> _$RegisterModelToJson(RegisterModel instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'user_type': instance.userType,
      'device_id': instance.deviceId,
      'device_type': instance.deviceType,
    };
