import 'package:json_annotation/json_annotation.dart'; 

part 'general_model.g.dart'; 

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class GeneralModel {
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'img')
  String? img;

  GeneralModel({this.title, this.img});

   factory GeneralModel.fromJson(Map<String, dynamic> json) => _$GeneralModelFromJson(json);

   Map<String, dynamic> toJson() => _$GeneralModelToJson(this);
}

