part of 'SplashImports.dart';

class SplashController {
  // variables
  Location location = Location();

  void manipulateSaveData(BuildContext context) async {
    await _determinePosition(context);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    var strUser = prefs.get("user");
    var strSettings = prefs.get("settings");

    if (context.mounted) {
      await updateLang(context);
    }
    if (strUser != null && strSettings != null && context.mounted) {
      context.read<AuthCubit>().onUpdateAuth(true);
      UserModel user = UserModel.fromJson(json.decode("$strUser"));
      GlobalState.instance.set("token", user.token);
      context.read<UserCubit>().onUpdateUserData(user);

      SettingModel settings =
          SettingModel.fromJson(json.decode("$strSettings"));
      context.read<SettingCubit>().onUpdateSettingData(settings);

      var userType = context.read<UserCubit>().state.model.userType?.id;
      if (context.mounted) {
        if (userType == 2) {
          AutoRouter.of(context).push(MainHomeRoute(firstTime: false));
        } else {
          AutoRouter.of(context).push(const MakeupArtistHomeRoute());
        }
      }
    } else {
      context.read<AuthCubit>().onUpdateAuth(false);
      var result = await GeneralRepository(context).getAppSetting();
      if (context.mounted) {
        context.read<SettingCubit>().onUpdateSettingData(result);
        await Storage.saveSettings(result);
      }
      await Storage.setUserType(2);
      if (context.mounted) {
        AutoRouter.of(context).push(const WelcomePageRoute());
      }
    }
  }

  Future<void> updateLang(BuildContext context) async {
    var lang = await Storage.getLang();
    InitUtils.initDio(lang: lang ?? "ar");
    InitUtils.initCustomWidgets(language: lang ?? "ar");
    if (context.mounted) {
      Utils.changeLanguage(lang ?? "ar", context);
      context.read<LangCubit>().onUpdateLanguage(lang ?? "ar");
    }
  }

  void setType() async {
    await Storage.setUserType(2);
  }

  Future<void> _determinePosition(BuildContext context) async {
    // bool serviceEnabled;
    // LocationPermission permission;
    //
    // serviceEnabled = await Geolocator.isLocationServiceEnabled();
    // if (!serviceEnabled) {
    //   return Future.error('Location services are disabled.');
    // }
    //
    // permission = await Geolocator.checkPermission();
    //
    // if (permission == LocationPermission.denied) {
    //   permission = await Geolocator.requestPermission();
    //   if (permission == LocationPermission.denied) {
    //     return Future.error('Location permissions are denied');
    //   }
    // }
    //
    // if (permission == LocationPermission.deniedForever) {
    //   // Permissions are denied forever, handle appropriately.
    //
    //   return Future.error(
    //       'Location permissions are permanently denied, we cannot request permissions.');
    // }
    // Position position = await Geolocator.getCurrentPosition();
    // double longitude = position.longitude;
    // double latitude = position.latitude;
    // // print(position.longitude.toString());
    // // print(position.latitude.toString());
    // if (context.mounted) {
    //   context.read<LocationCubit>().onLocationUpdated(
    //       LocationEntity(lat: latitude ?? 0, lng: longitude ?? 0));
    // }
  }
}
