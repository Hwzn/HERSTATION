import 'package:json_annotation/json_annotation.dart';

part 'service_model.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class ServiceModel {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'category_id')
  int? categoryId;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'price')
  double? price;
  @JsonKey(name: 'retainer')
  double? retainer;

  bool? selected;
  int? attachmentsNumber;
  bool? isBride;
  double? totalPrice;
  double? totalRetainer;
  double? bridemadesPrice;
  int? bridemadesID;
  double? bridemadesRetainer;

  double? extraAmount;
  double? couponDiscount;
  double? totalAmount;
  double? addedValue;
  int? couponID;

  ServiceModel(
      {this.id,
      this.name,
      this.categoryId,
      this.price,
      this.retainer,
      this.selected = false,
      this.attachmentsNumber = 0,
      this.isBride,
      this.bridemadesID,
      this.bridemadesPrice,
      this.bridemadesRetainer,
      this.totalPrice = 0,
      this.totalAmount = 0,
      this.couponDiscount = 0,
      this.extraAmount = 0,
      this.couponID = 0,
      this.addedValue = 0,
      this.totalRetainer = 0});

  factory ServiceModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceModelFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceModelToJson(this);
}
