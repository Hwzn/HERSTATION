import 'package:json_annotation/json_annotation.dart';

part 'banner_model.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class BannerModel {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'desc')
  String? desc;
  @JsonKey(name: 'image')
  String? image;

  BannerModel({this.id, this.name, this.desc, this.image});

  factory BannerModel.fromJson(Map<String, dynamic> json) =>
      _$BannerModelFromJson(json);

  Map<String, dynamic> toJson() => _$BannerModelToJson(this);
}
