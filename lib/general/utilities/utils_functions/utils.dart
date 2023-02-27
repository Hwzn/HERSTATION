part of 'UtilsImports.dart';

class Utils {
  static Future<bool> manipulateLoginData(
      BuildContext context, dynamic data, String token) async {
    if (data != null) {
      await Storage.setDeviceId(token);
      UserModel user = UserModel.fromJson(data);
      user.token = data["data"]["token"];
      GlobalState.instance.set("token", data["data"]["token"]);
      await Storage.saveUserData(user);
      setCurrentUserData(user, context);
      CustomToast.showSimpleToast(msg: data["message"]);
      return true;
    } else {
      CustomToast.showSimpleToast(msg: data["message"]);
      return false;
    }
  }

  static Future<dynamic> manipulateActiveData(
      BuildContext context, dynamic data, String token) async {
    if (data != null && data["status"] == 200) {
      await Storage.setDeviceId(token);
      UserModel user = UserModel.fromJson(data);
      user.token = data["data"]["token"];
      GlobalState.instance.set("token", data["data"]["token"]);
      await Storage.saveUserData(user);
      setCurrentUserData(user, context);
      CustomToast.showSimpleToast(msg: data["message"]);
      return data;
    } else {
      return data;
    }
  }

  static void setCurrentUserData(UserModel model, BuildContext context) async {
    context.read<UserCubit>().onUpdateUserData(model);
    context.read<AuthCubit>().onUpdateAuth(true);

    // route to home page
  }

  static void changeLanguage(String lang, BuildContext context) {
    DioUtils.lang = lang;
    DecorationUtils.lang = lang;
    Storage.setLang(lang);
    context.read<LangCubit>().onUpdateLanguage(lang);
  }
}
