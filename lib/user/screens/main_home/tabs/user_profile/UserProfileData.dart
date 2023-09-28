part of 'UserProfileImports.dart';

class UserProfileData {
  ///////////// keys /////////////

  final GlobalKey<CustomButtonState> btnCancelAcc =
      GlobalKey<CustomButtonState>();
  final GlobalKey<CustomButtonState> btnLogout = GlobalKey<CustomButtonState>();
  final GlobalKey<CustomButtonState> btnChangeLanguage =
      GlobalKey<CustomButtonState>();
  final GenericBloc<bool> showLayout = GenericBloc(false);

  ///////////// cubits /////////////

  final GenericBloc<bool> isMakeupArtistCubit = GenericBloc(false);
  final GenericBloc<bool> isArabicLangCubit = GenericBloc(false);

  List<GeneralModel> list = [];
  List<GeneralModel> infoList = [];

  void checkUser(BuildContext context) async {
    int type = context.read<UserCubit>().state.model.userType!.id!;
    if (type == 3) {
      isMakeupArtistCubit.onUpdateData(true);
    }
    var isAuth = context.read<AuthCubit>().state.authorized;
    if (isAuth) {
      showLayout.onUpdateData(true);
    } else {
      showLayout.onUpdateData(false);
    }
  }

  void initListData() {
    list.add(GeneralModel(title: "aboutUs", img: Res.aboutus));
    list.add(GeneralModel(title: "changeLang", img: Res.lang));
    list.add(GeneralModel(title: "terms", img: Res.contactus));
    list.add(GeneralModel(title: "contactUs", img: Res.contactus));
    list.add(GeneralModel(title: "shareApp", img: Res.share));
    createInfoList();
  }

  void createInfoList() {
    infoList.add(GeneralModel(title: "myWallet", img: Res.my_wallet));
    infoList.add(GeneralModel(title: "myServices", img: Res.my_services));
    infoList.add(GeneralModel(title: "availableTime", img: Res.time));
    infoList.add(GeneralModel(title: "subscriptions", img: Res.subscriptions));
    infoList
        .add(GeneralModel(title: "mySubscriptions", img: Res.subscriptions));
  }

  void moveToPage(String title, BuildContext context) {
    if (title == tr(context, "aboutUs")) {
      AutoRouter.of(context).push(const AboutRoute());
    } else if (title == tr(context, "changeLang")) {
      chooseLanguage(context);
    } else if (title == tr(context, "terms")) {
      AutoRouter.of(context).push(const TermsRoute());
    } else if (title == tr(context, "contactUs")) {
      AutoRouter.of(context).push(const ContactUsRoute());
    } else if (title == tr(context, "shareApp")) {
      share();
    } else if (title == tr(context, "availableTime")) {
      AutoRouter.of(context).push(const AvailableTimesRoute());
    } else if (title == tr(context, "subscriptions")) {
      AutoRouter.of(context).push(const SubscriptionsRoute());
    } else if (title == tr(context, "myServices")) {
      AutoRouter.of(context).push(const MyServicesRoute());
    } else if (title == tr(context, "myWallet")) {
      AutoRouter.of(context).push(const MyWalletRoute());
    } else if (title == tr(context, "mySubscriptions")) {
      AutoRouter.of(context).push(const MySubscriptionsRoute());
    }
  }

  //////////////// cancel account //////////////////

  void confirmCancelAccount(BuildContext context) {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.0),
          ),
        ),
        builder: (context) {
          return BuildCancelAccountDialog(
            buildContext: context,
            userProfileData: this,
          );
        });
    return;
  }

  void cancelAccount(BuildContext context) {
    Navigator.of(context).pop();
  }

  //////////////// logout ////////////////

  void confirmLogout(BuildContext context) {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.0),
          ),
        ),
        builder: (context) {
          return BuildLogoutDialog(
            buildContext: context,
            userProfileData: this,
          );
        });
    return;
  }

  void logout(BuildContext context) async {
    var data = await GeneralRepository(context).logOut();
    if (data == true && context.mounted) {
      EasyLoading.dismiss();
      GlobalState.instance.set("token", "");
      Storage.clearSavedData();
      context.read<AuthCubit>().onUpdateAuth(false);
      context.read<UserCubit>().onUpdateUserData(UserModel());
      CustomToast.showSimpleToast(msg:tr(context,"logoutSuccess"));
      // Phoenix.rebirth(context);
      AutoRouter.of(context).push(const LoginRoute());
    }
  }

  moveToInfo(BuildContext context) {
    var isAuth = context.read<AuthCubit>().state.authorized;
    if (isAuth) {
      AutoRouter.of(context).push(const EditProfileRoute());
    } else {
      CustomToast.showSimpleToast(msg: tr(context, "loginFirst"));
    }
  }

//////////////// change language ////////////////

  void chooseLanguage(BuildContext context) {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.0),
          ),
        ),
        builder: (context) {
          return BuildChangeLanguageDialog(
            buildContext: context,
            userProfileData: this,
          );
        });
    return;
  }

  void changeLanguage(BuildContext context, String lang) async {
    var change = await GeneralRepository(context).changeLanguage(lang);
    if (change == true && context.mounted) {
      Utils.changeLanguage(lang, context);
      if (lang == "ar") {
        isArabicLangCubit.onUpdateData(true);
      } else {
        isArabicLangCubit.onUpdateData(false);
      }
      LoadingDialog.showLoadingDialog();
      var result = await GeneralRepository(context).getAppSetting();
      EasyLoading.dismiss();
      if (context.mounted) {
        context.read<SettingCubit>().onUpdateSettingData(result);
        await Storage.saveSettings(result);
        int type = context.read<UserCubit>().state.model.userType!.id!;
        if (context.mounted) {
          if (type == 2) {
            AutoRouter.of(context).pushAndPopUntil( MainHomeRoute(firstTime: false,index: 0), predicate: (o) => false);
          } else {
            AutoRouter.of(context).pushAndPopUntil( MakeupArtistHomeRoute(firstTime: false,index: 0), predicate: (o) => false);
          }
        }
      }


      // Navigator.of(context).pop();
    }
  }

  void getLang() async {
    var lang = await Storage.getLang();
    if (lang == "ar") {
      isArabicLangCubit.onUpdateData(true);
    } else {
      isArabicLangCubit.onUpdateData(false);
    }
  }

  //////////////////// share ////////////////////

  Future<void> share() async {
    await FlutterShare.share(
        title: 'Share',
        text: 'Share app',
        linkUrl: 'https://flutter.dev/',
        chooserTitle: 'Chooser App');
  }
}
