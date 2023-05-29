import 'package:json_annotation/json_annotation.dart'; 

part 'user_type.g.dart'; 

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class UserType {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;

  UserType({this.id, this.name});

   factory UserType.fromJson(Map<String, dynamic> json) => _$UserTypeFromJson(json);

   Map<String, dynamic> toJson() => _$UserTypeToJson(this);
}

