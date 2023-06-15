// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gallery_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GalleryModel _$GalleryModelFromJson(Map<String, dynamic> json) => GalleryModel(
      id: json['id'] as int?,
      image: json['image'] as String?,
      collection: json['collection'] as String?,
      isMain: json['is_main'] as bool?,
    );

Map<String, dynamic> _$GalleryModelToJson(GalleryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'collection': instance.collection,
      'is_main': instance.isMain,
    };
