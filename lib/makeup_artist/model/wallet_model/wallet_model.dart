import 'package:json_annotation/json_annotation.dart'; 

part 'wallet_model.g.dart'; 

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class WalletModel {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'order_num')
  String? orderNum;
  @JsonKey(name: 'user')
  User? user;
  @JsonKey(name: 'retainer')
  num? retainer;
  @JsonKey(name: 'paid_amount')
  num? paidAmount;
  @JsonKey(name: 'reserved')
  num? reserved;
  @JsonKey(name: 'total')
  num? total;

  WalletModel({this.id, this.orderNum, this.user, this.retainer, this.paidAmount, this.reserved, this.total});

   factory WalletModel.fromJson(Map<String, dynamic> json) => _$WalletModelFromJson(json);

   Map<String, dynamic> toJson() => _$WalletModelToJson(this);
}

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class User {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'phone')
  String? phone;
  @JsonKey(name: 'image')
  String? image;

  User({this.id, this.name, this.email, this.phone, this.image});

   factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

   Map<String, dynamic> toJson() => _$UserToJson(this);
}

