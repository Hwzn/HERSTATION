// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rate_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RateModel _$RateModelFromJson(Map<String, dynamic> json) => RateModel(
      id: json['id'] as int?,
      author: json['author'] as String?,
      authorImage: json['author_image'] as String?,
      rate: json['rate'] as int?,
      comment: json['comment'] as String?,
    );

Map<String, dynamic> _$RateModelToJson(RateModel instance) => <String, dynamic>{
      'id': instance.id,
      'author': instance.author,
      'author_image': instance.authorImage,
      'rate': instance.rate,
      'comment': instance.comment,
    };
