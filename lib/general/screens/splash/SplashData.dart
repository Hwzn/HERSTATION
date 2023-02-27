part of 'SplashImports.dart';

class SplashController {
  // variables
  Location location = Location();

  // methods
  void checkingData(BuildContext context) async {
    // if (!kIsWeb) GlobalNotification.instance.setupNotification(context);
    Future.delayed(const Duration(milliseconds: 1500),() => manipulateSplashData(context));
  }

  Future<void> manipulateSplashData(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //await location.requestPermission();
    var lang = await Storage.getLang();
    InitUtils.initDio(lang: lang ?? "ar");
    InitUtils.initCustomWidgets(language: lang ?? "ar");
    Utils.changeLanguage(lang ?? "ar", context);
    setType();
    // await GeneralRepository(context).getAppSetting();
    AutoRouter.of(context).push(const WelcomePageRoute());
    // AutoRouter.of(context).push(const MainHomeRoute());
    // var strUser = prefs.get("user");
    // if (strUser != null) {
    //   UserModel data = UserModel.fromJson(json.decode("$strUser"));
    //   GlobalState.instance.set("token", data.token);
    //   Utils.setCurrentUserData(data, context);
    // } else {
    //   context.read<AuthCubit>().onUpdateAuth(false);
    //   AutoRouter.of(context).push(const HomeRoute());
    // }
  }

  void setType() async {
    await Storage.setUserType("0");
  }
}
