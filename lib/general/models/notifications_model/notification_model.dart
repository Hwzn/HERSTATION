import 'package:json_annotation/json_annotation.dart';

part 'notification_model.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class NotificationModel {
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'type')
  String? type;
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'body')
  String? body;
  // @JsonKey(name: 'data')
  // Data? data;
  @JsonKey(name: 'status')
  String? status;
  @JsonKey(name: 'time')
  String? time;

  NotificationModel(
      {this.id,
      this.type,
      this.title,
      this.body,
      // this.data,
      this.status,
      this.time});

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationModelToJson(this);
}

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class Data {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'amount')
  String? amount;
  @JsonKey(name: 'type')
  String? type;
  @JsonKey(name: 'gateway')
  String? gateway;
  @JsonKey(name: 'status')
  String? status;
  @JsonKey(name: 'online_payment_id')
  String? onlinePaymentId;

  Data(
      {this.id,
      this.amount,
      this.type,
      this.gateway,
      this.status,
      this.onlinePaymentId});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}