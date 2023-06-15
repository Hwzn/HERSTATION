import 'package:json_annotation/json_annotation.dart'; 

part 'rate_model.g.dart'; 

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class RateModel {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'author')
  String? author;
  @JsonKey(name: 'author_image')
  String? authorImage;
  @JsonKey(name: 'rate')
  int? rate;
  @JsonKey(name: 'comment')
  String? comment;

  RateModel({this.id, this.author, this.authorImage, this.rate, this.comment});

   factory RateModel.fromJson(Map<String, dynamic> json) => _$RateModelFromJson(json);

   Map<String, dynamic> toJson() => _$RateModelToJson(this);
}

