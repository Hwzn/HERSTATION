import 'package:json_annotation/json_annotation.dart';

part 'social_model.g.dart'; 

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class SocialModel {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'desc')
  String? desc;
  @JsonKey(name: 'image')
  String? image;
  @JsonKey(name: 'link')
  String? link;

  SocialModel({this.id, this.title, this.desc, this.image,this.link});

   factory SocialModel.fromJson(Map<String, dynamic> json) => _$SocialModelFromJson(json);

   Map<String, dynamic> toJson() => _$SocialModelToJson(this);
}

