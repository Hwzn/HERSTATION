import 'package:json_annotation/json_annotation.dart';

import '../providers_details_model/rate_model.dart';

part 'rates_model.g.dart'; 

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class RatesModel {
  @JsonKey(name: 'rate')
  num? rate;
  @JsonKey(name: 'rate_count')
  int? rateCount;
  @JsonKey(name: 'comment_count')
  int? commentCount;
  @JsonKey(name: 'rates')
  List<RateModel>? rates;

  RatesModel({this.rate, this.rateCount, this.commentCount, this.rates});

   factory RatesModel.fromJson(Map<String, dynamic> json) => _$RatesModelFromJson(json);

   Map<String, dynamic> toJson() => _$RatesModelToJson(this);
}

