import 'package:hwzn_herstation/user/model/providers_details_model/rate_model.dart';
import 'package:json_annotation/json_annotation.dart';

import 'gallery_model.dart';

part 'provider_details_model.g.dart'; 

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class ProviderDetailsModel {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'gallery')
  List<GalleryModel>? gallery;
  @JsonKey(name: 'instructions')
  String? instructions;
  @JsonKey(name: 'rates')
  List<RateModel>? rates;
  @JsonKey(name: 'rate')
  String? rate;
  @JsonKey(name: 'rate_count')
  int? rateCount;
  @JsonKey(name: 'rates_avg')
  double? ratesAvg;

  ProviderDetailsModel({this.id, this.name, this.gallery, this.instructions, this.rates, this.rate, this.rateCount, this.ratesAvg});

   factory ProviderDetailsModel.fromJson(Map<String, dynamic> json) => _$ProviderDetailsModelFromJson(json);

   Map<String, dynamic> toJson() => _$ProviderDetailsModelToJson(this);
}

