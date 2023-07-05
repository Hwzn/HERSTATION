import 'package:json_annotation/json_annotation.dart'; 

part 'provider_model.g.dart'; 

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class ProviderModel {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'image')
  String? image;
  @JsonKey(name: 'wallet_balance')
  String? walletBalance;
  @JsonKey(name: 'instructions')
  String? instructions;
  @JsonKey(name: 'rate')
  double? rate;
  @JsonKey(name: 'rate_count')
  int? rateCount;
  @JsonKey(name: 'rates_avg')
  int? ratesAvg;
  @JsonKey(name: 'is_approved')
  int? isApproved;
  @JsonKey(name:'contact_phone')
  String?contactPhone;

  ProviderModel({this.id, this.image, this.walletBalance, this.instructions,this.contactPhone, this.rate, this.rateCount, this.ratesAvg, this.isApproved});

   factory ProviderModel.fromJson(Map<String, dynamic> json) => _$ProviderModelFromJson(json);

   Map<String, dynamic> toJson() => _$ProviderModelToJson(this);
}

