import 'package:json_annotation/json_annotation.dart'; 

part 'subscription_model.g.dart'; 

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class SubscriptionModel {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'desc')
  String? desc;
  @JsonKey(name: 'period')
  int? period;
  @JsonKey(name: 'price')
  num? price;

  SubscriptionModel({this.id, this.name, this.desc, this.period, this.price});

   factory SubscriptionModel.fromJson(Map<String, dynamic> json) => _$SubscriptionModelFromJson(json);

   Map<String, dynamic> toJson() => _$SubscriptionModelToJson(this);
}

