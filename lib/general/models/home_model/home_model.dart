import 'package:hwzn_herstation/general/models/home_model/provider_model.dart';
import 'package:json_annotation/json_annotation.dart';

import 'banner_model.dart';
import 'category_model.dart';

part 'home_model.g.dart'; 

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class HomeDataModel {
  @JsonKey(name: 'banners')
  List<BannerModel>? banners;
  @JsonKey(name: 'categories')
  List<CategoryModel>? categories;
  @JsonKey(name: 'providers')
  List<ProviderModel>? providers;

  HomeDataModel({this.banners, this.categories, this.providers});

   factory HomeDataModel.fromJson(Map<String, dynamic> json) => _$HomeDataModelFromJson(json);

   Map<String, dynamic> toJson() => _$HomeDataModelToJson(this);
}

