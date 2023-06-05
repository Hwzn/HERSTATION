import 'package:hwzn_herstation/general/models/user_model/provider_model.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../general/models/user_model/user_type.dart';

part 'providers_model.g.dart'; 

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class ProvidersModel {
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
  @JsonKey(name: 'lat')
  double? lat;
  @JsonKey(name: 'lng')
  double? lng;
  @JsonKey(name: 'address')
  String? address;
  @JsonKey(name: 'user_type')
  UserType? userType;
  @JsonKey(name: 'provider')
  ProviderModel? provider;

  ProvidersModel({this.id, this.name, this.email, this.phone, this.image, this.lang, this.isNotify, this.verfiyToken, this.token, this.lat, this.lng, this.address, this.userType, this.provider});

   factory ProvidersModel.fromJson(Map<String, dynamic> json) => _$ProvidersModelFromJson(json);

   Map<String, dynamic> toJson() => _$ProvidersModelToJson(this);
}

