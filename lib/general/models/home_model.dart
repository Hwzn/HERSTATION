import 'package:json_annotation/json_annotation.dart'; 

part 'home_model.g.dart'; 

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class HomeModel {
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'active_img')
  String? activeImg;
  @JsonKey(name: 'unactive_img')
  String? unactiveImg;

  HomeModel({this.title, this.activeImg, this.unactiveImg});

   factory HomeModel.fromJson(Map<String, dynamic> json) => _$HomeModelFromJson(json);

   Map<String, dynamic> toJson() => _$HomeModelToJson(this);
}

