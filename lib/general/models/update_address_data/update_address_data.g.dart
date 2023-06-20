// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_address_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateAddressData _$UpdateAddressDataFromJson(Map<String, dynamic> json) =>
    UpdateAddressData(
      lat: json['lat'] as String?,
      lng: json['lng'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$UpdateAddressDataToJson(UpdateAddressData instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
      'address': instance.address,
    };
