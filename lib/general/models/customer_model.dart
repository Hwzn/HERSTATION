import 'package:json_annotation/json_annotation.dart';

part 'customer_model.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class CustomerModel {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "username")
  String? username;
  @JsonKey(name: "phone")
  String? phone;
  @JsonKey(name: "email")
  String? email;

  CustomerModel({
    this.id,
    this.username,
    this.phone,
    this.email,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerModelFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerModelToJson(this);
}
