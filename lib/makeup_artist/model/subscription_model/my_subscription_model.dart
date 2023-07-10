import 'package:hwzn_herstation/makeup_artist/model/subscription_model/subscription_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'my_subscription_model.g.dart'; 

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class MySubscriptionModel {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'subscription')
  SubscriptionModel? subscription;
  @JsonKey(name: 'start_date')
  String? startDate;
  @JsonKey(name: 'expire_date')
  String? expireDate;
  @JsonKey(name: 'status')
  String? status;
  @JsonKey(name: 'remaining')
  int? remaining;

  MySubscriptionModel({this.id, this.subscription, this.startDate, this.expireDate, this.status, this.remaining});

   factory MySubscriptionModel.fromJson(Map<String, dynamic> json) => _$MySubscriptionModelFromJson(json);

   Map<String, dynamic> toJson() => _$MySubscriptionModelToJson(this);
}


