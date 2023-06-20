import 'package:json_annotation/json_annotation.dart'; 

part 'update_address_data.g.dart'; 

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class UpdateAddressData {
  @JsonKey(name: 'lat')
  String? lat;
  @JsonKey(name: 'lng')
  String? lng;
  @JsonKey(name: 'address')
  String? address;

  UpdateAddressData({this.lat, this.lng, this.address});

   factory UpdateAddressData.fromJson(Map<String, dynamic> json) => _$UpdateAddressDataFromJson(json);

   Map<String, dynamic> toJson() => _$UpdateAddressDataToJson(this);
}

