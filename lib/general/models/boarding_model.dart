import 'package:json_annotation/json_annotation.dart';

part 'boarding_model.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class BoardingModel {
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'image')
  String? image;

  BoardingModel({
    required this.id,
    this.title,
    this.description,
    this.image,
  });

  factory BoardingModel.fromJson(Map<String, dynamic> json) =>
      _$BoardingModelFromJson(json);

  Map<String, dynamic> toJson() => _$BoardingModelToJson(this);
}
