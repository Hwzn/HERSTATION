import 'package:json_annotation/json_annotation.dart'; 

part 'supscription_data.g.dart'; 

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class SupscriptionData {
  @JsonKey(name: 'coupon_id')
  int? coupon_id;
  @JsonKey(name: 'discount')
  double? discount;
  @JsonKey(name: 'total')
  double? total;
  @JsonKey(name: 'subscription_id')
  int? subscriptionID;

  SupscriptionData({this.total,this.coupon_id,this.discount,this.subscriptionID});

   factory SupscriptionData.fromJson(Map<String, dynamic> json) => _$SupscriptionDataFromJson(json);

   Map<String, dynamic> toJson() => _$SupscriptionDataToJson(this);
}

