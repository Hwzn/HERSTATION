part of 'GeneralRepoImports.dart';

class GeneralRepository {
  late BuildContext _context;
  late GeneralHttpMethods _generalHttpMethods;

  GeneralRepository(BuildContext context) {
    _context = context;
    _generalHttpMethods = GeneralHttpMethods(_context);
  }

  // setting
  Future<SettingModel> getAppSetting() => _generalHttpMethods.getAppSetting();

  Future<List<DropdownModel>> getUserTypes() =>
      _generalHttpMethods.getUserTypes();

  Future<bool> register(RegisterModel model) =>
      _generalHttpMethods.register(model);

  Future<dynamic> setUserLogin(String phone, String pass) =>
      _generalHttpMethods.userLogin(phone, pass);

  Future<bool> activeAccount(String code, String phone, String verifyToken) =>
      _generalHttpMethods.activeAccount(code, phone, verifyToken);

  Future<String> resendCode(String phone) =>
      _generalHttpMethods.resendCode(phone);

  Future<dynamic> forgetPassword(String phone) =>
      _generalHttpMethods.forgetPassword(phone);

  Future<bool> checkCode(String phone, String? code, String? verifyToken) =>
      _generalHttpMethods.checkCode(phone, code, verifyToken);

  Future<bool> resetUserPassword(String pass, String newPassword) =>
      _generalHttpMethods.resetUserPassword(pass, newPassword);

  Future<dynamic> completeAccount(CompleteAccountData completeAccountData) =>
      _generalHttpMethods.completeAcc(completeAccountData);

  Future<bool> sendMessage({String? phone, String? title, String? message}) =>
      _generalHttpMethods.sendMessage(phone, title, message);

  Future<dynamic> changePassword(
          String oldPass, String newPass, String retryNewPass) =>
      _generalHttpMethods.changePassword(oldPass, newPass, retryNewPass);

  Future<dynamic> updateProfile(UpdateProfileData updateProfileData) =>
      _generalHttpMethods.updateProfile(updateProfileData);

  Future<bool> logOut() => _generalHttpMethods.logOut();

  Future<List<NotificationModel>> getNotifications() =>
      _generalHttpMethods.getNotifications();

  Future<dynamic> updateAddress(UpdateAddressData updateAddressData) =>
      _generalHttpMethods.updateAddress(updateAddressData);

  Future<bool> deleteNotification(String id) =>
      _generalHttpMethods.deleteNotification(id);

  Future<bool> addNewService(AddServicesModel model) =>
      _generalHttpMethods.addNewServices(model);
}
