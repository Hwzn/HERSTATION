import 'dart:io';

class CompleteAccountData {
  String? name;

  String? deviceId;
  String? deviceType;
  String? password;
  String? userType;
  String? email;
  String? passwordConfirmation;
  File? image;
  String? contactPhone;

  CompleteAccountData({
    this.password,
    this.name,
    this.deviceId,
    this.deviceType,
    this.userType,
    this.email,
    this.passwordConfirmation,
    this.image,this.contactPhone
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "name": name,
      "password": password,
      "device_id": deviceId,
      "device_type": deviceType,
      "user_type": userType,
      "email": email,
      "password_confirmation": passwordConfirmation,
      "image":image,
      "contact_phone":contactPhone,
    };
    map.removeWhere((key, value) => value == null);
    return map;
  }
}
