// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeModel _$HomeModelFromJson(Map<String, dynamic> json) => HomeModel(
      title: json['title'] as String?,
      activeImg: json['active_img'] as String?,
      unactiveImg: json['unactive_img'] as String?,
    );

Map<String, dynamic> _$HomeModelToJson(HomeModel instance) => <String, dynamic>{
      'title': instance.title,
      'active_img': instance.activeImg,
      'unactive_img': instance.unactiveImg,
    };
