
import 'dart:io';

class RegisterModel {
  int userType;
  String firstName;
  String lastName;
  String email;
  String phone;
  String job;
  String password;
  String confirmPassword;
  String? deviceId;
  String deviceType;
  File? image;

  RegisterModel({
    required this.userType,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.job,
    required this.password,
    required this.confirmPassword,
    this.deviceId,
    required this.deviceType,
    this.image
  });


  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "phone": phone,
        "password": password,
        "password_confirmation": confirmPassword,
        "device_id": deviceId,
        "device_type": deviceType,
        "user_type": userType,
        "job": job,
        "image": image,
      };
}
