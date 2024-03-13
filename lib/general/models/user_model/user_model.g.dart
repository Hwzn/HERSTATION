// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      image: json['image'] as String?,
      lang: json['lang'] as String?,
      isNotify: json['is_notify'] as int?,
      verfiyToken: json['verfiy_token'] as String?,
      token: json['token'] as String?,
      userType: json['user_type'] == null
          ? null
          : UserType.fromJson(json['user_type'] as Map<String, dynamic>),
      provider: json['provider'] == null
          ? null
          : ProviderModel.fromJson(json['provider'] as Map<String, dynamic>),
      address: json['address'] as String?,
      lat: json['lat'] as String?,
      lng: json['lng'] as String?,
      isActive: json['is_active'] as int?,
      cityID: json['city_id'] as int?,
      cityName: json['city_name'] as String?,
      regions: (json['regions'] as List<dynamic>?)
          ?.map((e) => RegionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      regionID: json['region_id'] as int?,
      regionName: json['region_name'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'image': instance.image,
      'lang': instance.lang,
      'is_notify': instance.isNotify,
      'verfiy_token': instance.verfiyToken,
      'token': instance.token,
      'user_type': instance.userType,
      'provider': instance.provider,
      'lat': instance.lat,
      'lng': instance.lng,
      'address': instance.address,
      'is_active': instance.isActive,
      'city_id': instance.cityID,
      'city_name': instance.cityName,
      'region_id': instance.regionID,
      'region_name': instance.regionName,
      'regions': instance.regions,
    };
