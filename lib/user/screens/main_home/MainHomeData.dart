part of 'MainHomeImports.dart';

class MainHomeData {
  final GenericBloc<int> tabsCubit = GenericBloc(0);
  GlobalKey<CustomButtonState> btnChoose = GlobalKey();
  GlobalKey scaffoldKey = GlobalKey();
  final GenericBloc<List<RegionModel>> regionCubit = GenericBloc([]);

  List<HomeModel> listHome = [];
  List<Widget> viewsList = [];
  String userProfile = "";
  String location = "";
  String userName = "";

  void changePage(int index) {
    tabsCubit.onUpdateData(index);
  }

  void initData(BuildContext context, int index) {
    tabsCubit.onUpdateData(index);
    listHome.add(HomeModel(
        title: "main", activeImg: Res.active_home, unactiveImg: Res.home));
    listHome.add(HomeModel(
        title: "favourite", activeImg: Res.active_fav, unactiveImg: Res.fav));
    listHome.add(HomeModel(
        title: "myAppointment",
        activeImg: Res.active_appointment,
        unactiveImg: Res.appointment));
    viewsList = [
      const Home(),
      const Favourite(),
      const MyAppointments(),
      const UserProfile(),
    ];

    initUserData(context);
  }

  void closeDialog(BuildContext context) {
    Navigator.of(context).pop();
  }

  void initUserData(BuildContext context) {
    var isAuth = context.read<AuthCubit>().state.authorized;
    if (isAuth) {
      var user = context.read<UserCubit>().state.model;
      userProfile = user.image ?? "";
      userName = user.name ?? "";
      location = user.address ?? "";
    }
  }

  void showDialogEnable(BuildContext buildContext) {
    showModalBottomSheet(
        // context: buildContext,
        context: scaffoldKey.currentContext!,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.0),
          ),
        ),
        builder: (context) {
          return BuildLocationEnableDialog(
            buildContext: context,
            mainHomeData: this,
          );
        });
    return;
  }

  Future<void> determinePosition(
      BuildContext dialogContext, BuildContext context) async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      CustomToast.showSimpleToast(msg: "قم بتفعيل خدمات الاتصال بالموقع");

      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    Position position = await Geolocator.getCurrentPosition();
    double longitude = position.longitude;
    double latitude = position.latitude;
    LatLng latLng = LatLng(longitude, latitude);

    String address = await MapMethods.getAddress(latLng, context);
    context.read<LocationCubit>().onLocationUpdated(
        LocationModel(lat: latitude ?? 0, lng: longitude ?? 0));
    updateAddress(context, dialogContext, latitude.toString(),
        longitude.toString(), address);
  }

  Future<void> updateAddress(BuildContext context, BuildContext contextDialog,
      String lat, String lng, String address) async {
    UpdateAddressData updateAddressData =
        UpdateAddressData(lng: lng, lat: lat, address: address);

    var result =
        await GeneralRepository(context).updateAddress(updateAddressData);
    if (result != null) {
      UserModel user = UserModel.fromJson(result["data"]["user"]);

      await Storage.saveUserData(user);
      context.read<UserCubit>().onUpdateUserData(user);
      context.read<AuthCubit>().onUpdateAuth(true);
      CustomToast.showSimpleToast(msg: "تم تحديث العنوان بنجاح");

      AutoRouter.of(context).pushAndPopUntil(
          MainHomeRoute(firstTime: false, index: 0),
          predicate: (o) => false);
    }
  }

  void showCityDialog(BuildContext context) {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.0),
          ),
        ),
        builder: (context) {
          return BuildCityViewDialog(
            buildContext: context,
            mainHomeData: this,
          );
        });
    return;
  }

  Future<List<RegionModel>> getRegions(BuildContext context) async {
    List<RegionModel> regions = await UserRepository(context).getRegions();
    regionCubit.onUpdateData(regions);
    return regions;
  }

  void updateCity(BuildContext context) {
    RegionModel regionModel = regionCubit.state.data.firstWhere(
        (element) => element.selected == true,
        orElse: () => RegionModel());
    if (regionModel.id == null) {
      CustomToast.showSimpleToast(msg: tr(context, "chooseCity"));
    } else {}
  }

  void setCity(BuildContext context) {
    var user = context.read<UserCubit>().state.model;

  }
}
