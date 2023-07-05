import 'package:json_annotation/json_annotation.dart'; 

part 'rate_data.g.dart'; 

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class RateData {
  @JsonKey(name: 'rate')
  int? rate;
  @JsonKey(name: 'comment')
  String? comment;
  @JsonKey(name: 'provider_id')
  int? providerId;

  RateData({this.rate, this.comment, this.providerId});

   factory RateData.fromJson(Map<String, dynamic> json) => _$RateDataFromJson(json);

   Map<String, dynamic> toJson() => _$RateDataToJson(this);
}

