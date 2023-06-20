// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'region_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegionModel _$RegionModelFromJson(Map<String, dynamic> json) => RegionModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      cities: (json['cities'] as List<dynamic>?)
          ?.map((e) => CityModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RegionModelToJson(RegionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'cities': instance.cities,
    };
