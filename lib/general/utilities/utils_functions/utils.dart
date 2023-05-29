part of 'UtilsImports.dart';

class Utils {
  static Future<bool> manipulateLoginData(
      BuildContext context, dynamic data) async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    String? firebaseToken = await messaging.getToken();
    if (data != null) {
      await Storage.setDeviceId(firebaseToken!);
      UserModel user = UserModel.fromJson(data["data"]["user"]);
      GlobalState.instance.set("token", user.token!);
      await Storage.saveUserData(user);

      if (context.mounted) {
        await setCurrentUserData(user, context);
      }
      CustomToast.showSimpleToast(msg: data["message"]);
      return true;
    } else {
      CustomToast.showSimpleToast(msg: data["message"]);
      return false;
    }
  }

  static Future<dynamic> manipulateActiveData(
      BuildContext context, dynamic data) async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    String? firebaseToken = await messaging.getToken();
    if (data != null) {
      await Storage.setDeviceId(firebaseToken!);
      UserModel user = UserModel.fromJson(data["data"]["user"]);
      GlobalState.instance.set("token", user.token!);
      await Storage.saveUserData(user);
      if (context.mounted) {
        await setCurrentUserData(user, context);
      }
      CustomToast.showSimpleToast(msg: data["message"]);
      return data;
    } else {
      CustomToast.showSimpleToast(msg: data["message"]);
      return data;
    }
  }
  static Future<dynamic> manipulateUpdateData(
      BuildContext context, dynamic data,EditProfileData editProfileData) async {
    if (data != null) {
      UserModel user = UserModel.fromJson(data["data"]["user"]);
      await Storage.saveUserData(user);
      if (context.mounted) {
        await setCurrentUserData(user, context);
      }
      if (context.mounted) {
        showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(25.0),
              ),
            ),
            builder: (context) {
              return BuildSaveChangesDialog(
                buildContext: context,
                editProfileData: editProfileData,
              );
            });
      }

      return data;
    } else {
      CustomToast.showSimpleToast(msg: data["message"]);
      return data;
    }
  }

  static Future<bool> setCurrentUserData(
      UserModel model, BuildContext context) async {
    context.read<UserCubit>().onUpdateUserData(model);
    context.read<AuthCubit>().onUpdateAuth(true);
    return true;
  }

  static void changeLanguage(String lang, BuildContext context) {
    DioUtils.lang = lang;
    DecorationUtils.lang = lang;
    Storage.setLang(lang);
    context.read<LangCubit>().onUpdateLanguage(lang);
  }

  static Future<File?> getImageFile(BuildContext context) async {
    FocusScope.of(context).requestFocus(FocusNode());
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );
    if (result != null) {
      File imageFile = File(result.files.single.path!);
      return imageFile;
    }
    return null;
  }

}
