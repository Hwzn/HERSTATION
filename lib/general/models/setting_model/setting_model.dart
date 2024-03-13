import 'package:hwzn_herstation/general/models/setting_model/social_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'setting_model.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class SettingModel {
  @JsonKey(name: 'about')
  String? about;
  @JsonKey(name: 'policy')
  String? policy;
  @JsonKey(name: 'terms')
  String? terms;
  @JsonKey(name: 'android_version')
  String? androidVersion;
  @JsonKey(name: 'ios_version')
  String? iosVersion;
  @JsonKey(name: 'android_link')
  String? androidLink;
  @JsonKey(name: 'ios_link')
  String? iosLink;
  @JsonKey(name: 'onboarding')
  List<SocialModel>? onboardPages;
  @JsonKey(name: 'socials')
  List<SocialModel>? socials;
  @JsonKey(name: 'app_percentage')
  String? appPercentage;

  SettingModel(
      {this.about,
      this.policy,
      this.terms,
      this.androidVersion,
      this.iosVersion,
      this.androidLink,
      this.iosLink,
      this.onboardPages,
      this.socials,
      this.appPercentage});

  factory SettingModel.fromJson(Map<String, dynamic> json) =>
      _$SettingModelFromJson(json);

  Map<String, dynamic> toJson() => _$SettingModelToJson(this);
}
