import 'package:hwzn_herstation/general/models/user_model/provider_model.dart';
import 'package:hwzn_herstation/general/models/user_model/user_type.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../user/model/region_model/region_model.dart';

part 'user_model.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class UserModel {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'phone')
  String? phone;
  @JsonKey(name: 'image')
  String? image;
  @JsonKey(name: 'lang')
  String? lang;
  @JsonKey(name: 'is_notify')
  int? isNotify;
  @JsonKey(name: 'verfiy_token')
  String? verfiyToken;
  @JsonKey(name: 'token')
  String? token;
  @JsonKey(name: 'user_type')
  UserType? userType;
  @JsonKey(name: 'provider')
  ProviderModel? provider;
  @JsonKey(name: 'lat')
  String? lat;
  @JsonKey(name: 'lng')
  String? lng;
  @JsonKey(name: 'address')
  String? address;
  @JsonKey(name: 'is_active')
  int? isActive;
  @JsonKey(name: 'city_id')
  int? cityID;
  @JsonKey(name: 'city_name')
  String? cityName;
  @JsonKey(name: 'region_id')
  int? regionID;
  @JsonKey(name: 'region_name')
  String? regionName;
  @JsonKey(name: 'regions')
  List<RegionModel>? regions;

  UserModel(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.image,
      this.lang,
      this.isNotify,
      this.verfiyToken,
      this.token,
      this.userType,
      this.provider,
      this.address,
      this.lat,
      this.lng,
      this.isActive,
      this.cityID,
      this.cityName,
      this.regions,this.regionID,this.regionName});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
