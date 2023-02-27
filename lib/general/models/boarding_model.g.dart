// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'boarding_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BoardingModel _$BoardingModelFromJson(Map<String, dynamic> json) =>
    BoardingModel(
      id: json['id'] as int,
      title: json['title'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$BoardingModelToJson(BoardingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'image': instance.image,
    };
