part of 'MakeupArtistHomeImports.dart';

class MakeupArtistHomeData {
  final GenericBloc<int> tabsCubit = GenericBloc(0);

  List<Widget> viewsList = [];
  List<HomeModel> listHome = [];
  String userProfile = "";
  String location = "";
  String userName = "";
  GlobalKey scaffoldKey = GlobalKey();

  void changePage(int index) {
    tabsCubit.onUpdateData(index);
  }

  void initData(BuildContext context) {
    listHome.add(HomeModel(
        title: "main", activeImg: Res.active_home, unactiveImg: Res.home));
    listHome.add(HomeModel(
        title: "myAppointment",
        activeImg: Res.active_appointment,
        unactiveImg: Res.appointment));
    viewsList = [
      const MakeupArtistMain(),
      const MyAppointments(),
      const UserProfile(),
    ];
    initUserData(context);
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
          return BuildLocationEnableDialogMakeUp(
            buildContext: context,
            makeupArtistHomeData: this,
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
    final coordinates = c1.Coordinates(latitude, longitude);
    var addresses =
        await c1.Geocoder.local.findAddressesFromCoordinates(coordinates);
    String address = addresses.first.addressLine ?? "";

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
          MakeupArtistHomeRoute(firstTime: false),
          predicate: (o) => false);
    }
  }
}
