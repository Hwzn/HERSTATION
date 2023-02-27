part of 'UserProfileImports.dart';

class UserProfileData {
  ///////////// keys /////////////

  final GlobalKey<CustomButtonState> btnCancelAcc =
      GlobalKey<CustomButtonState>();
  final GlobalKey<CustomButtonState> btnLogout = GlobalKey<CustomButtonState>();
  final GlobalKey<CustomButtonState> btnChangeLanguage =
      GlobalKey<CustomButtonState>();

  ///////////// cubits /////////////

  final GenericBloc<bool> isMakeupArtistCubit = GenericBloc(false);

  List<GeneralModel> list = [];
  List<GeneralModel> infoList = [];

  void checkUser() async {
    String type = await Storage.getUserType() ?? "0";
    if (type == "1") {
      isMakeupArtistCubit.onUpdateData(true);
    }
  }

  void initListData() {
    list.add(GeneralModel(title: "aboutUs", img: Res.aboutus));
    list.add(GeneralModel(title: "language", img: Res.lang));
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

  void logout(BuildContext context) {
    Navigator.of(context).pop();
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

  void changeLanguage() {}

  //////////////////// share ////////////////////

  Future<void> share() async {
    await FlutterShare.share(
        title: 'Share',
        text: 'Share app',
        linkUrl: 'https://flutter.dev/',
        chooserTitle: 'Chooser App');
  }
}
