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
  double? bridemadesPrice;
  int? bridemadesID;
  double? bridemadesRetainer;

  ServiceModel({this.id,
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
    this.totalPrice = 0});

  factory ServiceModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceModelFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceModelToJson(this);
}
