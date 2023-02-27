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

  Future<List<DropdownModel>> getUserTypes() => _generalHttpMethods.getUserTypes();

  Future<bool> register(RegisterModel model) => _generalHttpMethods.register(model);

  Future<bool> setUserLogin(String phone, String pass) => _generalHttpMethods.userLogin(phone, pass);

  Future<bool> activeAccount(String code, String phone) => _generalHttpMethods.activeAccount(code, phone);

  Future<bool> resendCode(String phone) => _generalHttpMethods.resendCode(phone);

  Future<dynamic> forgetPassword(String phone) => _generalHttpMethods.forgetPassword(phone);

  Future<dynamic> resetUserPassword(String phoneOrEmail, String newPassword) => _generalHttpMethods.resetUserPassword(phoneOrEmail, newPassword);

  Future<bool> sendMessage({String? name, String? mail, String? message}) => _generalHttpMethods.sendMessage(name, mail, message);

  Future<void> logOut() => _generalHttpMethods.logOut();
}
