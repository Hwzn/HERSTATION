// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SettingModel _$SettingModelFromJson(Map<String, dynamic> json) => SettingModel(
      about: json['about'] as String?,
      policy: json['policy'] as String?,
      terms: json['terms'] as String?,
      androidVersion: json['android_version'] as String?,
      iosVersion: json['ios_version'] as String?,
      androidLink: json['android_link'] as String?,
      iosLink: json['ios_link'] as String?,
      onboardPages: (json['onboarding'] as List<dynamic>?)
          ?.map((e) => SocialModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      socials: (json['socials'] as List<dynamic>?)
          ?.map((e) => SocialModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SettingModelToJson(SettingModel instance) =>
    <String, dynamic>{
      'about': instance.about,
      'policy': instance.policy,
      'terms': instance.terms,
      'android_version': instance.androidVersion,
      'ios_version': instance.iosVersion,
      'android_link': instance.androidLink,
      'ios_link': instance.iosLink,
      'onboarding': instance.onboardPages,
      'socials': instance.socials,
    };
