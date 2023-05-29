import 'package:json_annotation/json_annotation.dart';

part 'register_model.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class RegisterModel {
  @JsonKey(name: 'phone')
  String? phone;
  @JsonKey(name: 'user_type')
  String? userType;
  @JsonKey(name: 'device_id')
  String? deviceId;
  @JsonKey(name: 'device_type')
  String? deviceType;

  RegisterModel({this.phone, this.userType, this.deviceId, this.deviceType});

  factory RegisterModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterModelToJson(this);
}
