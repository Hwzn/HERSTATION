import 'package:json_annotation/json_annotation.dart'; 

part 'gallery_model.g.dart'; 

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class GalleryModel {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'image')
  String? image;
  @JsonKey(name: 'collection')
  String? collection;
  @JsonKey(name: 'is_main')
  bool? isMain;

  GalleryModel({this.id, this.image, this.collection, this.isMain});

   factory GalleryModel.fromJson(Map<String, dynamic> json) => _$GalleryModelFromJson(json);

   Map<String, dynamic> toJson() => _$GalleryModelToJson(this);
}

