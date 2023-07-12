import 'package:json_annotation/json_annotation.dart'; 

part 'payment_model.g.dart'; 

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class PaymentModel {
  @JsonKey(name: 'amount')
  double? amount;
  @JsonKey(name: 'type')
  String? type;
  @JsonKey(name: 'gateway')
  String? gateway;
  @JsonKey(name: 'status')
  String? status;
  @JsonKey(name: 'online_payment_id')
  String? onlinePaymentId;
  @JsonKey(name: 'transactionable_id')
  int? transactionableId;
  @JsonKey(name: 'transactionable_type')
  String? transactionableType;

  PaymentModel({this.amount, this.type, this.gateway, this.status, this.onlinePaymentId, this.transactionableId, this.transactionableType});

   factory PaymentModel.fromJson(Map<String, dynamic> json) => _$PaymentModelFromJson(json);

   Map<String, dynamic> toJson() => _$PaymentModelToJson(this);
}

