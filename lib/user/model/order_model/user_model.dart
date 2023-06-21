import 'package:json_annotation/json_annotation.dart'; 

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

  UserModel({this.id, this.name, this.email, this.phone, this.image});

   factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

   Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

