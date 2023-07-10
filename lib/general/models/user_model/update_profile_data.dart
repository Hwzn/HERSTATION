import 'dart:io';

import 'package:image_picker/image_picker.dart';

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
  List<File>? gallery;

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
    this.gallery,
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
      "gallery[]":gallery
    };
    map.removeWhere((key, value) => value == null);
    return map;
  }
}
