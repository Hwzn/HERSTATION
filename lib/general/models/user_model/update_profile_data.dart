import 'dart:io';

class UpdateProfileData {
  String? name;
  String? email;
  String? phone;
  String? deviceId;
  String? userType;
  String? deviceType;
  String? contactPhone;
  String? instructions;
  File? image;

  UpdateProfileData({
    this.email,
    this.name,
    this.deviceId,
    this.deviceType,
    this.userType,
    this.phone,
    this.instructions,
    this.contactPhone,
    this.image,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "name": name,
      "phone": phone,
      "device_id": deviceId,
      "device_type": deviceType,
      "user_type": userType,
      "email": email,
      "image": image,
      "instructions": instructions,
      "contact_phone": contactPhone,
    };
    map.removeWhere((key, value) => value == null);
    return map;
  }
}
