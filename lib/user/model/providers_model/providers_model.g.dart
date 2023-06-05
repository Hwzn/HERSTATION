// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProvidersModel _$ProvidersModelFromJson(Map<String, dynamic> json) =>
    ProvidersModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      image: json['image'] as String?,
      lang: json['lang'] as String?,
      isNotify: json['is_notify'] as int?,
      verfiyToken: json['verfiy_token'] as String?,
      token: json['token'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
      address: json['address'] as String?,
      userType: json['user_type'] == null
          ? null
          : UserType.fromJson(json['user_type'] as Map<String, dynamic>),
      provider: json['provider'] == null
          ? null
          : ProviderModel.fromJson(json['provider'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProvidersModelToJson(ProvidersModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'image': instance.image,
      'lang': instance.lang,
      'is_notify': instance.isNotify,
      'verfiy_token': instance.verfiyToken,
      'token': instance.token,
      'lat': instance.lat,
      'lng': instance.lng,
      'address': instance.address,
      'user_type': instance.userType,
      'provider': instance.provider,
    };
