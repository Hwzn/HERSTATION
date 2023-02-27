import 'package:hwzn_herstation/general/models/customer_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'UserModel.g.dart';

@JsonSerializable()
class UserModel {
  @JsonKey(name: "data")
  CustomerModel? data;
  @JsonKey(name: "userType")
  String? userType;
  @JsonKey(name: "token")
  String? token;

  UserModel({
     this.data,
     this.userType,
    this.token
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
